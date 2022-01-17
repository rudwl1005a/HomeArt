package com.homeart.domain.picShare;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class picBoardVO {

	private Integer board_id;
	
	private String title;
	private String content;
	private String writer;
	
	private String all;
	
	// Member DB의 nickName
	private String nickName;
	
	private String file_name;
	
	private Integer viewCount;
	private Integer like_cnt;
	
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	// search
	private String type;		// 검색 타입 (option중 하나)
	private String keyword;		// 검색 내용
	
	private int startRowNum;
	private int endRowNum;
	private int rowCount;
	
	
	
}
