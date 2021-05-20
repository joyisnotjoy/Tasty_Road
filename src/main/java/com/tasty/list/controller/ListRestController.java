package com.tasty.list.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tasty.list.service.ListRestService;
import com.tasty.list.service.ReplyService;
import com.tasty.list.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/tlist")
@Log4j
public class ListRestController {
	
	// 자동 DI
	@Autowired
	@Qualifier("trsi")
	private ListRestService service;
	
	// 1. 맛집 리스트 - 검색 / list.do - get 
	@GetMapping(value = "/tlist.do",
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
		// 맛집에 대한 페이지 정보
		PageObject PageObject = new PageObject(repPage, repPerPageNum);
		log.info("list().replyPageObject : " + PageObject + ", shopNo : " + shopNo);
		
		map.put("pageObject", PageObject);
		map.put("rList", service.tlist(PageObject, shopNo));
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
//	// 0. 댓글 등록 처리 / write.do - post
//	@PostMapping(value = "/write.do",
//		consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
//		produces = {"application/text; charset=utf-8"})
//	public ResponseEntity<String> write(@RequestBody ReplyVO ro) throws Exception{
//		log.info("write().ro : " + ro);
//		
////		ReplyVO reply = new ReplyVO();
////		reply.setReplyNo(ReplyNo);
//		// db에 데이터 저장하기
//		service.write(ro);
////		log.info(service.write(ro));
//		return new ResponseEntity<String>
//		("댓글이 등록되었습니다.",HttpStatus.OK);
//	}
//	
//	// 0. 댓글 수정 처리 / update.do - patch
//	@PatchMapping(value = "/update.do",
//			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
//			produces = {"application/text; charset=utf-8"})
//	public ResponseEntity<String> update(@RequestBody ReplyVO ro) throws Exception {
//		
//		log.info("update().ro : " + ro);
//		
//		int result = service.update(ro);
//		
//		// 전달되는 데이터의 선언
//		String msg = "댓글 수정이 성공적으로 되었습니다.";
//		HttpStatus status = HttpStatus.OK;
//		
//		if(result == 0) {
//			msg = "댓글 수정 실패 - 정보를 확인해 주세요.";
//			status = HttpStatus.NOT_MODIFIED;
//		}
//		
//		log.info("update().msg : " + msg);
//		
//		return new ResponseEntity<String>(msg, status);
//	}
//	
//	// 0. 댓글 삭제 처리 / delete.do - delete 
//	@DeleteMapping(value = "/delete.do",
//			consumes = {MediaType.APPLICATION_JSON_UTF8_VALUE},
//			produces = {"application/text; charset=utf-8"})
//	public ResponseEntity<String> delete(@RequestBody ReplyVO ro)
//			throws Exception {
//		
//		log.info("delete().ro : " + ro);
//		
//		int result = service.delete(ro);
//
//		// 전달되는 데이터의 선언
//		String msg = "댓글 삭제가 성공적으로 되었습니다.";
//		HttpStatus status = HttpStatus.OK;
//		
//		if(result == 0) {
//			msg = "댓글 삭제 실패 - 정보를 확인해 주세요.";
//			status = HttpStatus.NOT_MODIFIED;
//		}
//		
//		log.info("update().msg : " + msg);
//		
//		return new ResponseEntity<String>(msg, status);
//	}
//	
	
}
