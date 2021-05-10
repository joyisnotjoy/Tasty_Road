package com.tasty.list.mapper;

import java.util.List;

import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

public interface ListMapper {
	
	// 1. 맵 리스트
	public List<shopMemberVO> list(PageObject pageObject);

	// 1-1. 게시판 리스트의 페이지 처리를 위한 전체 데이터 갯수
	public Long getTotalRow(PageObject pageObject);



}
