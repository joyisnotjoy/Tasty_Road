package com.tasty.list.controller;

import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tasty.list.service.ListService;
import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/list")
@Log4j
public class ListController {
	
	private final String MODULE = "list";
	
	// 자동DI
	@Autowired
	@Qualifier("lsi")
	private ListService service;
	
	// 1. 맛집 리스트 - 검색 / list.do -get
	@GetMapping("list.do")
	// @ModelAttribute - 전달 받은 변수의 값을 model에 담아서 JSP까지 보내준다. 변수 이름으로 사용
	public String list(Model model, @ModelAttribute PageObject pageObject) throws Exception{
	
	log.info("list().pageObject : " + pageObject + " ..........");
	model.addAttribute("list", service.list(pageObject));
	
	return MODULE + "/list";
	}
	
	// 2. 맛집 보기 /view.do -get
	@GetMapping("/view.do")
	// Model 객체 - 처리된 데이터를 JSP에 전달
	// no, inc - 숫자 타입 : 원래는 String으로 데이터 전달. 없으면 null이된다. null을 숫자로
	public String view(Model model, String shopNo, PageObject pageObject) throws Exception{
		
	model.addAttribute("vo", service.view(shopNo));	
		
	return MODULE + "/view";
	}
	
	// 3. 맛집 수정 폼 / update.do - get
	@GetMapping("/update.do")
	public String updateForm(Model model, String shopNo)throws Exception{
		log.info("updateForm().shopNo : " + shopNo);
		// jsp에 수정할 데이터를 보내야 한다. 데이터가 DB에 있다. view()
		model.addAttribute("vo", service.view(shopNo));
		
		return MODULE + "/update";
	}

	
	// 3-1. 맛집 수정 처리 / update.do - post
	@PostMapping("/update.do")
	public String update(shopMemberVO vo, RedirectAttributes rttr, PageObject pageObject) throws Exception{
		log.info("update().vo :" + vo);
		int result = service.update(vo);
		
		if(result == 0) throw new Exception("게시판 수정 실패 - 정보를 확인해 주세요.");
		log.info("update().result : " + result);
		
		// addFlashAttribute() - 단 일회만 사용 가능한 정보 저장
		rttr.addFlashAttribute("msg", "게시판 글수정이 성공적으로 되었습니다.");
		
		return "redirect:view.do?shopNo=" + vo.getShopNo() + "&inc=0"
				+ "&page=" + pageObject.getPage() 
				+ "&perPageNum=" + pageObject.getPerPageNum()
				+ "&key=" + pageObject.getKey()
				// url로 요청되는 경우 서버의 한글이 적용되므로 utf-8로 encode 시켜서 보낸다.
				+ "&word=" + URLEncoder.encode(pageObject.getWord(), "utf-8")
				;
	}
	
	// 4. 맛집 삭제 / delete.do - get
	@PostMapping("/delete.do")
	public String delete(shopMemberVO vo, int perPageNum, RedirectAttributes rttr) throws Exception{
		
		log.info("delete().vo : " + vo);
		
		int result = service.delete(vo);
		// result 가 0이면 비밀번호가 틀림.
		if(result == 0) throw new Exception("게시판 삭제 실패 - 정보를 확인해 주세요.");

		// addFlashAttribute() - 단 일회만 사용 가능한 정보 저장
		rttr.addFlashAttribute("msg", "게시판 글삭제가 성공적으로 되었습니다.");
		
		
		return "redirect:list.do?perPageNum=" + perPageNum;
	}
	
	
}
