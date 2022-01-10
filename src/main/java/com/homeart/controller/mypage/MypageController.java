package com.homeart.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homeart.domain.member.GuestbookVO;
import com.homeart.domain.member.MemberVO;
import com.homeart.service.member.MemberService;
import com.homeart.service.mypage.GuestbookService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Setter(onMethod_ = @Autowired)
	private GuestbookService guestbookService;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@RequestMapping("")
	public String mypage(String member_id, Model model) {
		
		List<GuestbookVO> list = guestbookService.getList(member_id);
		model.addAttribute("list", list);

		
		MemberVO member = memberService.read(member_id);
		model.addAttribute("member", member);
		
		return "/mypage/mypage";
	}
	
	@RequestMapping("/my_picture")
	public String mypic() {
		return "/mypage/mypageMypic";
	}
	
	@RequestMapping("/favorite_picture")
	public String fpic() {
		return "/mypage/mypageFavpic";
	}
	
	@RequestMapping("/my_post")
	public String mypost() {
		return "/mypage/mypageMypost";
	}
	
	@RequestMapping("/my_reply")
	public String myreply() {
		return "/mypage/mypageMyreply";
	}

}
