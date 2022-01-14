package com.homeart.service.freeBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.freeBoard.FreeBoardReplyVO;
import com.homeart.mapper.freeBoard.FreeBoardReplyMapper;

import lombok.Setter;

@Service
public class FreeBoardReplyService {

	@Setter(onMethod_ = @Autowired)
	private FreeBoardReplyMapper mapper;
	
	public List<FreeBoardReplyVO> list(Integer board_id) {
		return mapper.list(board_id);
	}

	public boolean insert(FreeBoardReplyVO reply) {
		return mapper.insert(reply) == 1;
	}

	public FreeBoardReplyVO readById(Integer id) {
		return mapper.selectById(id);
	}

	public boolean update(FreeBoardReplyVO newReply) {
		return mapper.update(newReply) == 1;
	}

	public boolean delete(Integer id) {
		return mapper.delete(id) == 1;
	}

}
