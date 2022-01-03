package com.homeart.domain.homeart.masterpiece;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String password;
	private String email;
	private String address;
	private LocalDateTime inserted;
	private String nickName;
	private Integer numberOfBoard;
}
