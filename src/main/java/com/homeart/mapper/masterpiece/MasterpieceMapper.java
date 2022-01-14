package com.homeart.mapper.masterpiece;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.homeart.domain.masterpiece.MasterpieceVO;

public interface MasterpieceMapper {
	
	// 모든 게시물 조회
	public List<MasterpieceVO> getList(); 
	
	// 새 게시물 입력 & get generated key
	public int insert(MasterpieceVO masterpiece_id); 
	
	// id(pk)로 하나의 게시물 조회
	public MasterpieceVO read(Integer masterpiece_id); 
	
	// id(pk)로 하나의 게시물 삭제
	public Integer delete(Integer masterpiece_id);
	
	// 하나의 게시물 수정
	public int update(MasterpieceVO masterpiece);

	public List<MasterpieceVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);

	public Integer getCountRows();

	public int deleteByMemberId(String member_id);

	public Integer[] selectByMemberId(String member_id);
	
	void fileinsert(@Param("masterpiece_id") Integer masterpiece_id, @Param("file_name") String file_name);
	
	public String selectNamesByMasterpieceId(Integer masterpiece_Id);
	
	void deleteByMasterpieceId(Integer masterpiece_Id);
	
	// file name 으로 file 삭제
	void filedelete(@Param("masterpiece_id") Integer masterpiece_id, @Param("file_name") String file_name);

}









