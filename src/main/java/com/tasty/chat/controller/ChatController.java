package com.tasty.chat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasty.chat.service.ChatService;
import com.tasty.chat.vo.ChatVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/chat")
@Log4j
public class ChatController {

	private final String MODULE = "chat";

	// 자동 DI
	@Autowired
	@Qualifier("csi")
	private ChatService service;

	@GetMapping("/list.do")
	public String list(Model model, PageObject pageObject, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		log.info("list().pageObject : " + pageObject);

		model.addAttribute("list", service.list(pageObject));
		return MODULE + "list";
	}

	// 채팅 보기
	@GetMapping("/view.do")
	public String view(Model model, Long no, @ModelAttribute PageObject pageObject) throws Exception {

		model.addAttribute("vo", service.view(no));
		return MODULE + "/view";
	}

	// 채팅 폼
	@GetMapping("/write.do")
	public String writeForm() {
		return MODULE + "/write";
	}

	// 채팅 처리
	@PostMapping("/write.do")
	public String write(ChatVO vo, int perPageNum, RedirectAttributes rttr) throws Exception {
		log.info("write().vo : " + vo);

		service.write(vo);
		rttr.addFlashAttribute("msg", "채팅방 생성이 완료되었습니다.");

		return "redirect:list.do?perPageNum=" + perPageNum;
	}

	// 이름 수정
	@GetMapping("/update.do")
	public String updateForm(Model model, ChatVO vo) throws Exception {
		log.info("updateForm().vo : " + vo);
		model.addAttribute("vo", service.update(vo));

		return MODULE + "/update";
	}

	// 수정 처리
	@PostMapping("/update.do")
	public String update(ChatVO vo, RedirectAttributes rttr, PageObject pageObject, Long no) throws Exception {
		log.info("update().vo : " + vo);
		int result = service.update(vo);
		if (result == 0)
			throw new Exception("정보를 확인해주세요.");
		log.info("update().result : " + result);

		rttr.addFlashAttribute("msg", "수정이 완료되었습니다");

		return "redirect:view.do?no=" + vo.getChatNo() + "&page" + pageObject.getPage() + "&perPageNum="
				+ pageObject.getPerPageNum();
	}

	// 삭제
	@GetMapping("/delete.do")
	public String delete(Long no, RedirectAttributes rttr) throws Exception {
//			public String delete(Long no, int perPageNum, RedirectAttributes rttr) throws Exception {
		log.info("delete().vo : " + no);
		int result = service.delete(no);
		if (result == 0)
			throw new Exception("정보를 확인해주세요.");

		rttr.addFlashAttribute("msg", "삭제가 완료되었습니다.");

		return "redirect:list.do";
	}

}
