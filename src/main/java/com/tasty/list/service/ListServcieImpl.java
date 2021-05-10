package com.tasty.list.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.list.mapper.ListMapper;
import com.tasty.member.vo.MemberVO;
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
	public List<MemberVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
