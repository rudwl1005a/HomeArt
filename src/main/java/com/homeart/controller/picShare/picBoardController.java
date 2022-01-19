package com.homeart.controller.picShare;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.member.MemberVO;
import com.homeart.domain.picShare.picBoardVO;
import com.homeart.domain.picShare.picLikeVO;
import com.homeart.service.picShare.picBoardService;

import lombok.Setter;

@Controller
@RequestMapping("/picShare")
public class picBoardController {

	@Setter(onMethod_ = @Autowired)
	private picBoardService service;

	// picBoard/getArtist?id=어쩌구
	@GetMapping("/getArtist")
	public void getArtist(@RequestParam("id") Integer id, Model model, HttpSession session) {

		picBoardVO board = new picBoardVO();

		List<picBoardVO> list = null;

		list = service.getArtist(id);

		model.addAttribute("list", list);

		// 좋아요 기능에 대한 부분
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = "";

		List<picBoardVO> getLikeId = null;

		if (loggedIn != null) {
			member_id = loggedIn.getMember_id();

			board.setMemberId(member_id);

			getLikeId = service.getLikeId(member_id);

		} else {

		}

		model.addAttribute("getLikeId", getLikeId);

	}

	// picBoard/get?id=몇인지 적어줘야 페이지 나타남. (페이지끼리 연결 필요)
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("id") Integer id, Model model, HttpSession session) {

		picBoardVO board = new picBoardVO();
		board = service.get(id);
		model.addAttribute("board", board);

		List<picBoardVO> list = null;

		list = service.getWriterArt(id);
		model.addAttribute("list", list);

		int count = service.getWriterArtCnt(id);
		model.addAttribute("count", count);

		// 좋아요 기능에 대한 부분
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = "";

		List<picBoardVO> getLikeId = null;

		if (loggedIn != null) {
			member_id = loggedIn.getMember_id();

			board.setMemberId(member_id);

			getLikeId = service.getLikeId(member_id);

		} else {

		}

		model.addAttribute("getLikeId", getLikeId);

	}

	@PostMapping("/modify")
	public String modify(picBoardVO board) {

		service.modify(board);

		return "redirect:/picShare/list";

	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(picBoardVO board, MultipartFile file) throws Exception {

		board.setFile_name(file.getOriginalFilename());

		service.register(board, file);

		return "redirect:/picShare/list";
	}

	@PostMapping("/remove")
	public String remove(picBoardVO board, MultipartFile file) {

		service.remove(board.getBoard_id(), file);

		return "redirect:/picShare/list";
	}

	@RequestMapping(value = { "/list", "/list.do" })
	public String card_list(HttpServletRequest request, HttpSession session, Model model) {

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

		// startRowNum과 rowCount를 picBoardVO 객체에 담는다.
		picBoardVO board = new picBoardVO();
		board.setStartRowNum(startRowNum);
		board.setEndRowNum(endRowNum);
		board.setRowCount(rowCount);

		// ArrayList 객체의 참조값을 담을 지역변수를 미리 담는다.
		ArrayList<picBoardVO> list = null;
		// 전체 row의 개수를 담을 지역변수를 미리 담는다.
		int totalRow = 0;

		// 검색 키워드가 넘어온다면
		if (!keyword.equals("")) {
			if (type.equals("title")) {
				board.setTitle(keyword);
			} else if (type.equals("nickName")) {
				board.setNickName(keyword);
			} else if (type.equals("all")) {
				board.setAll(keyword);
			}
		}

		list = service.getList(board);

//		// 로그인 상태일때
//		if (session.getAttribute("member_id") == null) {
//			list = service.getList(board);
//
//			// 로그인 상태가 아닐 때,
//		} else {
//			board.setMemberId((String) session.getAttribute("member_id"));
//			list = service.getListLogin(board);
//		}

		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = "";

		List<picBoardVO> getLikeId = null;

		if (loggedIn != null) {
			member_id = loggedIn.getMember_id();

			board.setMemberId(member_id);

			getLikeId = service.getLikeId(member_id);

		} else {

		}

		model.addAttribute("getLikeId", getLikeId);

		// 위의 분기에 따라 bean에 담기는 내용이 다 다름.

		// 로그인 상태일때 아닐때

		// 글의 갯수
		totalRow = service.getCountRow(board);

		// 전체 페이지의 개수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		request.setAttribute("list", list);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);

		request.setAttribute("totalRow", totalRow);

		request.setAttribute("pageNum", pageNum);

		model.addAttribute("list", list);

		// best 만 가지고 오기
		ArrayList<picBoardVO> weekly = new ArrayList();
		weekly = service.getWeeklyList(board);

		model.addAttribute("weekly", weekly);

		ArrayList<picBoardVO> monthly = new ArrayList();
		monthly = service.getMonthlyList(board);

		model.addAttribute("monthly", monthly);

		ArrayList<picBoardVO> yearly = new ArrayList();
		yearly = service.getYearlyList(board);

		model.addAttribute("yearly", yearly);

		return "/picShare/list";
	}

	// 로딩으로 불러오는 게시물 리스트
	@RequestMapping(value = "/ajax_page.do")
	public String picShare_ajax_page(HttpServletRequest request, HttpSession session, Model model) {

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

		picBoardVO board = new picBoardVO();
		board.setStartRowNum(startRowNum);
		board.setEndRowNum(endRowNum);
		board.setRowCount(rowCount);

		// ArrayList 객체의 참조값을 담을 지역변수를 미리 담는다.
		ArrayList<picBoardVO> list = null;
		// 전체 row의 개수를 담을 지역변수를 미리 담는다.
		int totalRow = 0;

		if (!keyword.equals("")) {
			if (type.equals("title")) {
				board.setTitle(keyword);
			} else if (type.equals("nickName")) {
				board.setNickName(keyword);
			} else if (type.equals("all")) {
				board.setAll(keyword);
			}
		}

		list = service.getList(board);

		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = "";

		List<picBoardVO> getLikeId = null;

		if (loggedIn != null) {
			member_id = loggedIn.getMember_id();

			board.setMemberId(member_id);

			getLikeId = service.getLikeId(member_id);

		} else {

		}

		model.addAttribute("getLikeId", getLikeId);

		// 글의 갯수
		totalRow = service.getCountRow(board);

		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		request.setAttribute("list", list);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("pageNum", pageNum);

//		list = service.getList();

//		model.addAttribute("list", list);

		// best 만 가지고 오기
		ArrayList<picBoardVO> weekly = new ArrayList();
		weekly = service.getWeeklyList(board);

		model.addAttribute("weekly", weekly);

		ArrayList<picBoardVO> monthly = new ArrayList();
		monthly = service.getMonthlyList(board);

		model.addAttribute("monthly", monthly);

		ArrayList<picBoardVO> yearly = new ArrayList();
		yearly = service.getYearlyList(board);

		model.addAttribute("yearly", yearly);

		return "/picShare/ajax_page";

	}

	// 빈하트 클릭시 하트를 저장
	@ResponseBody
	@RequestMapping(value = "/saveHeart.do")
	public picBoardVO save_heart(@RequestParam Integer boardId, HttpSession session) {

		picLikeVO likeVO = new picLikeVO();

		// 게시물 번호 세팅
		likeVO.setBoard_id(boardId);

		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = loggedIn.getMember_id();

		// 좋아요를 누른 사람 memberId를 db에 저장
		likeVO.setMember_id(member_id);

		picBoardVO board = new picBoardVO();

		board = service.saveHeart(likeVO);

//		board.setLike_id(likeVO.getLike_id());


		return board;

	}

	// 꽉 찬 하트 클릭시 하트를 해제
	@ResponseBody
	@RequestMapping(value = "/removeHeart.do")
	public picBoardVO remove_heart(@RequestParam Integer boardId, HttpSession session) {

		picLikeVO likeVO = new picLikeVO();

		// 게시물 번호 세팅
		likeVO.setBoard_id(boardId);

		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = loggedIn.getMember_id();

		// 좋아요를 누른 사람 memberId를 db에 저장
		likeVO.setMember_id(member_id);

		picBoardVO board = new picBoardVO();
		board = service.removeHeart(likeVO);

//		board.setLike_id(likeVO.getLike_id());

		return board;
	}

}
