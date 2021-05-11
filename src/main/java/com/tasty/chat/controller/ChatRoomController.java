package com.tasty.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tasty.chat.service.ChatRoomService;
import com.tasty.chat.service.ChatService;
import com.tasty.chat.vo.ChatRoomVO;
import com.tasty.chat.vo.ChatVO;
import com.tasty.member.vo.LoginVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/chatRoom")
@Log4j
public class ChatRoomController {
	
	//DI
	@Autowired
	@Qualifier("crsi")
	private ChatRoomService service;
	
	@Autowired
	@Qualifier("csi")
	private ChatService chatService;
	
	@GetMapping(value = "/list.do", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	// ResponseEmtity : 실행 상태 코드와 함께 실행 결과를 클라이언트 쪽으로 전달할 때 사용하는 객체
	public ResponseEntity<String> list(Long no, Model model) throws Exception{
		log.info("list().no : " + no);
		
		model.addAttribute("list", service.list(no));
		
		return new ResponseEntity<String>("채팅방에 입장했습니다.", HttpStatus.OK);
	}
	
	@PostMapping(value = "/write.do", consumes = { MediaType.APPLICATION_JSON_UTF8_VALUE }, produces = {
	"application/text; charset=utf-8" })
	public ResponseEntity<String> write(@RequestBody ChatRoomVO vo, HttpSession session) throws Exception{
		Long no = vo.getChatNo();
		
		ChatVO cvo = chatService.view(no);
		LoginVO loginVO = (LoginVO) session.getAttribute("login");
		String id = loginVO.getId();
		
		log.info("id : " + id);
		
		if(cvo.getId2().equals(id)) {	// accepter : test, login : test
			log.info("작동하였는가?");
			cvo.setId2(cvo.getId1());		// accepter : admin
			cvo.setId1(id);		// sender : test
		} else {
			vo.setId(id);
		}
		log.info("vo!!!!!!!!!!!!!!!!!!! : " +  vo);
		log.info("id2 : " + cvo.getId2());
		log.info("id1 : " + vo.getId());
		
		log.info("write().vo : " + vo);
		service.write(vo);
		return new ResponseEntity<String>("전송이 완료되었습니다.", HttpStatus.OK);
	}

}
