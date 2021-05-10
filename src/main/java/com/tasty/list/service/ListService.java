package com.tasty.list.service;

import java.util.List;

import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

public interface ListService {

	// 1. 맵 리스트 , 전체 데이터 갯수 + 리스트 데이터
	public List<shopMemberVO> list(PageObject pageObject) throws Exception;
	
	

}
