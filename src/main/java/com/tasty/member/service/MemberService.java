package com.tasty.member.service;

import javax.servlet.http.HttpServletResponse;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

public interface MemberService {

	public LoginVO login(LoginVO vo, HttpServletResponse response) throws Exception;
	
	public int join(MemberVO vo, HttpServletResponse response) throws Exception;
	
	public MemberVO findId(HttpServletResponse response, MemberVO vo) throws Exception;
	
	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;

	//비밀번호찾기
	public MemberVO findPw(HttpServletResponse response, MemberVO vo) throws Exception;
	
	// 아이디 중복 체크(int 형)
	public void check_id(String id, HttpServletResponse response) throws Exception;
	
	// 이메일 중복 체크(int 형)
	public void check_email(String email, HttpServletResponse response) throws Exception;

}
