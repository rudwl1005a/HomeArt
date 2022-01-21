package com.homeart.controller.admin.memManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.admin.AdminCriteria;
import com.homeart.domain.admin.AdminPageDTO;
import com.homeart.service.admin.member.AdminMemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/adminPage/adminMemManage")
@AllArgsConstructor
public class MemController {
	
	@Autowired
	private final AdminMemberService service;
	
	@GetMapping("/AdminMemManage")
	private void read(String member_id,AdminCriteria cri, Model model) {
		
		model.addAttribute("list1", service.get(member_id));
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new AdminPageDTO(cri, 30));
	}
	
	@GetMapping("/remove")
	private String remove(String member_id, RedirectAttributes rttr) {
		
		if(service.remove(member_id)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/adminPage/adminMemManage/AdminMemManage?pageNum=&amount=&keyword=&member_id=";
	}
	
}
