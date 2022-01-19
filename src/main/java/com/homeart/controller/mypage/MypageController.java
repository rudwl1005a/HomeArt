package com.homeart.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.freeBoard.FreeBoardReplyVO;
import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.domain.member.MemberVO;
import com.homeart.domain.mypage.ProfilePictureVO;
import com.homeart.domain.mypage.likeListVO;
import com.homeart.domain.mypage.replyVO;
import com.homeart.domain.picShare.picBoardVO;
import com.homeart.service.member.CountryService;
import com.homeart.service.member.MemberService;
import com.homeart.service.mypage.GuestbookService;
import com.homeart.service.mypage.ProfilePictureService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Setter(onMethod_ = @Autowired)
	private GuestbookService guestbookService;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;

	@Setter(onMethod_ = @Autowired)
	private CountryService Countryservice;
	
	@Setter(onMethod_ = @Autowired)
	private ProfilePictureService profileService;
	
	@RequestMapping("")
	public String mypage(String member_id, Model model, HttpSession session, RedirectAttributes rttr) {

		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
//		List<GuestbookVO> list = guestbookService.getList(member_id);
//		HashMap<String, Object> commentList = new HashMap<>();
		MemberVO member = memberService.read(member_id);
		List<freeBoardVO> freeBoard = memberService.getWritingLimit5(member_id);
		List<picBoardVO> picBoard = memberService.getPictureLimit5(member_id);
		List<FreeBoardReplyVO> reply = memberService.getReplyLimit5(member_id);
		List<likeListVO> like = memberService.getLikeLimit5(member_id);
		
		/* 회원 정보 */
		model.addAttribute("member", member);
		
		/* 프로필 사진 있는지 확인 */
		ProfilePictureVO profile = profileService.read(member_id);
		
		if(profile == null) {
			model.addAttribute("isProfile", false);
		} else {
			model.addAttribute("profile", profile);
			model.addAttribute("isProfile", true);
		}
		
		ProfilePictureVO loggedProfile = profileService.read(vo.getMember_id());
		if(profile != null) {
			model.addAttribute("loggedProfile", loggedProfile);			
		}
		
		// 탈퇴한 회원의 마이페이지로 들어가려고 할때
		if(member == null) {
			rttr.addFlashAttribute("result", "탈퇴한 회원입니다.");
			return "redirect:/";
		}

//		/* 방명록 리스트 */
//		model.addAttribute("list", list);
		
		/* 답글 리스트 */
//		for(int i=0; i<list.size(); i++) {
//			String guestbook_id = list.get(i).getGuestbook_id();
//			List<GuestbookCommentVO> cList = guestbookService.getlistCommentByGuestbookId(member_id, guestbook_id);
//			commentList.put(guestbook_id, cList);
//			model.addAttribute("commentList", commentList);
//		}
		
		/* 내 그림 5개 */
		model.addAttribute("picBoardLimit5", picBoard);
		
		/* 좋아요 누른 그림 5개 */
		model.addAttribute("likeLimit5", like);
		
		/* 내가 쓴 글 5개 */
		model.addAttribute("freeBoardLimit5", freeBoard);

		/* 내 댓글 5개 */
		model.addAttribute("replyLimit5", reply);
		
		return "/mypage/mypage";
	}
	
	/* 회원정보 수정 */
	@GetMapping("/modify")
	public String modify(String member_id, HttpSession session, Model model) {
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		
		// 로그아웃 상태
		if(vo == null) {
			return "redirect:/member/login";
		}

		model.addAttribute("countryList", Countryservice.getList());

		MemberVO member = memberService.read(member_id);
		
		model.addAttribute("member", member);
		return "/mypage/mypageModify";
	}
	
	@PostMapping("/modify")
	public String info(MemberVO member, HttpSession session, RedirectAttributes rttr) {
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		
		// 로그아웃 상태
		if(vo == null) {
			return "redirect:/member/login";
		}
		
		// 로그인된 상태
		boolean ok = memberService.modify(member);
		if(ok) {
			rttr.addFlashAttribute("result", "회원 정보가 변경되었습니다.");
			// 세션에 있는 정보 변경
			session.setAttribute("loggedInMember", memberService.read(member.getMember_id()));
		}
		else {
			rttr.addFlashAttribute("result", "회원 정보가 변경되지 않았습니다.");			
		}
		
		String url = "/mypage?member_id=" + vo.getMember_id();
		
		return "redirect:"+url;
	}
	
	/* 프로필 사진 변경 */
	@GetMapping("/profile")
	public String profile(String member_id, Model model) {
		ProfilePictureVO profile = profileService.read(member_id);
		
		if(profile == null) {
			model.addAttribute("isProfile", false);
		} else {
			model.addAttribute("profile", profile);
			model.addAttribute("isProfile", true);
		}
		
		return "/mypage/mypageProfile";
	}
	
	@PostMapping("/profile")
	@Transactional
	public String profile(ProfilePictureVO profile, MultipartFile file, HttpSession session) throws Exception {
		
		MemberVO vo = (MemberVO) session.getAttribute("loggedInMember");
		String url = "/mypage?member_id=" + vo.getMember_id();
		
		if(profileService.read(vo.getMember_id()) == null) {
			profile.setProfile_file_name(file.getOriginalFilename());
			
			profileService.register(profile, file);			
		}
		else {
			profileService.remove(vo.getMember_id(), file);
			profile.setProfile_file_name(file.getOriginalFilename());
			
			profileService.register(profile, file);		
		}
		
		
		return "redirect:"+url;
	}
	
	/* 내 활동 */
	@RequestMapping("/my_picture")
	public String mypic(Model model, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = loggedIn.getMember_id();
		
		List<picBoardVO> picBoard = memberService.getPicture(member_id);

		model.addAttribute("picBoard", picBoard);

		return "/mypage/mypageMypic";
	}
	
	@RequestMapping("/favorite_picture")
	public String fpic(Model model, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = loggedIn.getMember_id();
		
		List<likeListVO> likeMasterpiece = memberService.getLikeMasterpiece(member_id);		
		List<likeListVO> likePicture = memberService.getLikePicture(member_id);
		
		model.addAttribute("likeMasterpiece", likeMasterpiece);
		model.addAttribute("likePicture", likePicture);
		
		return "/mypage/mypageFavpic";
	}
	
	@RequestMapping("/my_post")
	public String mypost(Model model, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = loggedIn.getMember_id();
		
		List<freeBoardVO> freeBoard = memberService.getWriting(member_id);
		
		model.addAttribute("freeBoard", freeBoard);
		return "/mypage/mypageMypost";
	}
	
	@RequestMapping("/my_reply")
	public String myreply(Model model, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		String member_id = loggedIn.getMember_id();
		
		List<replyVO> reply = memberService.getReply(member_id);
		
		model.addAttribute("reply", reply);
		return "/mypage/mypageMyreply";
	}

}
