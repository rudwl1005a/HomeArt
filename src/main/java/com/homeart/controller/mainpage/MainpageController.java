package com.homeart.controller.mainpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.domain.mainPage.MonthBestPicVO;
import com.homeart.domain.mainPage.WeekBestPicVO;
import com.homeart.domain.mainPage.YearBestPicVO;
import com.homeart.service.mainPage.BestPictureService;
import com.homeart.service.member.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/")
public class MainpageController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@Setter(onMethod_ = @Autowired)
	private BestPictureService pictureService;
	
	@GetMapping
	@RequestMapping("")
	public String test(Model model) {
		
		/* best pictures */
		List<WeekBestPicVO> week = pictureService.getWeekList();
		List<MonthBestPicVO> month = pictureService.getMonthList();
		List<YearBestPicVO> year = pictureService.getYearList();
		
		model.addAttribute("week", week);
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		
		/* 공지사항 */
		List<freeBoardVO> notice = memberService.getNotice();
		model.addAttribute("notice", notice);
		
		return "main";
	}
}
