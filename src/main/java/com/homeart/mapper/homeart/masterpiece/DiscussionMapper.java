package com.homeart.mapper.homeart.masterpiece;

import java.util.List;

import com.homeart.domain.homeart.masterpiece.DiscussionVO;

public interface DiscussionMapper {

	public List<DiscussionVO> list(Integer boardId);

	public int insert(DiscussionVO reply);

	public DiscussionVO selectById(Integer id);

	public int update(DiscussionVO newReply);

	public int delete(Integer id);

	public int deleteByBoardId(Integer boardId);

	public int deleteByMemberId(String memberId);
}
