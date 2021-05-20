package com.tasty.list.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.list.mapper.ListMapper;
import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("trsi")
@Log4j
public class ListRestServcieImpl implements ListRestService {
	
	// mapper 이용해서 DB처리
	@Inject
	private ListMapper mapper;

	// 1. 맛집 리스트
	@Override
	public List<shopMemberVO> tlist(PageObject pageObject, String shopNo) throws Exception {
		// TODO Auto-generated method stub
		// 페이지 처리를 위한 전체 데이터 가져오기  
		// startRow와 endRow가 계산이 된다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("pageObject : " + pageObject);
		return mapper.list(pageObject);
	}

	// 2. 맛집 보기
	@Override
	public shopMemberVO view(String shopNo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(shopNo);
	}

	// 3. 맛집 수정
	@Override
	public int update(shopMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// 4. 맛집 삭제
	@Override
	public int delete(shopMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}


}
