package com.homeart.service.homeart.masterpiece;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.homeart.domain.homeart.masterpiece.DiscussionVO;
import com.homeart.mapper.homeart.masterpiece.DiscussionMapper;

import lombok.Setter;

@Service
public class DiscussionService {
	
	@Setter(onMethod_ = @Autowired)
	private DiscussionMapper mapper;
	
	public List<DiscussionVO> list(Integer boardId) {
		
		return mapper.list(boardId);
	}

	public boolean insert(DiscussionVO reply) {

		return mapper.insert(reply) == 1;
	}

	public DiscussionVO readById(Integer id) {
		return mapper.selectById(id);
	}

	public boolean update(DiscussionVO newReply) {

		return mapper.update(newReply) == 1;
	}

	public boolean delete(Integer id) {
		return mapper.delete(id) == 1;
	}
}










