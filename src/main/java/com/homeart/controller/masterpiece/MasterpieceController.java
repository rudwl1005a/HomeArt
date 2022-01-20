package com.homeart.controller.masterpiece;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.masterpiece.MasterpieceVO;
import com.homeart.domain.masterpiece.PageInfoVO;
import com.homeart.domain.masterpiece.likeVO;
import com.homeart.domain.picShare.picBoardVO;
import com.homeart.service.masterpiece.MasterpieceService;

import lombok.Setter;

@Controller
@RequestMapping("/masterpiece")
public class MasterpieceController {

	@Setter(onMethod_ = @Autowired)
	private MasterpieceService service;

	/* @GetMapping("/list") */
	@RequestMapping(value = {"/list", "/list.do"})
	public String card_list(@RequestParam(value = "page", defaultValue = "1") Integer page, HttpServletRequest request, HttpSession session, Model model) {

		// 한페이지의 몇개 = 20개
		final int PAGE_ROW_COUNT = 20;

		// 보여줄 페이지의 번호를 일단 1이라 초기값 지정.
		int pageNum = 1;
		// 페이지 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum = request.getParameter("pageNum");
		// 만일 페이지 번호가 파라미터로 넘어 온다면
		if (strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}

		// 보여줄 페이지의 시작 ROWNUM - 0부터 시작
		int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지의 끝
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		int rowCount = PAGE_ROW_COUNT;

		// 검색 키워드 관련 처리 - 검색 키워드가 파라미터로 넘어올 경우, 안넘어올 경우
		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");

		// 만일 키워드가 넘어오지 않는다면
		if (keyword == null) {
			keyword = "";
			type = "";
		}

		// 특수기호를 인코딩한 키워드를 미리 준비.
		String encodedK = URLEncoder.encode(keyword);

		// startRowNum과 rowCount를 MasterpieceVO 객체에 담는다.
		MasterpieceVO masterpiece_id = new MasterpieceVO();
		masterpiece_id.setStartRowNum(startRowNum);
		masterpiece_id.setEndRowNum(endRowNum);
		masterpiece_id.setRowCount(rowCount);

		// ArrayList 객체의 참조값을 담을 지역변수를 미리 담는다.
		ArrayList<MasterpieceVO> list = null;
		// 전체 row의 개수를 담을 지역변수를 미리 담는다.
		int totalRow = 0;

		// 검색 키워드가 넘어온다면
		if (!keyword.equals("")) {
			if (type.equals("title")) {
				masterpiece_id.setTitle(keyword);
			} else if (type.equals("artist")) {
				masterpiece_id.setArtist(keyword);
			} else if (type.equals("country")) {
				masterpiece_id.setCountry(keyword);
			} else if (type.equals("age")) {
				masterpiece_id.setAge(keyword);
			} else if (type.equals("all")) {
				masterpiece_id.setAll(keyword);
			}
		}
		
		list = service.getList(masterpiece_id);
	

		// 위의 분기에 따라 bean에 담기는 내용이 다 다름.

		// 로그인 상태일때 아닐때

		// 글의 갯수
		totalRow = service.getCountRow(masterpiece_id);
		
		// 전체 페이지의 개수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		request.setAttribute("list", list);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("totalRow", totalRow);
		
		request.setAttribute("pageNum", pageNum);

		model.addAttribute("list", list);
		
		List<MasterpieceVO> randomone = service.randomone(masterpiece_id);
		model.addAttribute("ran", randomone);
				
		return "/masterpiece/list";		

		
		// 3. business logic
		// 게시물(Board) 목록 조회
//		List<BoardVO> list = service.getList();
		/* List<MasterpieceVO> list2 = service.getListPage(page, numberPerPage); */
		/* PageInfoVO pageInfo = service.getPageInfo(page, numberPerPage); */

		// 4. add attribute
		/* model.addAttribute("list", list2); */
		/* model.addAttribute("pageInfo", pageInfo); */

		// 5. forward / redirect
		// jsp path : /WEB-INF/views/board/list.jsp
	}
	
