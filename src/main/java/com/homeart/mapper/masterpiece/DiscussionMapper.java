package com.homeart.mapper.masterpiece;

import java.util.List;

import com.homeart.domain.masterpiece.DiscussionVO;

public interface DiscussionMapper {

	List<DiscussionVO> list(Integer masterpiece_id);

	int insert(DiscussionVO discussion);

	DiscussionVO selectByDiscussion_id(Integer discussion_id);

	int update(DiscussionVO newDiscussion);

	int delete(Integer discussion_id);

}
