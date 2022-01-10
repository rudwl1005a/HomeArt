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
	
	public List<DiscussionVO> list(Integer masterpieceId) {
		
		return mapper.list(masterpieceId);
	}

	public boolean insert(DiscussionVO discussion) {

		return mapper.insert(discussion) == 1;
	}

	public DiscussionVO readById(Integer id) {
		return mapper.selectById(id);
	}

	public boolean update(DiscussionVO newDiscussion) {

		return mapper.update(newDiscussion) == 1;
	}

	public boolean delete(Integer id) {
		return mapper.delete(id) == 1;
	}
}










