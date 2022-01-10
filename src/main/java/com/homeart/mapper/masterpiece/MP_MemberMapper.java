package com.homeart.mapper.masterpiece;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.homeart.domain.masterpiece.MP_MemberVO;


public interface MP_MemberMapper {

	public int insert(MP_MemberVO member);
	
	public MP_MemberVO select(String id);
	
	public int update(MP_MemberVO member);
	
	public int delete(String id);
	
	public List<MP_MemberVO> list(); //

	public List<MP_MemberVO> listPage(@Param("from") Integer from, @Param("items") Integer numberPerPage); // page 처리

	public Integer getCountRows();

	public MP_MemberVO selectByNickName(String nickName);

}
