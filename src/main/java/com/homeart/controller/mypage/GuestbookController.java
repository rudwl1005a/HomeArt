package com.homeart.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.homeart.domain.member.MemberVO;
import com.homeart.domain.mypage.GuestbookCommentVO;
import com.homeart.domain.mypage.GuestbookVO;
import com.homeart.service.mypage.GuestbookService;

import lombok.Setter;

@RestController
@RequestMapping("/guestbook")
public class GuestbookController {
	
	@Setter(onMethod_ = @Autowired)
	private GuestbookService guestbookService;
	
	/* 방명록 */
	@GetMapping("/guestbook/{member_id}")
	public List<GuestbookVO> guestbook(@PathVariable String member_id, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		
//		List<GuestbookVO> list = guestbookService.getList(member_id);
		List<GuestbookVO> list = guestbookService.getListWithComment(member_id);
		
		if (loggedIn != null) {
			for (GuestbookVO guestbook : list) {
				String writerId = guestbook.getMember_id();
				guestbook.setOwn(loggedIn.getMember_id().equals(writerId));
				String commentWriterId = guestbook.getComment_writer();
				guestbook.setCommentOwn(loggedIn.getMember_id().equals(commentWriterId));
			}
		}

		return list;
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> write(GuestbookVO guestbook, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		
		if(guestbook.getProfile_file_name().equals("")) {
			if (logged != null && logged.getMember_id().equals(guestbook.getMember_id())) {
				guestbookService.registerNoPic(guestbook);
				return ResponseEntity.status(HttpStatus.OK).build();
			} else {
				return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
			}	
		}
		else {
			if (logged != null && logged.getMember_id().equals(guestbook.getMember_id())) {
				guestbookService.register(guestbook);
				return ResponseEntity.status(HttpStatus.OK).build();
			} else {
				return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
			}			
		}
	}
	
	/* 방명록 삭제 */
	@DeleteMapping("/{guestbook_id}")
	public ResponseEntity<String> remove(@PathVariable String guestbook_id, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		// 로그인한 멤버
		//MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");

		// 댓글 조회
		GuestbookVO old = guestbookService.readById(guestbook_id);
		// 로그인된 멤버의 아이디와 댓글작성한 사람 아이디가 같을 때만
		if (logged != null && logged.getMember_id().equals(old.getMember_id())) {
			// 삭제
			guestbookService.remove(guestbook_id);

			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}

	}
	
	/* 방명록 댓글 삭제 */
	@DeleteMapping("/comment/{guestbook_comment_id}")
	public ResponseEntity<String> removeComment(@PathVariable String guestbook_comment_id, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {

		// 댓글 조회
		GuestbookCommentVO old = guestbookService.readCommentById(guestbook_comment_id);
		// 로그인된 멤버의 아이디와 댓글작성한 사람 아이디가 같을 때만
		if (logged != null && logged.getMember_id().equals(old.getMember_id())) {
			// 삭제
			guestbookService.removeComment(guestbook_comment_id);

			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}

	}
	
	/* 방명록 댓글 */
	@PostMapping("/writeComment")
	public ResponseEntity<String> writeComment(GuestbookCommentVO guestbook, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		
		if (logged != null && logged.getMember_id().equals(guestbook.getMember_id())) {
			guestbookService.registerComment(guestbook);
			return ResponseEntity.status(HttpStatus.OK).build();
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}	
	}
	
}
