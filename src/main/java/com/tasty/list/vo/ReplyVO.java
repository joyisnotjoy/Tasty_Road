package com.tasty.list.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno;
	private Long replyNo;
	private String shopNo;
	
	private String content;
	private Date writeDate;
	private String id;
	

}
