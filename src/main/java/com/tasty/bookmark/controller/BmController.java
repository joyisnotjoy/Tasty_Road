package com.tasty.bookmark.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasty.bookmark.service.BookmarkService;
import com.tasty.bookmark.vo.bookmarkVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/bookmark")
@Log4j
public class BmController {
	// 자동DI
		@Autowired
		@Qualifier("bsi")
		private BookmarkService service;
	//1. 맛집 북마크 등록 / write
		@PostMapping(value = {"/like.do"}, 
				consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
				produces = {"application/text; charset=utf-8"})
		public ResponseEntity<String> like1(@RequestBody bookmarkVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
			
			log.info("like().vo : " + vo);

			int result =  service.like(vo);
			 
			log.info(result);
			
			 return new ResponseEntity<String>
			 ("즐겨찾기가 완료되었습니다.",HttpStatus.OK);
		
		
			}

//	@GetMapping("/like.do")
//	public String like(BookmarkVO vo, HttpSession session) throws Exception {
//		
//		vo.setId("KFC");
//		vo.setShopNo("234-45-56654");
//		
//		session.setAttribute("login", vo);
//		log.info(session.getAttribute("login"));
//		return "/bookmark/like";
//	}
//	
}
