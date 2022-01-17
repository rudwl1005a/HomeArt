package com.homeart.mapper.picShare;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.picShare.picBoardVO;
import com.homeart.domain.picShare.picLikeVO;

public interface picBoardMapper {

	
	public Integer getCountRows();

	// get
	public picBoardVO read(Integer id);
	
	// insert와 delete 모두 void 였는데 int로 바꾸고 실행안시켜봄 오류나면 다시 void로 바꾸기.
	public void insert(picBoardVO board);

	// remove
	public int delete(Integer id);

	// modify
	public int update(picBoardVO board);
	
	// boardId에서 writer를 가져와서 작품들을 가져오는 것. (그 board_id는 제외하고 가져옴.)
	public List<picBoardVO> getWriterArt(Integer id);
	
	// boardId에서 writer를 가져와서 작품들을 전부 가져오는 것.
	public List<picBoardVO> getArtist(Integer id);
	
	// 검색
	public List<picBoardVO> getList(picBoardVO board);
	
	public int card_count(picBoardVO board);

	public int likeUp(Integer id);

	// likeVO에 board_id와 member_id 추가
	public int insertLike(picLikeVO likeVO);

	//likeVO에 board_id와 member_id 삭제
	public int deleteLike(picLikeVO likeVO);

	// like수를 세는 경우
	public Integer heart_count(picBoardVO board);
	
	

}
