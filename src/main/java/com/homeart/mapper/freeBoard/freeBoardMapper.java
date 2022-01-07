package com.homeart.mapper.freeBoard;

import java.util.List;

import com.homeart.domain.freeBoard.freeBoardVO;

public interface freeBoardMapper {
	
	//데이터 목록 가져오기
	public List<freeBoardVO> getList();

	//새 게시물 입력
	public int insert(freeBoardVO board);

	//id파라미터로 하나의 게시물 조회
	public freeBoardVO read(Integer id);

	//게시물 수정
	public int update(freeBoardVO board);

	//게시물 삭제
	public int delete(Integer id);

	public Integer boardCount();


}
