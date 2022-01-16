package com.homeart.domain.mypage;

import lombok.Data;

@Data
public class GuestbookCommentVO {
	private String guestbook_comment_id;
	private String member_id;
	private String guestbook_id;
	private String content;
}
