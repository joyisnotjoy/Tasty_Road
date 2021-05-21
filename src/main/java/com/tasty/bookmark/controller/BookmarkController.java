package com.tasty.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public ResponseEntity<String> like1(@RequestBody BookmarkVO vo) throws Exception {
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
//	// 1. 맵 리스트 - 검색 / list.do -get
//	@GetMapping("list.do")
//	// @ModelAttribute - 전달 받은 변수의 값을 model에 담아서 JSP까지 보내준다. 변수 이름으로 사용
//	public String list(Model model, @ModelAttribute PageObject pageObject) throws Exception{
//	
//	log.info("list().pageObject : " + pageObject + " ..........");
//	model.addAttribute("list", service.list(pageObject));
//	
//	return MODULE + "/list";
//	}
//	
//	// 2. 맛집 보기 /view.do -get
//	@GetMapping("/view.do")
//	// Model 객체 - 처리된 데이터를 JSP에 전달
//	// no, inc - 숫자 타입 : 원래는 String으로 데이터 전달. 없으면 null이된다. null을 숫자로
//	public String view(Model model, String shopNo, PageObject pageObject) throws Exception{
//		
//	model.addAttribute("vo", service.view(shopNo));	
//		
//	return MODULE + "/view";
//	}
//	
	// 3. 맛집 북마크 등록 
	@GetMapping("like.do")
	public String like(BookmarkVO vo) throws Exception {
		vo.setId("test1");
		vo.setShopNo("123-45-67890");
		log.info(vo);
		 service.like(vo);
		return "/home";
	
	
		}
	// 2. 맛집 북마크 삭제 / delete.do - get
	@GetMapping("unlike.do")
	public String unlike(BookmarkVO vo) throws Exception {
		vo.setId("test");
		vo.setShopNo("123-45-67890");
		log.info(vo);
		service.unlike(vo);
		return  "/home";
	}
	
}
