package com.example.web2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.web2.vo.Notice;
@Mapper
public interface NoticeMapper {
	//공지사항 목록조회
	List<Notice> selectNoticeByPage(Map<String, Object> map); 
	//공지사항 상세보기, 수정폼
	Notice selectNoticeOne(int noticeNo);
	//공지사항 수정액션
	int updateNotice(Notice notice);
	//공지사항 삭제
	int deleteNotice(Notice notice);
	//공지사항 입력
	int insertNotice(Notice notice);
	//전체 글의수
	int selectTotalCount();
}
