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
@Qualifier("lsi")
@Log4j
public class ListServcieImpl implements ListService {
	
	// mapper 이용해서 DB처리
	@Inject
	private ListMapper mapper;

	@Override
	public List<shopMemberVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		// 페이지 처리를 위한 전체 데이터 가져오기  
		// startRow와 endRow가 계산이 된다.
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("pageObject : " + pageObject);
		return mapper.list(pageObject);
	}

}
