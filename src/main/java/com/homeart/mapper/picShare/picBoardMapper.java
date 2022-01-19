package com.homeart.mapper.picShare;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.picShare.picBoardVO;
import com.homeart.domain.picShare.picLikeVO;

public interface picBoardMapper {

	
	public Integer getCountRows();
	
	// 로그인 상태가 아닐 때의 list 와 검색
	public List<picBoardVO> getList(picBoardVO board);
		
	// 로그인 상태일때의 list와 검색
	public List<picBoardVO> getLikeId(String member_id);
	
	public List<picBoardVO> getLikeIdOne(String member_id);

	// get
	public picBoardVO read(Integer id);
	
	public void insert(picBoardVO board);

	// remove
	public int delete(Integer id);

	// modify
	public int update(picBoardVO board);
	
	// boardId에서 writer를 가져와서 작품들을 가져오는 것. (그 board_id는 제외하고 가져옴.)
	public List<picBoardVO> getWriterArt(Integer id);
	
	public int getWriterArtCnt(Integer id);
	
	// boardId에서 writer를 가져와서 작품들을 전부 가져오는 것.
	public List<picBoardVO> getArtist(Integer id);
	
	public ArrayList<picBoardVO> getWeeklyList(picBoardVO board);

	public ArrayList<picBoardVO> getMonthlyList(picBoardVO board);

	public ArrayList<picBoardVO> getYearlyList(picBoardVO board);
	
	public int card_count(picBoardVO board);

	public int likeUp(Integer id);

	// likeVO에 board_id와 member_id 추가
	public int insertLike(picLikeVO likeVO);

	//likeVO에 board_id와 member_id 삭제
	public int deleteLike(picLikeVO likeVO);

	// like수를 세는 경우
	public Integer heart_count(picBoardVO board);




	

}
