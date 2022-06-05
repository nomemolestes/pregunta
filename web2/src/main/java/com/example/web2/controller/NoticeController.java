package com.example.web2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.web2.mapper.NoticeMapper;
import com.example.web2.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j//로그객체사용
@Controller//서블릿역할
public class NoticeController {
	@Autowired NoticeMapper noticeMapper;
	
	@GetMapping("/getNoticeByPage")
	public String getNoticeByPage(Model model,
			@RequestParam(name="currentPage", defaultValue="1") int currentPage) {
		//현재페이지 값에대한 코드..
		int rowPerPage = 10;
		int startRow = (currentPage-1)*rowPerPage;
		Map<String, Object> map = new HashMap<>();
		map.put("rowPerPage", rowPerPage);
		map.put("startRow", startRow);
		//jsp목록 페이지에서 보여줘야 하는 값을 호출해서 넘겨주는것
		List<Notice> list = noticeMapper.selectNoticeBypage(map);
		//조회할목록의값
		model.addAttribute("list", list);
		//이전다음 표시를 위해서 현재페이지값이 필요
		model.addAttribute("currentPage", currentPage);
		//요청할 페이지
		return "getNoticeByPage";
	}
}
