package com.tasty.bookmark.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasty.bookmark.vo.BookmarkVO;
import com.tasty.member.vo.LoginVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/bookmark")
@Log4j
public class BmController {

	@PostMapping("/like.do")
	public String like(BookmarkVO vo, HttpSession session) throws Exception {

		LoginVO id = (LoginVO) session.getAttribute("login");
		
		if (id == null) {
			return "redirect:/member/loginForm.do";
		}
		
		log.info(id);
		
		return "/bookmark/like";

	}

//	@GetMapping("/like.do")
//	public String like(BookmarkVO vo, HttpSession session) throws Exception {
//		
//		vo.setId("KFC");
//		vo.setShopNo("234-45-56654");
//		
//		session.setAttribute("login", vo);
//		log.info(session.getAttribute("login"));
//		return "/bookmark/like";
//	}
//	
}
