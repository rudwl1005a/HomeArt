package com.homeart.mapper.mainPage;

import java.util.List;

import com.homeart.domain.mainPage.BestPicVO;

public interface BestPictureMapper {

	List<BestPicVO> weekList();

	List<BestPicVO> monthList();

	List<BestPicVO> yearList();

}
