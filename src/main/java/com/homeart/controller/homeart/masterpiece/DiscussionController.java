package com.homeart.controller.homeart.masterpiece;

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
import com.homeart.domain.homeart.masterpiece.MemberVO;
import com.homeart.domain.homeart.masterpiece.DiscussionVO;
import com.homeart.service.homeart.masterpiece.DiscussionService;

import lombok.Setter;

@RestController
@RequestMapping("/discussion")
public class DiscussionController {

	@Setter(onMethod_ = @Autowired)
	private DiscussionService service;

	@GetMapping("/masterpiece/{masterpieceId}")
	public List<DiscussionVO> list(@PathVariable Integer masterpieceId, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");

		List<DiscussionVO> list = service.list(masterpieceId);

//		System.out.println("board/boardid : " + loggedIn);
		if (loggedIn != null) {
			for (DiscussionVO discussion : list) {
				String writerId = discussion.getMemberId();
				discussion.setOwn(loggedIn.getId().equals(writerId));
			}
		}

		return list;
	}

	@PostMapping("/write")
	public ResponseEntity<String> write(DiscussionVO discussion, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
		
		if (logged != null && logged.getId().equals(discussion.getMemberId())) {
			service.insert(discussion);
			return ResponseEntity.status(HttpStatus.OK).build();
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}

	@PutMapping("/{id}")
	public ResponseEntity<String> modify(@PathVariable Integer id, @RequestBody DiscussionVO discussion, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
//		System.out.println(id);
//		System.out.println(reply.getReply());

		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");

		// 댓글 조회
		DiscussionVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글작성한 사람 아이디가 같을 때만
		if (logged != null && logged.getId().equals(old.getMemberId())) {
			// 업데이트
			old.setDiscussion(discussion.getDiscussion());
			service.update(old);

			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<String> remove(@PathVariable Integer id, @SessionAttribute(value = "loggedInMember", required = false) MemberVO logged) {
		// 로그인한 멤버
//		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");

		// 댓글 조회
		DiscussionVO old = service.readById(id);
		// 로그인된 멤버의 아이디와 댓글작성한 사람 아이디가 같을 때만
		if (logged != null && logged.getId().equals(old.getMemberId())) {
			// 삭제
			service.delete(id);

			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}

	}
}

