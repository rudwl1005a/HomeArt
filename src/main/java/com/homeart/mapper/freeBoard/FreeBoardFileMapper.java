package com.homeart.mapper.freeBoard;

import org.apache.ibatis.annotations.Param;

public interface FreeBoardFileMapper {

	int insert(@Param("fileId") Integer fileId, @Param("fileName") String fileName);

	String[] selectFileNames(Integer fileId);

	void delete(@Param("fileId") Integer fileId, @Param("fileName") String fileName);

	void deleteFile(Integer id);

}
