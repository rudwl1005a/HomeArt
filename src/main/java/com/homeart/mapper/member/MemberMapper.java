package com.homeart.mapper.member;

import java.util.List;

import com.homeart.domain.freeBoard.FreeBoardReplyVO;
import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.domain.member.MemberVO;
import com.homeart.domain.mypage.likeListVO;
import com.homeart.domain.mypage.replyVO;
import com.homeart.domain.picShare.picBoardVO;

public interface MemberMapper {
	public int insert(MemberVO member);
	
	public MemberVO select(String member_id);
	
	public int update(MemberVO member);
	
	public int delete(String member_id);
	
	public List<MemberVO> list();

	public MemberVO selectByNickName(String nickName);

	public List<freeBoardVO> selectNotice();
	
	public List<freeBoardVO> selectWriting(String member_id);

	public List<freeBoardVO> selectWritingLimit5(String member_id);
	
	public List<picBoardVO> selectPicture(String member_id);

	public List<picBoardVO> selectPictureLimit5(String member_id);

	public List<replyVO> selectReply(String member_id);

	public List<FreeBoardReplyVO> selectReplyLimit5(String member_id);

	public List<likeListVO> selectLikeMasterpiece(String member_id);
	
	public List<likeListVO> selectLikePicture(String member_id);

	public List<likeListVO> selectLikeLimit5(String member_id);
}
