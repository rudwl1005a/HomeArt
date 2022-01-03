//package com.homeart.service.admin.notice;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.homeart.domain.admin.notice.AdminNoticeVO;
//import com.homeart.mapper.admin.notice.AdminNoticeMapper;
//
//import lombok.Setter;
//
//@Service
//public class AdminNoticeService {
//	
//	@Setter(onMethod_ = @Autowired)
//	private AdminNoticeMapper mapper;
//	
//	public List<AdminNoticeVO> getList() {
//		return mapper.getList();
//	}
//	
//	public boolean update(AdminNoticeVO notice) {
//		return mapper.update(notice) == 1;
//	}
//	
//	public boolean create(AdminNoticeVO notice) {
//		return mapper.create(notice) == 1;
//	}
//	
//	public boolean delete(String admin_id) {
//		return mapper.delete(admin_id) == 1;
//	}
//}
