package com.tasty.chat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.chat.mapper.ChatMapper;
import com.tasty.chat.vo.ChatVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("csi")
public class ChatServiceImpl implements ChatService {
	
	@Inject
	private ChatMapper mapper;

	//1. 리스트
	@Override
	public List<ChatVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		log.info("pageObject : " + pageObject);
		
		return mapper.list(pageObject);
	}

	//2.보기
	@Override
	public ChatVO view(Long no) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.view(no);
	}

	//3. 쓰기
	@Override
	public int write(ChatVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.write(vo);
	}

	//4. 수정
	@Override
	public int update(ChatVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.update(vo);
	}

	//5. 삭제
	@Override
	public int delete(ChatVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.delete(vo);
	}

}
