package com.homeart.domain.picShare;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class picBoardVO {

	private Integer boardId;
	
	private String title;
	private String content;
	private String writer;
	
	private String fileName;
	
	private Integer viewCount;
	private Integer likeCount;
	
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	
	
}
