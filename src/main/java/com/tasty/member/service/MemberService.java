package com.tasty.member.service;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

public interface MemberService {

	public LoginVO login(LoginVO vo) throws Exception;
	
	public int join(MemberVO vo) throws Exception;

	public int shopJoin(MemberVO vo) throws Exception;
}
