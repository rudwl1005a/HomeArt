package com.homeart.controller.mainpage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainpageController {
	
	@GetMapping
	@RequestMapping("/main")
	public void test() {
		
	}
	
	
}
