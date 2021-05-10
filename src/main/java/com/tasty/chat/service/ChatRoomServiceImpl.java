package com.tasty.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.chat.mapper.ChatRoomMapper;
import com.tasty.chat.vo.ChatRoomVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("crsi")
@AllArgsConstructor
@Log4j
public class ChatRoomServiceImpl implements ChatRoomService {
	
	private ChatRoomMapper mapper;

	@Override
	public List<ChatRoomVO> list(Long no) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.list(no);
	}

	@Override
	public int write(ChatRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		log.info("write().vo" + vo);
		
		return mapper.write(vo);
	}

}
