package com.homeart.controller.masterpiece;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/masterpiece")
public class MasterpieceController {

	@RequestMapping("/list")
	public String list() {
		return "masterpiece/list";
	}
	
	@RequestMapping("/get")
	public String get() {
		return "masterpiece/get";
	}
	
	@RequestMapping("/modify")
	public String modify() {
		return "masterpiece/modify";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		return "masterpiece/admin";
	}
	
	
}
