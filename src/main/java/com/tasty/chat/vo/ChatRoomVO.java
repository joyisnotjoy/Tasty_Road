package com.tasty.chat.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatRoomVO {
	
	private Long chatNo;
	private String content;
	private String id;
	private Date writeDate;

}
