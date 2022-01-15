package com.homeart.domain.admin;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AdminNoticeVO {
	private Long admin_no;
	private LocalDate admin_date;
	private String admin_id;
	private String admin_title;
	private String admin_content;
	private String admin_file;
}
