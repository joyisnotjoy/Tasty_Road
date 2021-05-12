package com.tasty.list.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tasty.list.service.ReplyService;
import com.tasty.list.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies")
@Log4j
public class ReplyController {
	
	// 자동 DI
	@Autowired
	@Qualifier("rsi")
	private ReplyService service;
	
	// 1. 댓글 리스트 - 검색 / list.do - get 
	@GetMapping(value = "/list.do",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
						} )
	public ResponseEntity<Map<String, Object>> list(
			@RequestParam(defaultValue = "1") long repPage,
			@RequestParam(defaultValue = "5") long repPerPageNum,
			String shopNo)
		throws Exception {
		Map<String, Object> map = new HashMap<>();
		// 댓글에 대한 페이지 정보
		PageObject replyPageObject = new PageObject(repPage, repPerPageNum);
		log.info("list().replyPageObject : " + replyPageObject + ", no : " + shopNo);
		
		map.put("pageObject", replyPageObject);
		map.put("list", service.list(replyPageObject, shopNo));
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	// 0. 댓글 등록 처리 / write.do - post
	@PostMapping(value = "/write.do",
		consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
		produces = {"application/text; charset=utf-8"})
	public ResponseEntity<String> write(@RequestBody ReplyVO vo) throws Exception{
		log.info("write().vo : " + vo);
		
		// db에 데이터 저장하기
		service.write(vo);
		
		return new ResponseEntity<String>
		("댓글이 등록되었습니다.",HttpStatus.OK);
	}
	
	// 0. 댓글 수정 처리 / update.do - patch
	
	
	// 0. 댓글 삭제 처리 / delete.do - delete 
	
}
