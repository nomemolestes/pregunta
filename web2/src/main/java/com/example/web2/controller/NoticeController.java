package com.example.web2.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.web2.service.NoticeService;
import com.example.web2.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j//로그객체사용
@Controller//서블릿역할
public class NoticeController {
	@Autowired NoticeService noticeService;

	//공지사항 입력폼
	@GetMapping("/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	//공지사항 입력액션
	@PostMapping("/addNotice")
	public String addNotice(Notice notice) {
		Integer row = noticeService.addNotice(notice);
		log.debug("[김하늬]NoticeController.addNotice.param.notice : ",notice);
		return "redirect:/getNoticeByPage";//입력 후 목록으로..
	}
	//공지사항 삭제폼
	@GetMapping("/removeNotice")
	public String removeNotice(Model model
			,@RequestParam(name="noticeNo") int noticeNo) {
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute("notice", notice);
		return "removeNotice";
	}
	//공지사항 삭제액션
	@PostMapping("/removeNotice")
	public String removeNotice(Notice notice) {
		log.debug("[김하늬]NoticeController.removeNotice.param.notice : ",notice);
		noticeService.removeNotice(notice);
		return "redirect:/getNoticeByPage";//삭제 후 목록으로..
	}
	//공지사항 수정액션
	@PostMapping("/modifyNotice")
	public String modifyNotice(Notice notice) {
		log.debug("NoticeController.modifyNotice.param.notice : ", notice);
		noticeService.modifyNotice(notice);
		log.debug("NoticeController.modifyNotice.param.notice : ", notice);
		return "redirect:/getNoticeOne?noticeNo="+notice.getNoticeNo();//상세보기 컨트롤러로 redirect 그렇기때문에 noticeNo와 함께 감..
		
	}
	//공지사항 수정폼
	@GetMapping("/modifyNotice")
	public String modifyNotice(Model model
			,@RequestParam(name="noticeNo") int noticeNo) {
		log.debug("NoticeController.getNoticeOne.param.noticeNo : ", noticeNo);
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute("notice", notice);
		return "modifyNotice";
	}
	//공지사항 내용 상세보기
	@GetMapping("/getNoticeOne")
	public String getNoticeOne(Model model
			,@RequestParam(name="noticeNo") int noticeNo) {
		log.debug("NoticeController.getNoticeOne.param.noticeNo : ", noticeNo);
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute("notice", notice);
		return "getNoticeOne";
	}
	//페이징이 포함된 공지사항 목록조회
	@GetMapping("/getNoticeByPage")
	public String getNoticeByPage(Model model,
			@RequestParam(name="currentPage", defaultValue="1") int currentPage
			,@RequestParam(name="rowPerPage", defaultValue="10") int rowPerPage) {
		//뷰 호출할때 모델레이어로부터 반환된 값(모델)을 뷰로 보냄
		//서비스 호출.리스트를 뷰로 보냄
		Map<String, Object> map = noticeService.getNoticeByPage(currentPage, rowPerPage);
		//이전다음 표시를 위해서 현재페이지값이 필요
		model.addAttribute("list", map.get("list")); // request.setAttribute()기능
		model.addAttribute("lastPage", map.get("lastPage"));//lastPage를 값을 넘겨주는데, map에 들어있는 lastPage키워드의 값을 가져옴.
		model.addAttribute("currentPage", currentPage);
		//요청할 페이지
		return "getNoticeByPage";
	}
}
