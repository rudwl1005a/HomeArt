package com.homeart.service.masterpiece;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.masterpiece.DiscussionVO;
import com.homeart.mapper.masterpiece.DiscussionMapper;

import lombok.Setter;

@Service
public class DiscussionService {
	
	@Setter(onMethod_ = @Autowired)
	private DiscussionMapper mapper;
	
	public List<DiscussionVO> list(Integer masterpiece_id) {
		
		return mapper.list(masterpiece_id);
	}

	public boolean insert(DiscussionVO discussion) {

		return mapper.insert(discussion) == 1;
	}

	public DiscussionVO readByDiscussion_id(Integer discussion_id) {
		return mapper.selectByDiscussion_id(discussion_id);
	}

	public boolean update(DiscussionVO newDiscussion) {

		return mapper.update(newDiscussion) == 1;
	}

	public boolean delete(Integer discussion_id) {
		
		return mapper.delete(discussion_id) == 1;
	}
}










