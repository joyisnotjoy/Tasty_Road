package com.tasty.waiting.mapper;

import com.tasty.bookmark.vo.bookmarkVO;
import com.tasty.member.vo.shopMemberVO;
import com.tasty.waiting.vo.waitVO;

public interface WaitingMapper {
	
	public waitVO wait(String shopNo) throws Exception;
	
	public bookmarkVO bookmark(String shopNo) throws Exception;
	
	public int nowUpdate(shopMemberVO vo) throws Exception;
	
	public int totalUpdate(shopMemberVO vo) throws Exception;
	
}
