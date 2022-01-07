package com.homeart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminPage")
public class AdminMainController {
	//main은 최종완성
	@RequestMapping("/AdminMain")
	public String mainPage() {
		return "/adminPage/AdminMain";
	}
	//회원관리 미완성
	@RequestMapping("/adminMemManage/AdminMemManage")
	public String memManage() {
		return "/adminPage/adminMemManage/AdminMemManage";
	}
	//공지 미완성
	@RequestMapping("/adminNotice/AdminNoticeCUD")
	public String notice() {
		return "/adminPage/adminNotice/AdminNoticeCUD";
	}
	//명화게시판 완성
	@RequestMapping("/adminPic/AdminPicBoard")
	public String pic() {
		return "/adminPage/adminPic/AdminPicBoard";
	}
	//그림승인 완성
	@RequestMapping("/adminPicShare/AdminPicAdmit")
	public String picShare() {
		return "/adminPage/adminPicShare/AdminPicAdmit";
	}
}
