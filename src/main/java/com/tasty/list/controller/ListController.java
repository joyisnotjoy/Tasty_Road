package com.tasty.list.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tasty.list.service.ListService;
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
	
	// 1. 맵 리스트 - 검색 / list.do -get
	@GetMapping("list.do")
	public String list(Model model, PageObject pageObject) throws Exception{
	
	model.addAttribute("list", service.list(pageObject));
	
	return MODULE + "/list";
	
	
	}
}
