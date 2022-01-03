package com.homeart.controller.picShare;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/picShare")
public class ShareBoardController {
	
	@RequestMapping("/list")
	public String list() {
		
		return "picShare/list";
		// views 다음 폴더부터 적어주면 됨..
		
		// jsp:path : /WEB-INF/views/picShare/picShareBoard/list.jsp
	}
	
	@RequestMapping("/get")
	public String get() {
		return "picShare/get";
	}
	
	@RequestMapping("/modify")
	public String modify() {
		return "picShare/modify";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "picShare/register";
	}
	
}
