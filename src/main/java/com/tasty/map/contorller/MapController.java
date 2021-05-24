package com.tasty.map.contorller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasty.member.service.MemberService;
import com.tasty.member.vo.shopMemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/map")
public class MapController {
	
	// 자동 DI
	@Autowired
	@Qualifier("msi")
	private MemberService service;
	
	@GetMapping("/map.do")
	public void map(shopMemberVO vo, Model model) throws Exception {
		
		log.info("찍어보좌 con : " + vo);
		
		model.addAttribute("vo", service.getMap(vo));
		
	}
}
