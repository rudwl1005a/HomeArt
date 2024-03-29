package com.homeart.service.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.mypage.GuestbookCommentVO;
import com.homeart.domain.mypage.GuestbookVO;
import com.homeart.mapper.mypage.GuestbookMapper;

import lombok.Setter;


@Service
public class GuestbookService {
	@Setter(onMethod_ = @Autowired)
	private GuestbookMapper mapper;
	
	/* 방명록 */
	public boolean register(GuestbookVO vo) {
		
		try {
			return mapper.insert(vo) == 1;			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean registerNoPic(GuestbookVO vo) {
		
		try {
			return mapper.insertNoPic(vo) == 1;			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean remove(String guestbook_id) {
		return mapper.delete(guestbook_id) == 1;
	}
	
	public List<GuestbookVO> getList(String mypage_owner) {
		return mapper.list(mypage_owner);
	}
	
	/* 방명록 댓글 */
	public boolean registerComment(GuestbookCommentVO vo) {
		
		try {
			return mapper.insertComment(vo) == 1;			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean removeComment(String guestbook_comment_id) {
		return mapper.deleteComment(guestbook_comment_id) == 1;
	}
	
	public List<GuestbookCommentVO> getListComment(String guestbook_id) {
		return mapper.listComment(guestbook_id);
	}
	
	public List<GuestbookCommentVO> getlistCommentByGuestbookId(@Param("mypage_owner") String mypage_owner, @Param("guestbook_id") String guestbook_id){
		return mapper.listCommentByGuestbookId(mypage_owner, guestbook_id);
	}

	public List<GuestbookVO> getListWithComment(String member_id) {
		return mapper.listWithComment(member_id);
	}
	
	public GuestbookVO readById(String guestbook_id) {
		return mapper.selectById(guestbook_id);

	}
	public GuestbookCommentVO readCommentById(String guestbook_comment_id) {
		return mapper.selectCommentById(guestbook_comment_id);
		
	}
}
