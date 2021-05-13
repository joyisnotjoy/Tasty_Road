package com.tasty.list.service;

import java.util.List;

import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

public interface ListService {

	// 1. 맵 리스트 , 전체 데이터 갯수 + 리스트 데이터
	public List<shopMemberVO> list(PageObject pageObject) throws Exception;

	// 2. 맛집 보기	
	//  조회수 1증가(리스트->글보기) + 글보기 데이터
	public shopMemberVO view(String shopNo) throws Exception;
//	public BoardVO view(Long no, int inc) throws Exception;
	
	// 3. 맛집 수정
	public int update(shopMemberVO vo) throws Exception;

	// 4. 맛집 삭제
	public int delete(shopMemberVO vo) throws Exception;
	
}
