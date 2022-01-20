package com.homeart.service.mainPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.mainPage.BestPicVO;
import com.homeart.mapper.mainPage.BestPictureMapper;

import lombok.Setter;

@Service
public class BestPictureService {

	@Setter(onMethod_ = @Autowired)
	private BestPictureMapper mapper;
	
	public List<BestPicVO> getWeekList() {
		return mapper.weekList();
	}

	public List<BestPicVO> getMonthList() {
		return mapper.monthList();
	}

	public List<BestPicVO> getYearList() {
		return mapper.yearList();
	}
	
}
