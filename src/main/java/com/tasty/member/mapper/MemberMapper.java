package com.tasty.member.mapper;

import java.util.List;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;
import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {

	// 로그인
	public LoginVO login(LoginVO vo);

	// 회원가입
	public int join(MemberVO vo);
	
	
	// 아이디 중복검사 (int 형)
	public int check_id(String id);
	// 이메일 중복검사 (int 형)
	public int check_email(String email);
	// 전화번호 중복검사 (int 형)
	public int check_tel(String tel);
	
	
	// 아이디 중복검사(String 형)
	public MemberVO checkId(String id);
	
	// 이메일 중복검사(VO 형)
	public MemberVO checkEmail(MemberVO vo);

	// 비밀번호 중복검사(VO 형)
	public MemberVO checkPw(MemberVO vo);

	// 아이디 찾기
	public MemberVO findId(MemberVO vo);
	
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;
	
	// 내 정보 보기
	public MemberVO myPage(LoginVO vo);

	// 가게 정보 보기
	public shopMemberVO myShopPage(LoginVO vo);
	
	// 회원 정보 수정
	public int memberUpdate(MemberVO vo);
	
	// 가게 정보 수정
	public int shopUpdate(shopMemberVO vo);
	
	// 이미지 수정
	public int updateFile(shopMemberVO vo);
	
	public int memberWithdraw(MemberVO vo);
	
	
	
	/* 관리자 */
	public List<MemberVO> memberList(PageObject pageObject);
	
	public Long getTotalRow(PageObject pageObject);
	
	public int gradeModify(MemberVO vo);
	
	public MemberVO view(String id);
	
	public int shopReg(shopMemberVO vo);
	
	
	
	/* 지도 */
	public List<shopMemberVO> getMap(shopMemberVO vo);
}
