package com.tasty.bookmark.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasty.bookmark.service.BookmarkService;
import com.tasty.bookmark.vo.BookmarkVO;
import com.tasty.list.service.ListService;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/bookmark")
@Log4j
public class BookmarkController {
	
	private final String MODULE = "bookmark";
	
	// 자동DI
	@Autowired
	@Qualifier("bsi")
	private BookmarkService service;
	
	//1. 맛집 북마크 등록 / write
	@GetMapping("like.do")
	public String like(BookmarkVO vo) throws Exception {
		vo.setId("test");
		vo.setShopNo("123-45-67890");
		log.info(vo);
		 service.like(vo);
		return "/home";
	
	
		}
	// 2. 맛집 북마크 삭제 / delete.do - get
	@GetMapping("unlike.do")
	public String unlike(BookmarkVO vo) throws Exception {
		vo.setId("test");
		vo.setShopNo("123-45-67890");
		log.info(vo);
		service.unlike(vo);
		return  "/home";
	}
	
}
