package com.tasty.chat.controller;

import java.util.List;

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

import com.tasty.chat.service.ChatRoomService;
import com.tasty.chat.vo.ChatRoomVO;
import com.tasty.member.vo.LoginVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/chatRoom")
@Log4j
public class ChatRoomController {

	// DI
	@Autowired
	@Qualifier("crsi")
	private ChatRoomService service;

	@GetMapping(value = "/list.do", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	// ResponseEmtity : 실행 상태 코드와 함께 실행 결과를 클라이언트 쪽으로 전달할 때 사용하는 객체
	public ResponseEntity<List<ChatRoomVO>> list(long no) throws Exception {
//	public ResponseEntity<String> list(Long no, Model model) throws Exception {
		log.info("list().no : " + no);
//		model.addAttribute("list", service.list(no));

		return new ResponseEntity<>(service.list(no), HttpStatus.OK);
	}

	@PostMapping(value = "/write.do", consumes = { MediaType.APPLICATION_JSON_UTF8_VALUE }, produces = {
			"application/text; charset=utf-8" })
	public ResponseEntity<String> write(@RequestBody ChatRoomVO vo, HttpSession session) throws Exception {
		//no에 chatNo를 담자
		long no = vo.getChatNo();
		log.info("chatNo : " + no);

		LoginVO loginVO = (LoginVO) session.getAttribute("login");

		//id에 로그인한 아이디를 담아라
		String id = loginVO.getId();

		//현재 로그인된 아이디 확인
		log.info("id@@@@@ : " + id);

		vo.setId(id);
		vo.setContent(vo.getContent());
		vo.setChatNo(no);

		service.write(vo);
		return new ResponseEntity<>("전송이 완료되었습니다.", HttpStatus.OK);
	}

}
