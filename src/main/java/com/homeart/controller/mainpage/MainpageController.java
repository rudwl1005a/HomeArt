package com.homeart.controller.mainpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.service.member.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/")
public class MainpageController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@GetMapping
	@RequestMapping("")
	public String test(Model model) {
		
		
		/* 공지사항 */
		List<freeBoardVO> notice = memberService.getNotice();
		model.addAttribute("notice", notice);
		
		return "main";
	}
}
