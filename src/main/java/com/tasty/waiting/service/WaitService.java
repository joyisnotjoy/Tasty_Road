package com.tasty.waiting.service;

import org.springframework.stereotype.Service;

import com.tasty.bookmark.vo.bookmarkVO;
import com.tasty.member.vo.shopMemberVO;
import com.tasty.waiting.vo.waitVO;

@Service
public interface WaitService {
	
	public waitVO wait(String shopNo) throws Exception;

	public int nowUpdate(shopMemberVO vo) throws Exception;
	
	public int totalUpdate(shopMemberVO vo) throws Exception;
	
}
