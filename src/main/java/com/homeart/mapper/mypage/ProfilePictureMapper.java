package com.homeart.mapper.mypage;

import com.homeart.domain.mypage.ProfilePictureVO;

public interface ProfilePictureMapper {
	public int insert(ProfilePictureVO profile);
	
	public ProfilePictureVO select(String member_id);
	
	public int delete(String member_id);
}
