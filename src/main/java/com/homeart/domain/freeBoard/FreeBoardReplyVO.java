package com.homeart.domain.freeBoard;

import java.time.LocalDateTime;
import java.time.ZoneId;

import lombok.Data;

@Data
public class FreeBoardReplyVO {
	private Integer id;
	private Integer board_id;
	private String member_id;
	private String reply;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	public Boolean own;
	
	private String nickName;
	
	public String getReplyInserted() {
		//현재 일시
		LocalDateTime now = LocalDateTime.now(ZoneId.of("+09:00"));
		LocalDateTime beforeOneDayFromNow = now.minusDays(1);
		
		if(inserted.isBefore(beforeOneDayFromNow)) {
			return inserted.toLocalDate().toString();
		}else {
			return inserted.toLocalTime().toString();
		}
	}
}
