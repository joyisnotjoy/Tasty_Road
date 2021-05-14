package com.tasty.waiting.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tasty.list.service.ListService;
import com.tasty.member.vo.shopMemberVO;
import com.tasty.waiting.service.WaitService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/waiting")
@Log4j
public class waitinController {

	@Inject
	@Qualifier("waitsi")
	private WaitService service;
	
	@Inject
	@Qualifier("lsi")
	private ListService lService;
	
	@GetMapping(value = "wait.do", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<shopMemberVO> wait(String shopNo) throws Exception {
		
		log.info("shopNo : " + shopNo);
		
		
		return new ResponseEntity<shopMemberVO>(lService.view(shopNo), HttpStatus.OK);
		
	}
	
}
