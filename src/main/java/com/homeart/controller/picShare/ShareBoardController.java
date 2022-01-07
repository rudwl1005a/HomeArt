package com.homeart.controller.picShare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.homeart.domain.picShare.picBoardVO;
import com.homeart.domain.picShare.picPageInfoVO;
import com.homeart.service.picShare.picBoardService;

import lombok.Setter;

@Controller
@RequestMapping("/picShare")
public class ShareBoardController {
	
	@Setter(onMethod_ = @Autowired)
	private picBoardService service;
	
	@GetMapping("/list")
	public void list(@RequestParam(value="page", defaultValue="1") Integer page, Model model) {
		
		// 한 페이지의 card 수
		Integer numberPerPage = 24;
		
		List<picBoardVO> list = service.getListPage(page, numberPerPage);
		picPageInfoVO picPageInfo = service.getPageInfo(page, numberPerPage);
		
		
		model.addAttribute("list", list);
		model.addAttribute("picPageInfo", picPageInfo);
		
		// views 다음 폴더부터 적어주면 됨
		// jsp:path : /WEB-INF/views/picShare/picShareBoard/list.jsp
	}
	
	// picBoard/get?id=몇인지 적어줘야 페이지 나타남. (페이지끼리 연결 필요)
	@GetMapping("/get")
	public void get(@RequestParam("id") Integer boardId, Model model) {
		
		picBoardVO board = service.get(boardId);
		
		model.addAttribute("board", board);
		
		
	}
	
	@RequestMapping("/modify")
	public void modify() {
		
	}
	
	@RequestMapping("/register")
	public void register() {
		
	}
	
}
