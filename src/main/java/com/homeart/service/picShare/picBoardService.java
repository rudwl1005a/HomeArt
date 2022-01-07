package com.homeart.service.picShare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.homeart.domain.picShare.picBoardVO;
import com.homeart.domain.picShare.picPageInfoVO;
import com.homeart.mapper.picShare.picBoardMapper;

import lombok.Setter;
import software.amazon.awssdk.regions.Region;

@Service
public class picBoardService {

	@Setter(onMethod_ = @Autowired)
	private picBoardMapper boardMapper;
	
	public List<picBoardVO> getListPage(Integer page, Integer numberPerPage) {
		
		Integer from = (page-1) * 10;
		
		return boardMapper.getListPage(from, numberPerPage);
	}

	public picPageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		
		Integer countRows = boardMapper.getCountRows();
		
		Integer lastPage = (countRows - 1) / numberPerPage + 1;
		Integer leftPageNumber = (page - 1) / 10 * 10 + 1;
		Integer rightPageNumber = (page - 1) / 10 * 10 + 10;
		
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;
		
		Boolean hasPrevButton = leftPageNumber != 1;
		Boolean hasNextButton = rightPageNumber != lastPage;
		
		picPageInfoVO picPageInfo = new picPageInfoVO();
		
		picPageInfo.setCountRows(countRows);
		
		picPageInfo.setCurrentPage(page);
		picPageInfo.setLastPage(lastPage);
		picPageInfo.setLeftPageNumber(leftPageNumber);
		picPageInfo.setRightPageNumber(rightPageNumber);
		
		picPageInfo.setHasNextButton(hasNextButton);
		picPageInfo.setHasPrevButton(hasPrevButton);
		
		return picPageInfo;
	}

	public picBoardVO get(Integer boardId) {
		return boardMapper.read(boardId);
	}


}
