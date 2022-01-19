package com.homeart.service.picShare;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.member.MemberVO;
import com.homeart.domain.picShare.picBoardVO;
import com.homeart.domain.picShare.picLikeVO;
import com.homeart.domain.picShare.picPageInfoVO;
import com.homeart.mapper.picShare.picBoardMapper;

import lombok.Setter;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class picBoardService {

	@Setter(onMethod_ = @Autowired)
	private picBoardMapper boardMapper;

	@Value("${aws.accessKeyId}")
	private String accessKeyId;

	@Value("${aws.secretAccessKey}")
	private String secretAccessKey;

	@Value("${aws.bucketName}")
	private String bucketName;

	private Region region = Region.AP_NORTHEAST_2;

	private S3Client s3;

	@PostConstruct
	public void init() {
		// spring bean이 만들어진 후 최초로 실행되는 코드 작성

		// 권한 정보 객체
		AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKeyId, secretAccessKey);

		// crud 가능한 s3 client 객체 생성
		this.s3 = S3Client.builder().credentialsProvider(StaticCredentialsProvider.create(credentials)).region(region)
				.build();

	}

	// s3에서 key로 객체 삭제
	private void deleteObject(String key) {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder().bucket(bucketName).key(key).build();

		s3.deleteObject(deleteObjectRequest);
	}

	// s3에서 key로 객체 업로드(put)
	private void putObject(String key, Long size, InputStream source) {
		PutObjectRequest pubObjectRequest = PutObjectRequest.builder().bucket(bucketName).key(key)
				.acl(ObjectCannedACL.PUBLIC_READ).build();

		RequestBody requestBody = RequestBody.fromInputStream(source, size);
		s3.putObject(pubObjectRequest, requestBody);
	}

	public ArrayList<picBoardVO> getList(picBoardVO board) {

		return (ArrayList<picBoardVO>) boardMapper.getList(board);
	}

	public List<picBoardVO> getLikeId(String member_id) {

		List<picBoardVO> getLikeIdOne = null;
		
		getLikeIdOne = (List<picBoardVO>) boardMapper.getLikeIdOne(member_id);
		
		System.out.println("service");

		System.out.println(getLikeIdOne);

		return getLikeIdOne;
		
	}

	public ArrayList<picBoardVO> getWeeklyList(picBoardVO board) {
		return (ArrayList<picBoardVO>) boardMapper.getWeeklyList(board);
	}

	public ArrayList<picBoardVO> getMonthlyList(picBoardVO board) {
		return (ArrayList<picBoardVO>) boardMapper.getMonthlyList(board);
	}

	public ArrayList<picBoardVO> getYearlyList(picBoardVO board) {
		return (ArrayList<picBoardVO>) boardMapper.getYearlyList(board);
	}

	public int getCountRow(picBoardVO board) {

		// 게시물 갯수 가져오기
		int result = boardMapper.card_count(board);

		return result;
	}

	public List<picBoardVO> getArtist(Integer id) {

		return boardMapper.getArtist(id);
	}

	public List<picBoardVO> getWriterArt(Integer id) {

		return boardMapper.getWriterArt(id);
	}

	public int getWriterArtCnt(Integer id) {

		return boardMapper.getWriterArtCnt(id);
	}

	public picBoardVO get(Integer id) {
		return boardMapper.read(id);
	}

	@Transactional
	public void register(picBoardVO board, MultipartFile file) throws Exception {

		if (file != null && file.getSize() > 0) {
			boardMapper.insert(board);

			// 1. s3에 file 작성
			String key = "picShare/" + board.getBoard_id() + "/" + file.getOriginalFilename();
			putObject(key, file.getSize(), file.getInputStream());

			// 2. insert into File, DATABASE
			// filename을 multipartFile에서 가져와서 picBoard 테이블에 추가하는 메서드 추가

		}

		return;

	}

	@Transactional
	public boolean remove(@RequestParam("id") Integer id, MultipartFile file) {

		if (file != null && file.getSize() > 0) {
			boardMapper.delete(id);

			String key = "picShare/" + id + "/" + file;
			deleteObject(key);

		}

		return boardMapper.delete(id) == 1;

	}

	@Transactional
	public boolean modify(picBoardVO board) {

		return boardMapper.update(board) == 1;

	}

	public picBoardVO saveHeart(picLikeVO likeVO) {

		picBoardVO board = new picBoardVO();
		board.setBoard_id(likeVO.getBoard_id());

		// like 테이블에 추가
		int result = boardMapper.insertLike(likeVO);

		System.out.println(board);

		// like 테이블에 좋아요 삭제가 성공한다면?
		if (result == 1) {
			// 갱신된 하트수를 가져옴
			boardMapper.likeUp(board.getBoard_id());
			board.setLike_cnt(boardMapper.heart_count(board));

		}

		System.out.println("cnt");
		System.out.println(board.getLike_cnt());
		System.out.println("id");
		System.out.println(board.getLike_id());

		return board;

	}

	public picBoardVO removeHeart(picLikeVO likeVO) {

		// board 테이블에 해당 게시물의 heart수를 -1 하기 위한 board 세팅
		picBoardVO board = new picBoardVO();
		board.setBoard_id(likeVO.getBoard_id());

		// like 테이블에 삭제
		int result = boardMapper.deleteLike(likeVO);

		System.out.println(board);

		// like 테이블에 좋아요 삭제가 성공한다면?
		if (result == 1) {
			// 갱신된 하트수를 가져옴
			boardMapper.likeUp(board.getBoard_id());
			board.setLike_cnt(boardMapper.heart_count(board));

		}
		
//		board.setLike_id(likeVO.getLike_id());

		System.out.println("cnt");
		System.out.println(board.getLike_cnt());
		System.out.println("id");
		System.out.println(board.getLike_id());

		return board;
	}

}
