package com.homeart.domain.mypage;

import lombok.Data;

@Data
public class GuestbookVO {
	private String guestbook_id;
	private String member_id;
	private String content;
	private String mypage_owner;
	private String profile_file_name;
	
	private boolean own;
}
