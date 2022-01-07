package com.homeart.service.freeBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.mapper.freeBoard.freeBoardMapper;

import lombok.Setter;


	
@Service
public class freeBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private freeBoardMapper mapper;

	//insert
	public boolean post(freeBoardVO board) {
		return mapper.insert(board) == 1;
	}

	//getList
	public List<freeBoardVO> getList() {
		return mapper.getList();
	}

	//get
	public freeBoardVO get(Integer id) {
		return mapper.read(id);
	}

	//modify
	public boolean modify(freeBoardVO board) {
		return mapper.update(board) == 1;
	}

	//remove 게시물 delete
	public boolean remove(Integer id) {
		return mapper.delete(id) == 1;
	}

	//list 여러개 받아오기
	
}
