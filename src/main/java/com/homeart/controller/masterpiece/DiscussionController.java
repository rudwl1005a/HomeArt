package com.homeart.controller.masterpiece;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import com.homeart.service.masterpiece.DiscussionService;

import com.homeart.domain.member.MemberVO;
import com.homeart.domain.masterpiece.DiscussionVO;

import com.homeart.service.masterpiece.DiscussionService;

import lombok.Setter;

@RestController
@RequestMapping("/discussion")
public class DiscussionController {

	@Setter(onMethod_ = @Autowired)
	private DiscussionService service;
	
	
	@GetMapping("/masterpiece/{masterpiece_id")
	public List<DiscussionVO> list(@PathVariable Integer masterpiece_id, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		System.out.println("discussion 접근");
		List<DiscussionVO> list = service.list(masterpiece_id);

//		System.out.println("board/boardid : " + loggedIn);
		if (loggedIn != null) {
			for (DiscussionVO reply : list) {
				String writerId = reply.getMember_id();
				reply.setOwn(loggedIn.getMember_id().equals(writerId));
			}
		}
		return list;
	}

	@PostMapping("/write")
	public ResponseEntity<String> write(DiscussionVO discussion, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
		
		if (logged != null && logged.getMember_id().equals(discussion.getMember_id())) {
			service.insert(discussion);
			return ResponseEntity.status(HttpStatus.OK).build();
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}

	@PutMapping("/{discussion_id}")
	public ResponseEntity<String> modify(@PathVariable Integer discussion_id, @RequestBody DiscussionVO discussion, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
//		System.out.println(id);
//		System.out.println(reply.getReply());

		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
		
		// 댓글 조회
		DiscussionVO old = service.readByDiscussion_id(discussion_id);
		// 로그인된 멤버의 아이디와 댓글작성한 사람 아이디가 같을 때만
		if (logged != null && logged.getMember_id().equals(old.getMember_id())) {
			// 업데이트
			old.setDiscussion(discussion.getDiscussion());
			service.update(old);

			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}

	@DeleteMapping("/{discussion_id}")
	public ResponseEntity<String> remove(@PathVariable Integer discussion_id, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");

		// 댓글 조회
		DiscussionVO old = service.readByDiscussion_id(discussion_id);
		// 로그인된 멤버의 아이디와 댓글작성한 사람 아이디가 같을 때만
		if (logged != null && logged.getMember_id().equals(old.getMember_id())) {
			// 삭제
			service.delete(discussion_id);

			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}

	}
}
