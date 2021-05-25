package com.tasty.waiting.vo;

import java.util.Date;

import lombok.Data;

@Data
public class waitVO {

	String shopNo, id, myId;
	
	long now, total, wait, cnt;
	
	Date writeDate;
	
}
