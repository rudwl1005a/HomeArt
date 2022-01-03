package com.homeart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adminPage")
public class AdminMain {
	
	@RequestMapping("/AdminMain")
	public String mainPage() {
		return "/adminPage/AdminMain";
	}
}
