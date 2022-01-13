package com.homeart.controller.admin.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.admin.AdminNoticeVO;
import com.homeart.service.admin.notice.AdminNoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminPage/adminNotice")
@AllArgsConstructor
public class AdminNoticeCUD {
	private AdminNoticeService service;
	
	@GetMapping("/AdminNoticeCUD")
	public void list(Model model, Long admin_no) {
		log.info("list or get");
		model.addAttribute("list", service.getList());
		model.addAttribute("notice", service.get(admin_no));
	}
	
	@PostMapping("/AdminNoticeCUD")
	public String register(AdminNoticeVO notice, RedirectAttributes rttr) {
		log.info("register or modify: " + notice);
		
		if(notice.getAdmin_no() <= notice.getAdmin_no().MAX_VALUE) {
			if(service.modify(notice)) {
				rttr.addFlashAttribute("result", "success");
			}
			
			return "redirect: /adminPage/adminNotice/AdminNoticeCUD";
		}
		
		service.register(notice);
		
		rttr.addFlashAttribute("result", notice.getAdmin_no());
		
		return "redirect: /adminPage/adminNotice/AdminNoticeCUD";
	}
	
	@PostMapping("/remove")
	public String remove(Long admin_no, RedirectAttributes rttr) {
		log.info("remove..." + admin_no);
		if(service.remove(admin_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/adminPage/adminNotice/AdminNoticeCUD";
	}
}
