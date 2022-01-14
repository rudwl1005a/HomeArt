package com.homeart.service.picShare;

import java.io.InputStream;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.picShare.picBoardVO;
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
		this.s3 = S3Client.builder()
				.credentialsProvider(StaticCredentialsProvider.create(credentials))
				.region(region)
				.build();
	
		System.out.println("#######s3client########");
		System.out.println(s3);
		
	}
	

	// s3에서 key로 객체 삭제
	private void deleteObject(String key) {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
																	.bucket(bucketName)
																	.key(key).build();
		
		s3.deleteObject(deleteObjectRequest);
	}
	
	// s3에서 key로 객체 업로드(put)
	private void putObject(String key, Long size, InputStream source) {
		PutObjectRequest pubObjectRequest = PutObjectRequest.builder()
															.bucket(bucketName)
															.key(key)
															.acl(ObjectCannedACL.PUBLIC_READ)
															.build();
		
		RequestBody requestBody = RequestBody.fromInputStream(source, size);
		s3.putObject(pubObjectRequest, requestBody);
	}
	
	public List<picBoardVO> getListPage(Integer page, Integer numberPerPage) {
		
		Integer from = (page-1) * 10;
		
		return boardMapper.getListPage(from, numberPerPage);
	}

	public picPageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		
		Integer countRows = boardMapper.getCountRows();
		
		Integer lastPage = (countRows - 1) / numberPerPage + 1;
		Integer leftPageNumber = (page - 1) / 10 * 10 + 1;
		Integer rightPageNumber = (page - 1) / 10 * 10 + 10;
		
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;
		
		Boolean hasPrevButton = leftPageNumber != 1;
		Boolean hasNextButton = rightPageNumber != lastPage;
		
		picPageInfoVO picPageInfo = new picPageInfoVO();
		
		picPageInfo.setCountRows(countRows);
		
		picPageInfo.setCurrentPage(page);
		picPageInfo.setLastPage(lastPage);
		picPageInfo.setLeftPageNumber(leftPageNumber);
		picPageInfo.setRightPageNumber(rightPageNumber);
		
		picPageInfo.setHasNextButton(hasNextButton);
		picPageInfo.setHasPrevButton(hasPrevButton);
		
		return picPageInfo;
	}

	public picBoardVO get(Integer id) {
		return boardMapper.read(id);
	}

	@Transactional
	public void register(picBoardVO board, MultipartFile file) throws Exception {
		
			if (file != null && file.getSize() > 0) {
				boardMapper.insert(board);
				
				System.out.println(board.getBoard_id());
				// 1. s3에 file 작성
				String key = "picShare/" + board.getBoard_id() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());
				
				// 2. insert into File, DATABASE
				// filename을 multipartFile에서 가져와서 picBoard 테이블에 추가하는 메서드 추가
				
			}
			
			return;
			
	}

	@Transactional
	public void remove(@Param("id") Integer id, MultipartFile file) {
		
		if (file != null && file.getSize() > 0) {
			boardMapper.delete(id);
			
			String key = "picShare/" + id + "/" + file; 
			deleteObject(key);
			
		}
		
		return;
		
	}


	public boolean modify(picBoardVO board) {
		
		return boardMapper.update(board) == 1;
		
	}


}
