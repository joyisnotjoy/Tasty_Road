package com.tasty.waiting.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.member.vo.shopMemberVO;
import com.tasty.waiting.mapper.WaitingMapper;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("waitsi")
@Log4j
public class WaitServiceImlp implements WaitService {


	
	@Inject
	private WaitingMapper mapper;
	
	@Override
	public int nowUpdate(shopMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.nowUpdate(vo);
		
	}

	@Override
	public int totalUpdate(shopMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.totalUpdate(vo);
		
	}

}
