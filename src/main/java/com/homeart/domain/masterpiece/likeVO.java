package com.homeart.domain.masterpiece;

import lombok.Data;

@Data
public class likeVO {
	private Integer like_id;	// 좋아요 ID key(pk)
	private Integer masterpiece_id;	// 명화 ID
	private String member_id;		// 작성자 ID
}