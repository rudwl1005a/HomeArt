package com.homeart.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.homeart.domain.member.MemberVO;
import com.homeart.domain.mypage.GuestbookCommentVO;
import com.homeart.domain.mypage.GuestbookVO;
import com.homeart.service.mypage.GuestbookService;

import lombok.Setter;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {
	
	@Setter(onMethod_ = @Autowired)
	private GuestbookService guestbookService;
	
	/* 방명록 */
	@GetMapping("/{member_id}")
	public List<GuestbookVO> guestbook(@PathVariable String member_id, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		
		List<GuestbookVO> list = guestbookService.getList(member_id);
		
		if (loggedIn != null) {
			for (GuestbookVO guestbook : list) {
				String writerId = guestbook.getMember_id();
				guestbook.setOwn(loggedIn.getMember_id().equals(writerId));
			}
		}

		return list;
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> write(GuestbookVO guestbook, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		
		if (logged != null && logged.getMember_id().equals(guestbook.getMember_id())) {
			guestbookService.register(guestbook);
			return ResponseEntity.status(HttpStatus.OK).build();
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	
	/* 방명록 댓글 */
	@GetMapping("/guestbookComment/{guestbook_id}/{guestbook_member_id}")
	public List<GuestbookCommentVO> guestbookComment(@PathVariable String guestbook_id,
			@PathVariable String guestbook_member_id, HttpSession session){
		
		List<GuestbookCommentVO> cList = guestbookService.getlistCommentByGuestbookId(guestbook_member_id, guestbook_id);
		
		return cList;
	}
}
