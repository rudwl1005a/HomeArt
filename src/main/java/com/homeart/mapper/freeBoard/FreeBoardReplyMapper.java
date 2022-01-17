package com.homeart.mapper.freeBoard;

import java.util.List;

import com.homeart.domain.freeBoard.FreeBoardReplyVO;

public interface FreeBoardReplyMapper {

	public List<FreeBoardReplyVO> list(Integer board_id);

	public int insert(FreeBoardReplyVO reply);

	public FreeBoardReplyVO selectById(Integer id);

	public int update(FreeBoardReplyVO newReply);

	public int delete(Integer id);

	public void deleteByBoardId(Integer board_id);


}
