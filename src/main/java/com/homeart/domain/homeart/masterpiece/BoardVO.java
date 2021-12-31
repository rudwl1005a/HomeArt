package com.homeart.domain.homeart.masterpiece;

import java.time.LocalDateTime;
import java.time.ZoneId;

import lombok.Data;

@Data
public class BoardVO {
	private Integer id;
	private String title;
	private String content;
	private String writer;
//	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime inserted;
//	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime updated;
	private String nickName;
	
	private Integer replyCount;
	
	private Boolean hasFile;

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
//	private Integer mp_art_number;		// 작품 고유 번호
//	private String mp_category_country;	// 작품 나라 분류
//	private String mp_category_color;	// 작품 색상 분류
//	private String mp_category_age;		// 작품 시대 분류
//	private String mp_category_artist;	// 작품 작가 분류
//	private String mp_writer;			// 작성자
//	private String mp_discussion;		// 작품 토론글
//	
//	private Integer mp_discussionCount;	// 작품 토론 카운트
}
