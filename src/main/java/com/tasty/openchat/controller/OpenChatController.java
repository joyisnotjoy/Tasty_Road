package com.tasty.openchat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.openchat.vo.OpenChatVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class OpenChatController {
	
	List<OpenChatVO> roomList = new ArrayList<OpenChatVO>();
	static int openRoomNo = 0;
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	/** 
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<OpenChatVO> createRoom(@RequestParam HashMap<Object, Object> params){
		String openRoomName = (String) params.get("openRoomName");
		if(openRoomName != null && !openRoomName.trim().equals("")) {
			OpenChatVO openRoom = new OpenChatVO();
			openRoom.setOpenRoomNo(++openRoomNo);
			openRoom.setOpenRoomName(openRoomName);
			roomList.add(openRoom);
		}
		log.info(roomList);

		return roomList;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<OpenChatVO> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int openRoomNo = Integer.parseInt((String) params.get("openRoomNo"));
		
		List<OpenChatVO> new_list = roomList.stream().filter(o->o.getOpenRoomNo()==openRoomNo).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("openRoomNumber", params.get("openRoomName"));
			mv.addObject("openRoomNo", params.get("openRoomNo"));
			mv.setViewName("chat");
		}else {
			mv.setViewName("openRoom");
		}
		return mv;
	}
}