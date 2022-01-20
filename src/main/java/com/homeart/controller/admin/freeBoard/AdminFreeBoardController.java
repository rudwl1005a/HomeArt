package com.homeart.controller.admin.freeBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.homeart.domain.freeBoard.PageInfoVO;
import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.service.freeBoard.freeBoardService;

import lombok.Setter;

@Controller
@RequestMapping("/adminPage/adminFreeBoard")
public class AdminFreeBoardController {
	
	@Setter(onMethod_=@Autowired)
	private freeBoardService service;
	
	@GetMapping("/list")
	public void list(@RequestParam(value="page", defaultValue = "1") Integer page, 
			@RequestParam(value = "searchType", required = false) String searchType, 
			@RequestParam(value = "keyword", required = false) String keyword, Model model) {
		

		Integer numberPerPage = 10; //한페이지 row수
		
		//게시물 목록
		List<freeBoardVO> listAdmin = service.getList(searchType, keyword);
		List<freeBoardVO> listMember = service.getList(page, searchType, keyword, numberPerPage);
		PageInfoVO pageInfo = service.getPageInfo(page, searchType, keyword, numberPerPage);
		
		model.addAttribute("listAdmin", listAdmin);
		model.addAttribute("listMember", listMember);
		model.addAttribute("pageInfo", pageInfo);
		
	}
	
	@GetMapping("/get")
	public void getPost(@RequestParam("id") Integer id, Model model) {
		
		service.viewCount(id);
		
		freeBoardVO freeBoard = service.get(id);
		String[] fileNames = service.getFileNames(id);
		
		List<freeBoardVO> movePageAdmin = service.movePageAdmin(id);
		List<freeBoardVO> movePage = service.movePage(id);
		
		model.addAttribute("freeBoard", freeBoard);
		model.addAttribute("fileNames", fileNames);
		model.addAttribute("movePageAdmin", movePageAdmin);
		model.addAttribute("movePage", movePage);
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("id") Integer id) {
		service.remove(id);
		return "redirect:/adminPage/adminFreeBoard/list";
	}
}
