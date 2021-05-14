package com.tasty.waiting.mapper;

import com.tasty.member.vo.shopMemberVO;

public interface WaitingMapper {

	public int nowUpdate(shopMemberVO vo) throws Exception;
	
	public int totalUpdate(shopMemberVO vo) throws Exception;
	
}