	// 로딩으로 불러오는 게시물 리스트
	@RequestMapping(value = "/ajax_page.do")
	public String masterpiece_ajax_page(HttpServletRequest request, HttpSession session, Model model) {

		// 한 페이지에 몇 개 씩? 20개
		final int PAGE_ROW_COUNT = 20;

		int pageNum = 1;
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}

		int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT;
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		int rowCount = PAGE_ROW_COUNT;

		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");

		if (keyword == null) {
			keyword = "";
			type = "";
		}

		String encodedK = URLEncoder.encode(keyword);

		MasterpieceVO masterpiece_id = new MasterpieceVO();
		masterpiece_id.setStartRowNum(startRowNum);
		masterpiece_id.setEndRowNum(endRowNum);
		masterpiece_id.setRowCount(rowCount);

		// ArrayList 객체의 참조값을 담을 지역변수를 미리 담는다.
		ArrayList<MasterpieceVO> list = null;
		// 전체 row의 개수를 담을 지역변수를 미리 담는다.
		int totalRow = 0;

		if (!keyword.equals("")) {
			if (type.equals("title")) {
				masterpiece_id.setTitle(keyword);
			} else if (type.equals("artist")) {
				masterpiece_id.setNickName(keyword);
			} else if (type.equals("country")) {
				masterpiece_id.setNickName(keyword);
			} else if (type.equals("age")) {
				masterpiece_id.setNickName(keyword);
			} else if (type.equals("all")) {
				masterpiece_id.setAll(keyword);
			}
		}

		list = service.getList(masterpiece_id);
		
		// 글의 갯수
		totalRow = service.getCountRow(masterpiece_id);

		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		request.setAttribute("list", list);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);

//		list = service.getList();

//		model.addAttribute("list", list);

		return "/masterpiece/ajax_page";

	}
	
	
	

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("masterpiece_id") Integer masterpiece_id, MasterpieceVO masterpiece_id2, Model model) {
		MasterpieceVO masterpiece = service.get(masterpiece_id);
		
		model.addAttribute("masterpiece", masterpiece);
		
		List<MasterpieceVO> randomfour = service.randomfour(masterpiece_id2);
		model.addAttribute("ran4", randomfour);
	}
	
	@PostMapping("/modify")
	public String modify(MasterpieceVO masterpiece, String removeFile, MultipartFile file, RedirectAttributes rttr) {
		
		masterpiece.setFile_name(file.getOriginalFilename());
		
		try {
			if (service.modify(masterpiece, removeFile, file)) {
				rttr.addFlashAttribute("result", masterpiece.getMasterpiece_id() + "번 게시글이 수정되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result", masterpiece.getMasterpiece_id() + "번 게시글 수정 중 문제가 발생하였습니다.");
		}

		// 게시물 조회로 redirect
		/*
		 * rttr.addAttribute("id", board.getId());
		 * return "redirect:/board/get";
		 */

		// 목록 조회로 redirect
		return "redirect:/masterpiece/list";
	}


	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(MasterpieceVO Masterpiece, MultipartFile file) throws Exception {

		Masterpiece.setFile_name(file.getOriginalFilename());
		
		service.register(Masterpiece, file);
		
	

		// 5. forward / redirect
		// 책: 목록으로 redirect
		return "redirect:/masterpiece/list";
	}
	
	@PostMapping("/remove")
	public String remove(MasterpieceVO Masterpiece, RedirectAttributes rttr, MultipartFile file) {

		
		service.remove(Masterpiece.getMasterpiece_id(), file);

		return "redirect:/masterpiece/list";
	}

	/* @RequestMapping(value= "/like", method = RequestMethod.GET, produces = "application/text; charset=UTF-8") */
	@GetMapping("/like")
	@ResponseBody
	public Map<String,Object> like(String masterpiece_id, String member_id) {
		Integer mp_id = Integer.parseInt(masterpiece_id);
		
		
		
		Map<String,Object>result = service.updateLike(mp_id,member_id);
		
		return result; //여기 리저트 값이 

	}

}
