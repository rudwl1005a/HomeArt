package com.homeart.service.mainPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.mainPage.MonthBestPicVO;
import com.homeart.domain.mainPage.WeekBestPicVO;
import com.homeart.domain.mainPage.YearBestPicVO;
import com.homeart.mapper.mainPage.BestPictureMapper;

import lombok.Setter;

@Service
public class BestPictureService {

	@Setter(onMethod_ = @Autowired)
	private BestPictureMapper mapper;
	
	public List<WeekBestPicVO> getWeekList() {
		return mapper.weekList();
	}

	public List<MonthBestPicVO> getMonthList() {
		return mapper.monthList();
	}

	public List<YearBestPicVO> getYearList() {
		return mapper.yearList();
	}
	
}
