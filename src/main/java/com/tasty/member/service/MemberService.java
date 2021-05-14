package com.tasty.member.service;

import javax.servlet.http.HttpServletResponse;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

public interface MemberService {

	public LoginVO login(LoginVO vo) throws Exception;
	
	public int join(MemberVO vo) throws Exception;
	
	public MemberVO findId(HttpServletResponse response, MemberVO vo) throws Exception;
	
	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;

	//비밀번호찾기
	public MemberVO findPw(HttpServletResponse response, MemberVO vo) throws Exception;

}
