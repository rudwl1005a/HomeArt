package com.homeart.mapper.homeart.masterpiece;

import org.apache.ibatis.annotations.Param;

public interface FileMapper {

	int insert(@Param("masterpieceId") Integer masterpieceId, @Param("fileName") String fileName);

	String[] selectNamesByMasterpieceId(Integer masterpieceId);

	void delete(@Param("masterpieceId") Integer masterpieceId, @Param("fileName") String fileName);

	void deleteByMasterpieceId(Integer masterpieceId);

}
