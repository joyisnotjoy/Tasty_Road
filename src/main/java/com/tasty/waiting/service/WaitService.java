package com.tasty.waiting.service;

import org.springframework.stereotype.Service;

import com.tasty.member.vo.shopMemberVO;

@Service
public interface WaitService {

	public int nowUpdate(shopMemberVO vo) throws Exception;
	
	public int totalUpdate(shopMemberVO vo) throws Exception;
	
}
