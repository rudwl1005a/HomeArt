package com.homeart.mapper.homeart.masterpiece;

import org.apache.ibatis.annotations.Param;

public interface FileMapper {

	int insert(@Param("boardId") Integer boardId, @Param("fileName") String fileName);

	String[] selectNamesByBoardId(Integer boardId);

	void delete(@Param("boardId") Integer boardId, @Param("fileName") String fileName);

	void deleteByBoardId(Integer boardId);

}
