package com.tasty.bookmark.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasty.bookmark.service.BookmarkService;
import com.tasty.bookmark.vo.bookmarkVO;
import com.tasty.member.vo.LoginVO;

import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/bm")//임시
@Log4j
public class bookmarkListController {
	
	// 자동DI
	@Autowired
	@Qualifier("bsi")
	private BookmarkService service;
	
	// 3. 맛집 즐찾 리스트 - 검색 / list.do - get -> list.json 불가능 : xml만 서비스
	@GetMapping("/list.do")
	// ResponseEntity : 실행 상태 코드와 함께 실행결과를 클라이언트에서 전달할때 사용하는 객체
	public String list(bookmarkVO vo, HttpSession session) throws Exception {
		
		LoginVO login = (LoginVO) session.getAttribute("login");
		
		vo.setId(login.getId()) ;
		
		service.list(vo);
		
		return "bookmark/list";
	}
//	
}
