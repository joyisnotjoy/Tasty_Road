package com.tasty.member.mapper;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

public interface MemberMapper {

	// 로그인
	public LoginVO login(LoginVO vo);

	// 회원가입
	public int join(MemberVO vo);
	
	
	// 아이디 중복검사 (int 형)
	public int check_id(String id);
	// 이메일 중복검사 (int 형)
	public int check_email(String email);
	
	
	// 아이디 중복검사(String 형)
	public MemberVO checkId(String id);
	
	// 이메일 중복검사(VO 형)
	public MemberVO checkEmail(MemberVO vo);

	// 아이디 찾기
	public MemberVO findId(MemberVO vo);
	
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;

}
