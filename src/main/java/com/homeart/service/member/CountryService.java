package com.homeart.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.member.CountryVO;
import com.homeart.mapper.member.CountryMapper;

import lombok.Setter;

@Service
public class CountryService {
	
	@Setter(onMethod_ = @Autowired)
	private CountryMapper mapper;
	
	public List<CountryVO> getList() {
		return mapper.list();
	}
}
