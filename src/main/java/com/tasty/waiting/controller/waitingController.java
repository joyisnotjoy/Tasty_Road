package com.tasty.waiting.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tasty.list.service.ListService;
import com.tasty.member.vo.shopMemberVO;
import com.tasty.waiting.service.WaitService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/waiting")
@Log4j
public class waitingController {

	@Inject
	@Qualifier("waitsi")
	private WaitService service;
	
	@Inject
	@Qualifier("lsi")
	private ListService lService;
	
	@GetMapping(value = "/wait.do", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<shopMemberVO> wait(String shopNo) throws Exception {
		
		log.info("shopNo : " + shopNo);
		
		return new ResponseEntity<shopMemberVO>(lService.view(shopNo), HttpStatus.OK);
		
	}
	
	@PatchMapping(value = "/nowUpdate.do", consumes = { MediaType.APPLICATION_JSON_UTF8_VALUE }, produces = { "application/text; charset=UTF-8" })
	public ResponseEntity<String> update(@RequestBody shopMemberVO vo) throws Exception {
		
		log.info("updateVO [vo] : " + vo);
		
		int result = service.nowUpdate(vo);
		
		String msg = "수정되었습니다.";
		
		HttpStatus status = HttpStatus.OK;
		
		if(result == 0) {
			
			msg = "수정에 실패하였습니다. 같은 증상이 계속될 시 고객센터에 문의해 주세요";
			
			status = HttpStatus.NOT_MODIFIED;
			
		}
		
		log.info("nowUpdate.do [msg] : " + msg);
		
		return new ResponseEntity<String>(msg, status);
		
	}
	
}
