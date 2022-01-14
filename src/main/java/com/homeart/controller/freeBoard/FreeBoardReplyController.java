package com.homeart.controller.freeBoard;

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

import com.homeart.domain.freeBoard.FreeBoardReplyVO;
import com.homeart.domain.member.MemberVO;
import com.homeart.service.freeBoard.FreeBoardReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/reply")
public class FreeBoardReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private FreeBoardReplyService service;
	
	@GetMapping("/freeBoard/{board_id}")
	public List<FreeBoardReplyVO> list(@PathVariable Integer board_id, HttpSession session){
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		List<FreeBoardReplyVO> list = service.list(board_id);
		
		if(loggedIn != null) {
			for(FreeBoardReplyVO reply : list) {
				String writerId = reply.getMember_id();
				reply.setOwn(loggedIn.getMember_id().equals(writerId));
			}
		}
		return list;
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> write(FreeBoardReplyVO reply, @SessionAttribute(value="loggedInMember", required = false) MemberVO logged) {
		
		//로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 떄만
		if(logged != null && logged.getMember_id().equals(reply.getMember_id())) {
			service.insert(reply);
			return ResponseEntity.status(HttpStatus.OK).build();
		}else {				
			//권한없음.
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<String> modify(@PathVariable Integer id, @RequestBody FreeBoardReplyVO reply, HttpSession session){
		//로그인한 멤버
		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
		//댓글 조회
		FreeBoardReplyVO old = service.readById(id);
		
		//로그인된 멤버의 아이디와 댓글 작성한 사람아이디가 같을 때만
		if(logged != null && logged.getMember_id().equals(old.getMember_id())) {
			//업데이트
			old.setReply(reply.getReply());
			service.update(old);
			
			return ResponseEntity.ok("");
		}else {
			//권한없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<String> remove(@PathVariable Integer id, HttpSession session){
		//로그인한 멤버
		MemberVO logged = (MemberVO) session.getAttribute("loggedInMember");
		//댓글 조회
		FreeBoardReplyVO old = service.readById(id);
		
		//로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만
		if(logged != null && logged.getMember_id().equals(old.getMember_id())) {
			//삭제
			service.delete(id);
			return ResponseEntity.ok("");
		}else {
			//권한없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
}
