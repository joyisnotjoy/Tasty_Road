package com.tasty.list.service;

import java.util.List;

import com.tasty.list.vo.ReplyVO;
import com.webjjang.util.PageObject;

public interface ReplyService {

	// 1. 댓글 리스트(보기까지 함께 처리) - 페이지 처리  
	public List<ReplyVO> list(PageObject pageObject, String shopNo) throws Exception;
	
	// 2. 댓글 쓰기 
	public int write(ReplyVO ro) throws Exception;

	// 3. 댓글 수정
	public int update(ReplyVO ro) throws Exception;
	
	// 4. 댓글 삭제
	public int delete(ReplyVO ro) throws Exception;


}
