package com.tasty.member.mapper;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

public interface MemberMapper {

	public LoginVO login(LoginVO vo);

	public int join(MemberVO vo);

	public int shopJoin(MemberVO vo);
	
}
