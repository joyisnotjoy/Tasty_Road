package com.tasty.waiting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasty.list.service.ListService;
import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.shopMemberVO;


@Controller
@RequestMapping("/temp")
public class WaitController {

	private String MODULE = "temp";

	@Autowired
	@Qualifier("lsi")
	private ListService service;
	
	@GetMapping("/page.do")
	public String page() {
		
		return MODULE + "/page";
		
	}
	
	@GetMapping("/tempView.do")
	public String view(shopMemberVO vo, HttpSession session, RedirectAttributes rttr, String shopNo, Model model) throws Exception {
		
		LoginVO login = new LoginVO();
		
		login.setId("company");
		
		session.setAttribute("login", login);
		
		model.addAttribute("vo", service.view(shopNo));
		
		return MODULE + "/tempView";
		
	}
	
	
}
