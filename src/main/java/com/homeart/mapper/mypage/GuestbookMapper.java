package com.homeart.mapper.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homeart.domain.mypage.GuestbookCommentVO;
import com.homeart.domain.mypage.GuestbookVO;

public interface GuestbookMapper {
	/* 방명록 */
	public int insert(GuestbookVO vo);
	
	public List<GuestbookVO> list(String mypage_owner);

	// 수정 나중에 시간나면 추가
//	public int update(GuestbookVO vo);
	
	public int delete(String guestbook_id);
	
	public int insertComment(GuestbookCommentVO vo);
	
	public GuestbookVO selectById(String guestbook_id);
	
	/* 방명록 댓글 */
	public GuestbookCommentVO selectCommentById(String guestbook_comment_id);
		
	// 수정 나중에 시간나면 추가
//	public int updateComment(GuestbookCommentVO vo);
	
	public int deleteComment(String guestbook_comment_id);
	
	public List<GuestbookCommentVO> listComment(String guestbook_id);
	
	public List<GuestbookCommentVO> listCommentByGuestbookId(@Param("mypage_owner") String mypage_owner, @Param("guestbook_id") String guestbook_id);

	public int insertNoPic(GuestbookVO vo);

	public int updateProfile(@Param("member_id") String member_id, @Param("profile_file_name") String profile_file_name);
	
	public List<GuestbookVO> listWithComment(String member_id);
}
