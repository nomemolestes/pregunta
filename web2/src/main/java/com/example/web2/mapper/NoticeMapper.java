package com.example.web2.mapper;

import java.util.List;
import java.util.Map;

import com.example.web2.vo.Notice;

public interface NoticeMapper {
	//공지사항 목록조회
	List<Notice> selectNoticeBypage(Map<String, Object> map); 
	//공지사항 상세보기, 수정폼
	Notice selectNoticeOne(int noticeNo);
	//공지사항 수정액션
	int updateNotice(int noticeNo);
	//공지사항 삭제
	String deleteNotice(int noticeNo, String noticePw);
	//공지사항 입력
	int insertNotice(Notice notice);
	//전체 글의수
	Notice selectTotalCount(Map<String, Object> map);
}
