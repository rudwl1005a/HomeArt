package com.homeart.mapper.picShare;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homeart.domain.picShare.picBoardVO;

public interface picBoardMapper {

	// 게시물 조회
	public List<picBoardVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);

	public picBoardVO read(Integer id);

	public Integer getCountRows();
	
}
