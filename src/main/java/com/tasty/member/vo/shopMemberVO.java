package com.tasty.member.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class shopMemberVO {
	
	
	private String shopName;
	private String shopNo;
	private String address;
	private String image;
	private String content;
	private Long now;
	private Long total;
	private Long wait;
	private String id;
	private String tel;

	// 파일 한 개 첨부 - 처리를 위한 변수
	private MultipartFile multipartFile;
}
