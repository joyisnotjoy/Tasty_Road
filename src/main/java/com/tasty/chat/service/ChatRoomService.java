package com.tasty.chat.service;

import java.util.List;

import com.tasty.chat.vo.ChatRoomVO;

public interface ChatRoomService {
	
	//1. 리스트
	public List<ChatRoomVO> list(Long no) throws Exception;
	
	//2. 보기는 chat에 포함
	
	//3. 채팅 전송하기
	public int write(ChatRoomVO vo) throws Exception;
	
	// 수정이랑 삭제는 xxxxxxxxx

}
