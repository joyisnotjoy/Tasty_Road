package com.tasty.chat.mapper;

import java.util.List;

import com.tasty.chat.vo.ChatVO;
import com.webjjang.util.PageObject;

public interface ChatMapper {
	
	//1. list
	public List<ChatVO> list(PageObject pagrObject);
	
	//1-1. getTotalRow
	public Long getTotalRow(PageObject pageObject);
	
	//2. chat view
	public ChatVO view(Long no);
	
	//3. chat write
	public int write(ChatVO vo);
	
	//4. chat update
	public int update(ChatVO vo);
	
	//5. chat delete
	public int delete(Long no);

}
