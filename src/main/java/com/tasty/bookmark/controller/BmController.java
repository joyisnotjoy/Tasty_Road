package com.tasty.bookmark.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasty.bookmark.vo.BookmarkVO;

@Controller
@RequestMapping("/bookmark")
public class BmController {

	@GetMapping("/like.do")
	public String like(BookmarkVO vo) throws Exception {
		
		vo.setId("KFC");
		vo.setShopNo("234-45-56654");
		
		
		return "/bookmark/like";
	}
}
