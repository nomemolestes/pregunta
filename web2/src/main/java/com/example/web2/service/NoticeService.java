package com.example.web2.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.web2.mapper.NoticeMapper;
import com.example.web2.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired NoticeMapper noticeMapper;
	//입력
	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	//삭제
	public void removeNotice(Notice notice) {
		noticeMapper.deleteNotice(notice);
	}
	//공지사항 상세보기,수정폼
	public Notice getNoticeOne(int NoticeNo) {
		return noticeMapper.selectNoticeOne(NoticeNo);
	}
	//공지사항 수정액션
	public int modifyNotice(Notice notice) {
		return noticeMapper.updateNotice(notice);
	}
	//공지사항 목록보기
	public Map<String, Object> getNoticeByPage(int currentPage, int rowPerPage) {
		// 1) controller에서 넘어온 매개변수값을 가공 후 매퍼호출
		int startRow = (currentPage - 1)*rowPerPage;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowPerPage", rowPerPage);
		map.put("startRow", startRow);		
		List<Notice> list = noticeMapper.selectNoticeByPage(map);
		
		// 2) 매퍼에서 반환된 값을 가공 controller에 반환
		int totalCount = noticeMapper.selectTotalCount();
		int lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); 
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}
}
