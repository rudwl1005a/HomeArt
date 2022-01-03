package com.homeart.controller.freeBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {
	
	@RequestMapping("/list")
	public String list() {
		System.out.println("success");
		return "/freeBoard/list";
	}
	
	@RequestMapping("/get")
	public String get() {
		return "/freeBoard/get";
	}
	
	@RequestMapping("/modify")
	public String modify() {
		return "/freeBoard/modify";
	}

	
	@RequestMapping("/post")
	public String post() {
		return "/freeBoard/post";
	}
}
