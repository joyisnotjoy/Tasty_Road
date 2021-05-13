package com.tasty.chat.service;

import java.util.List;

import com.tasty.chat.vo.ChatVO;
import com.webjjang.util.PageObject;

public interface ChatService {
	
	//1. 채팅 리스트
	//전체 데이터의 수 + 리스트의 데이터
	public List<ChatVO> list(PageObject pageObject) throws Exception;
	
	//2. 채팅 보기
	public ChatVO view(Long no) throws Exception;
	
	//3. 채팅 전송하기
	public int write(ChatVO vo) throws Exception;
	
	//4. 채팅방 이름 수정하기
	public int update(ChatVO vo) throws Exception;
	
	//5. 채팅방 삭제하기
	public int delete(Long no) throws Exception;

}
