package com.homeart.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@RequestMapping("")
	public String test() {
		return "mypage";
	}
	
	@RequestMapping("/my_picture")
	public String mypic() {
		return "mypageMypic";
	}
	
	@RequestMapping("/favorite_picture")
	public String fpic() {
		return "mypageFavpic";
	}
	
	@RequestMapping("/my_post")
	public String mypost() {
		return "mypageMypost";
	}
	
	@RequestMapping("/my_reply")
	public String myreply() {
		return "mypageMyreply";
	}

}
