package com.homeart.mapper.mainPage;

import java.util.List;

import com.homeart.domain.mainPage.MonthBestPicVO;
import com.homeart.domain.mainPage.WeekBestPicVO;
import com.homeart.domain.mainPage.YearBestPicVO;

public interface BestPictureMapper {

	List<WeekBestPicVO> weekList();

	List<MonthBestPicVO> monthList();

	List<YearBestPicVO> yearList();

}
