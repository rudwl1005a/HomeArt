package com.homeart.mapper.picShare;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.picShare.picBoardVO;

public interface picBoardMapper {

	// 게시물 조회, pagination
	public List<picBoardVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);
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

}
