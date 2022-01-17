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
	
	// with comment
//	private int guestbook_comment_id;
//	private int guestbook_id2;
//	private String comment_writer;
//	private String comment_content;
}
