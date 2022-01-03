package com.homeart.domain.homeart.masterpiece;

import java.time.LocalDateTime;
import java.time.ZoneId;

import lombok.Data;

@Data
public class DiscussionVO {

	private Integer id;
	private Integer masterpieceId;
	private String memberId;
	private String discussion;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	private Boolean own;
	
	private String nickName;

	public String getCustomInserted() {
		// 현재일시
		LocalDateTime now = LocalDateTime.now(ZoneId.of("+09:00"));
		LocalDateTime beforeOneDayFromNow = now.minusDays(1);

		if (inserted.isBefore(beforeOneDayFromNow)) {
			return inserted.toLocalDate().toString();
		} else {
			return inserted.toLocalTime().toString();
		}
	}
}
