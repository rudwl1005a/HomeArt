package com.homeart.controller.freeBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.service.freeBoard.freeBoardService;

import lombok.Setter;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {
	
	@Setter(onMethod_ = @Autowired)
	private freeBoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		System.out.println("ControllerList");
		//게시물 목록
		List<freeBoardVO> list = service.getList();
		for(freeBoardVO lists : list) {
			System.out.println(lists);
		}
		model.addAttribute("list", list);
		
	}
	
	//파라미터로 원하는 목록(값)출력
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("id") Integer id, Model model) {
		System.out.println("get Controller");
		freeBoardVO freeBoard = service.get(id);
		System.out.println(freeBoard.getBoard_id());
		model.addAttribute("freeBoard", freeBoard);
	}
	
	@PostMapping("/modify")
	public String modify(freeBoardVO board, RedirectAttributes rttr) {
		
		service.modify(board);
		return "redirect:/freeBoard/list";
	}

	@GetMapping("/post")
	public void post() {
		
	}
	
	//테이블에 등록
	@PostMapping("/post")
	public String post(freeBoardVO board, RedirectAttributes rttr) {
		service.post(board);
		return "redirect:/freeBoard/list";
	}
	
	//컬럼 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr) {
		service.remove(id);
		return "redirect:/freeBoard/list";
	}
}
