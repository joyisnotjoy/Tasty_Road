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
		public ResponseEntity<String> like(@RequestBody bookmarkVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
			
			log.info("like().vo : " + vo);

			int result =  service.like(vo);
			 
			log.info(result);
			
			 return new ResponseEntity<String>
			 ("즐겨찾기가 완료되었습니다.",HttpStatus.OK);
		

				
			}
		@GetMapping(value = "/view.do", produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<bookmarkVO> view(bookmarkVO vo) throws Exception {
			
			log.info("기본 좋아요 표시.");
			
			return new ResponseEntity<bookmarkVO>(service.bm(vo), HttpStatus.OK);
		}
			//2. 맛집 북마크 삭제 / write
			@PostMapping(value = {"/unlike.do"}, 
					consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
					produces = {"application/text; charset=utf-8"})
			public ResponseEntity<String> unlike(@RequestBody bookmarkVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
				
				log.info("unlike().vo : " + vo);
				
				LoginVO loginVO = (LoginVO) session.getAttribute("login");
				
				//id에 로그인한 아이디 담기
				String id = loginVO.getId();
				vo.setId(id);
				
				log.info(id);
				
				
				int result =  service.unlike(vo);
				// 전달되는 데이터의 선언
				String msg = "즐겨찾기가 해제되었습니다.";
				HttpStatus status = HttpStatus.OK;
				log.info(result);
				if(result == 0) {
					msg = "즐겨찾기 해제 실패 - 즐겨찾기가 되어있는지 확인해주세요.";
				}
				log.info("unlike().msg: " + msg);
				return new ResponseEntity<String>(msg, status);
//				("즐겨찾기가 취소되었습니다.",HttpStatus.OK);
				
				
			}
			
			// 3. 맛집 즐찾 리스트 - 검색 / list.do - get -> list.json 불가능 : xml만 서비스
			@GetMapping(value = "/list.do",
					produces = {
							MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE
								} )
			// ResponseEntity : 실행 상태 코드와 함께 실행결과를 클라이언트에서 전달할때 사용하는 객체
			public ResponseEntity<String> list(@RequestBody bookmarkVO vo) throws Exception {
//				public ResponseEntity<String> list(Long no, Model model) throws Exception {
//					model.addAttribute("list", service.list(no));
				
					return new ResponseEntity<String>(HttpStatus.OK);
				}
			
}
