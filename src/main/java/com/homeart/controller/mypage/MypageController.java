package com.homeart.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@RequestMapping("")
	public String test() {
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
