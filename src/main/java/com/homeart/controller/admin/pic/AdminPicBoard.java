package com.homeart.controller.admin.pic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.homeart.domain.admin.AdminPageInfoVO;
import com.homeart.domain.admin.AdminPicVO;
import com.homeart.service.admin.Pic.AdminPicService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminPage/adminPic")
public class AdminPicBoard {
	
	@Setter(onMethod_ = @Autowired)
	private AdminPicService service;
	
	@GetMapping("/AdminPicBoard")
	public void list(Long masterpiece_id, Model model,
			@RequestParam(value="page", defaultValue = "1") Integer page,
			@RequestParam(defaultValue="")String keyword) {
		Integer numberPerPage = 12;
		
		List<AdminPicVO> list = service.getList(page, numberPerPage, keyword);
		AdminPageInfoVO infoVo = service.getPageInfo(page, numberPerPage, keyword);
		
		for(AdminPicVO lists: list) {
			System.out.println(lists);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("infoVO", infoVo);
		model.addAttribute("pic", service.get(masterpiece_id));
	}
	
	@GetMapping("/remove")
	public String remove(Long masterpiece_id, String file) {
		service.remove(masterpiece_id, file);
		
		return "redirect:/adminPage/adminPic/AdminPicBoard";
	}
}
