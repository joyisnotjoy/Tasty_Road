package com.tasty.chat.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	
	private Long chatNo;
	private String id1;
	private String id2;
	private String chatName;
	private Date acceptDate;

}
