package com.tasty.member.mapper;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

public interface MemberMapper {

	// 로그인
	public LoginVO login(LoginVO vo);

	// 회원가입
	public int join(MemberVO vo);
	
	public MemberVO checkId(String id);
	
	public MemberVO checkEmail(MemberVO vo);

	// 아이디 찾기
	public MemberVO findId(MemberVO vo);
	
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;

}
