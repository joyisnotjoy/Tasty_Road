package com.tasty.bookmark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasty.bookmark.service.BookmarkService;
import com.tasty.bookmark.vo.bookmarkVO;
import com.tasty.member.vo.LoginVO;

import lombok.extern.log4j.Log4j;
@RestController
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
	public ResponseEntity<String> like(@RequestBody bookmarkVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		log.info("like().vo : " + vo);

		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		
		//id에 로그인한 아이디 담기
		String id = loginVO.getId();
		 
		if (id == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요한 서비스 입니다");
		}		
		// 로그인 된 아이디 확인
//		log.info("로그인 id 확인 : " + id);
		
		vo.setId(id);
		
//		vo.setId("test");
//		vo.setShopNo("123-45-67890");
		
		// db에 데이터 저장
		 service.like(vo);
		 return new ResponseEntity<String>
		 ("즐겨찾기가 완료되었습니다.",HttpStatus.OK);
	
	
		}
	
	
		@GetMapping(value = "/view.do", produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<bookmarkVO> view(bookmarkVO vo) throws Exception {

			log.info("기본 좋아요 표시.");
			
			return new ResponseEntity<bookmarkVO>(service.bm(vo), HttpStatus.OK);
		}
		
		
		
//	 2. 맛집 북마크 삭제 / delete.do - get
	@PostMapping(value = "/unlike.do",
			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> unlike(@RequestBody bookmarkVO vo) throws Exception {
//		vo.setId("test");
//		vo.setShopNo("123-45-67890");
		log.info("unlike().vo : " + vo);
		  
		int result = service.unlike(vo);
		
		// 전달되는 데이터의 선언
		String msg = "즐겨찾기가 해제되었습니다.";
		HttpStatus status = HttpStatus.OK;
		
		if(result == 0) {
			msg = "즐겨찾기 해제 실패 - 즐겨찾기가 되어있는지 확인해주세요.";
		}
		log.info("unlike().msg: " + msg);
		return  new ResponseEntity<String>(msg, status);
	}
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
//	// 3. 맛집 북마크 등록 
//	@GetMapping("like.do")
//	public String like(bookmarkVO vo) throws Exception {
//		vo.setId("test1");
//		vo.setShopNo("123-45-67890");
//		log.info(vo);
//		 service.like(vo);
//		return "/home";
//	
//	
//		}
//	// 2. 맛집 북마크 삭제 / delete.do - get
//	@GetMapping("unlike.do")
//	public String unlike(bookmarkVO vo) throws Exception {
//		vo.setId("test");
//		vo.setShopNo("123-45-67890");
//		log.info(vo);
//		service.unlike(vo);
//		return  "/home";
//	}
//	
}
