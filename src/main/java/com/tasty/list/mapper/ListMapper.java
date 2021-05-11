package com.tasty.list.mapper;

import java.util.List;

import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

public interface ListMapper {
	
	// 1. 맛집 리스트
	public List<shopMemberVO> list(PageObject pageObject);

	// 1-1. 맛집 리스트의 페이지 처리를 위한 전체 데이터 갯수
	public Long getTotalRow(PageObject pageObject);

	// 2. 맛집 보기
	public shopMemberVO view(String shopNo);
	
	// 2-1. 맛집 조회수 1 증가
//	public int increase(Long no);

	// 3. 게시판 글쓰기
//	public int write(shopMemberVO vo);
	
	// 4. 게시판 글수정
//	public int update(shopMemberVO vo);
	
	// 5. 게시판 글삭제
//	public int delete(shopMemberVO vo);
	


}
