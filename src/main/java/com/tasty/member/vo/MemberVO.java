package com.tasty.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private Number memberNo;
	private String pw;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String gender;
	private String tel;
	private String email;
	private Date regDate;
	private Date conDate;
	private String status;
	private String address;
	private Number GradeNo;
	
}
