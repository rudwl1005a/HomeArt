package com.homeart.service.member;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.freeBoard.FreeBoardReplyVO;
import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.domain.member.MemberVO;
import com.homeart.domain.mypage.replyVO;
import com.homeart.domain.picShare.picBoardVO;
import com.homeart.mapper.member.MemberMapper;

import lombok.Setter;

@Service
public class MemberService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	public MemberVO read(String member_id) {
		return mapper.select(member_id);
	}
	
	public boolean register(MemberVO member) {
		
		try {
			return mapper.insert(member) == 1;			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean modify(MemberVO member) {
		return mapper.update(member) == 1;
	}
	
	public boolean remove(String member_id) {
		return mapper.delete(member_id) == 1;
	}
	
	public List<MemberVO> getList() {
		return mapper.list();
	}

	/* 아이디 체크 */
	public boolean hasId(String member_id) {

		MemberVO member =  mapper.select(member_id);

		return member != null;
	}
	
	/* 닉네임 체크 */
	public boolean hasNickName(String nickName) {
		MemberVO member = mapper.selectByNickName(nickName);

		return member != null;
	}
	
	public List<freeBoardVO> getNotice() {
		return mapper.selectNotice();
	}

	public List<freeBoardVO> getWriting(String member_id){
		return mapper.selectWriting(member_id);
	}
	
	public List<freeBoardVO> getWritingLimit5(String member_id){
		return mapper.selectWritingLimit5(member_id);
	}
	
	public List<picBoardVO> getPicture(String member_id) {
		return mapper.selectPicture(member_id);
	}
	
	public List<picBoardVO> getPictureLimit5(String member_id) {
		return mapper.selectPictureLimit5(member_id);
	}

	public List<replyVO> getReply(String member_id) {
		return mapper.selectReply(member_id);
	}
	
	public List<FreeBoardReplyVO> getReplyLimit5(String member_id) {
		return mapper.selectReplyLimit5(member_id);
	}
	
}
