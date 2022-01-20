package com.homeart.service.mypage;

import java.io.InputStream;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.mypage.ProfilePictureVO;
import com.homeart.mapper.mypage.GuestbookMapper;
import com.homeart.mapper.mypage.ProfilePictureMapper;

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
public class ProfilePictureService {
	
	@Setter(onMethod_ = @Autowired)
	private ProfilePictureMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private GuestbookMapper guestbookMapper;
	
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
	
	@Transactional
	public void register(ProfilePictureVO profile, MultipartFile file) throws Exception {

		if (file != null && file.getSize() > 0) {
			mapper.insert(profile);

			// 1. s3에 file 작성
			String key = "profile/" + profile.getMember_id() + "/" + file.getOriginalFilename();
			putObject(key, file.getSize(), file.getInputStream());

			// 댓글에 있는 프로필 사진 업데이트
			String member_id = profile.getMember_id();
			String profile_file_name = profile.getProfile_file_name();
			guestbookMapper.updateProfile(member_id, profile_file_name);
		}

		return;

	}

	@Transactional
	public boolean remove(@RequestParam("member_id") String member_id, MultipartFile file) {

		if (file != null && file.getSize() > 0) {
			mapper.delete(member_id);

			String key = "profile/" + member_id + "/" + file;
			deleteObject(key);

		}

		return mapper.delete(member_id) == 1;

	}
	
	public ProfilePictureVO read(String member_id) {
		return mapper.select(member_id);
	}
}
