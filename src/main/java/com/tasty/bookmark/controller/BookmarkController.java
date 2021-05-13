package com.tasty.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasty.bookmark.service.BookmarkService;
import com.tasty.bookmark.vo.BookmarkVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/bm")//임시
@Log4j
public class BookmarkController {
	
	// 자동DI
	@Autowired
	@Qualifier("bsi")
	private BookmarkService service;
	
	//1. 맛집 북마크 등록 / write
	@PostMapping(value = "/like.do",
			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> Ulike(@RequestBody BookmarkVO vo) throws Exception {
		log.info("like().vo : " + vo);
		
		// db에 데이터 저장
		service.like(vo);
		
		return new ResponseEntity<String>
		("즐겨찾기가 완료되었습니다.",HttpStatus.OK);
		
		
//		vo.setId("test");
//		vo.setShopNo("123-45-67890");
//		log.info(vo);
//		 service.like(vo);
//		return "/home";
	
	
		}
	
	
	// 2. 맛집 북마크 삭제 / delete.do - get
//	@DeleteMapping(value = "/unlike.do",
//			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
//			produces = {"application/text; charset=utf-8"})
//	public ResponseEntity<String> unlike(@RequestBody BookmarkVO vo) throws Exception {
////		vo.setId("test");
////		vo.setShopNo("123-45-67890");
//		log.info("unlike().vo : " + vo);
//		  
//		service.unlike(vo);
//		
//		// 전달되는 데이터의 선언
//		String msg = "즐겨찾기가 해제되었습니다.";
//		HttpStatus status = HttpStatus.OK;
//		
//		if(service == null) {
//			msg = "즐겨찾기 해제 실패 - 즐겨찾기가 되어있는지 확인해주세요.";
//		}
//		log.info("update().msg: " + msg);
//		return  new ResponseEntity<String>(msg, status);
//	}
	
}
