package com.homeart.service.freeBoard;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.freeBoard.PageInfoVO;
import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.mapper.freeBoard.FreeBoardFileMapper;
import com.homeart.mapper.freeBoard.FreeBoardReplyMapper;
import com.homeart.mapper.freeBoard.freeBoardMapper;

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
public class freeBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private freeBoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private FreeBoardFileMapper fileMapper;
	
	@Setter(onMethod_ = @Autowired)
	private FreeBoardReplyMapper replyMapper;
	
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
		//spring bean이 만들어진 후 최초로 실행되는 코드 작성
		
		//권한 정보 삭제
		AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKeyId, secretAccessKey);
		this.s3 = S3Client.builder()
				.credentialsProvider(StaticCredentialsProvider.create(credentials))
				.region(region)
				.build();
		System.out.println("########### s3cilent ###########");
		System.out.println(s3);
	}
	
	//s3에서 key에 해당하는 객체 삭제
	private void deleteObject(String key) {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
													.bucket(bucketName).key(key).build();
		s3.deleteObject(deleteObjectRequest);
	}
	
	//s3에서 key로 객체 업로드 (put)
	private void putObject(String key, Long size, InputStream source) {
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                .bucket(bucketName).key(key).acl(ObjectCannedACL.PUBLIC_READ).build();

		RequestBody requestBody = RequestBody.fromInputStream(source, size);

		s3.putObject(putObjectRequest, requestBody);
	}
	
	//insert
	public boolean post(freeBoardVO board) {
		return mapper.insert(board) == 1;
	}

	//get
	public freeBoardVO get(Integer id) {
		return mapper.read(id);
	}

	//modify
	public boolean modify(freeBoardVO board) {
		return mapper.update(board) == 1;
	}

	//remove 게시물 delete
	@Transactional
	public boolean remove(Integer id) {
		//게시물에 달린 댓글 삭제
		replyMapper.deleteByBoardId(id);
		
		//파일 지우기
		//s3에서 삭제
		String[] files = fileMapper.selectFileNames(id);
		
		if(files != null) {
			for(String file : files) {
				String key = "freeBoard/" + id + "/" + file;
				deleteObject(key);
			}
		}
		
		//DB에서 삭제
		fileMapper.deleteFile(id);
		
		return mapper.delete(id) == 1;
	}
	
	//관리자 공지목록
	public List<freeBoardVO> getList(String searchType, String keyword) {
		return mapper.getAdminList(searchType, keyword);
	}

	//회원게시getList & pageInfo
	public List<freeBoardVO> getList(Integer page, String searchType, String keyword, Integer numberPerPage) {
		//sql에서 사용할 record 시작번호(0-index)
		Integer from = (page-1) * 10;
		return mapper.getList(from, searchType, keyword, numberPerPage);
	}

	//pagination
	public PageInfoVO getPageInfo(Integer page, String searchType, String keyword,Integer numberPerPage) {
		
		Integer countBoard = mapper.countBoard(searchType, keyword);//총 게시물수
		Integer lastPage = (countBoard-1) / numberPerPage + 1; //마지막 페이지 번호
		Integer leftPageNumber = (page-1) / 5 * 5 + 1; //가장 왼쪽 번호
		Integer rightPageNumber = (page-1) / 5 * 5 + 5; //가장 오른쪽 번호
		
		//마지막 페이지 넘어가지 않도록 설정
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;
		
		Boolean hasPrevButton = leftPageNumber != 1; //이전페이지 버튼 존재여부
		Boolean hasNextButton = rightPageNumber != lastPage; //다음페이지 버튼 존재여부
		
		PageInfoVO pageInfo = new PageInfoVO();
		
		pageInfo.setCountBoard(countBoard);
		pageInfo.setCurrentPage(page);
		pageInfo.setLastPage(lastPage);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);
		
		return pageInfo;
	}

	@Transactional
	public void post(freeBoardVO board, MultipartFile[] files) throws IOException {
		post(board);
		
		//파일 업로드
		for(MultipartFile file : files) {
			if(file != null && file.getSize() > 0) {
				//s3에 파일 업로드
				String key = "freeBoard/" + board.getBoard_id() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());
				
				//DB에 파일 업로드
				fileMapper.insert(board.getBoard_id(), file.getOriginalFilename());
			}
		}
	}

	public String[] getFileNames(Integer id) {
		return fileMapper.selectFileNames(id);
	}

	@Transactional
	public boolean modify(freeBoardVO board, String[] removeFile, MultipartFile[] files) throws IOException {
		modify(board);
		
		//파일 삭제
		if(removeFile != null) {
			for(String removeFileName : removeFile) {
				//s3에서 삭제
				String key = "freeBoard/" + board.getBoard_id() + "/" + removeFileName;
				deleteObject(key);
				
				//DB table에서 삭제
				fileMapper.delete(board.getBoard_id(), removeFileName);
			}
		}
		
		//새 파일 추가
		for(MultipartFile file : files) {
			if(file != null && file.getSize() > 0) {
				//s3에 추가
				String key = "freeBoard/" + board.getBoard_id() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());
				
				//insert File into DB - 파일 지운뒤 추가
				fileMapper.delete(board.getBoard_id(), file.getOriginalFilename());
				fileMapper.insert(board.getBoard_id(), file.getOriginalFilename());
			}
		}
		
		return false;
	}

	public int viewCount(Integer id) {
		return mapper.viewCount(id);
	}

	public List<freeBoardVO> movePageAdmin(Integer id) {
		return mapper.movePageAdmin(id);
	}

	public List<freeBoardVO> movePage(Integer id) {
		return mapper.movePage(id);
	}
	
}
