package com.tasty.chat.mapper;

import java.util.List;

import com.tasty.chat.vo.ChatRoomVO;

public interface ChatRoomMapper {
	
	//1. 채팅은 페이징 처리를 할 필요 xxxx
	public List<ChatRoomVO> list(Long no) throws Exception;
	
	//1-1. 채팅 전체 데이터 가지고 오기
	public Long getTotalRow(Long no) throws Exception;
	
	//2. 채팅 보기는 리스트에 표시해..
	
	//3. 채팅 쓰기
	public int write(ChatRoomVO vo) throws Exception;
	
	//4. 수정이랑 삭제는 필요 xxxx
	

}
