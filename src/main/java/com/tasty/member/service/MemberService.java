package com.tasty.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;
import com.tasty.member.vo.shopMemberVO;
import com.webjjang.util.PageObject;

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

	// 전화번호 중복 체크(int 형)
	public void check_tel(String tel, HttpServletResponse response) throws Exception;
	
	// 회원 정보 보기
	public MemberVO myPage(LoginVO vo) throws Exception;

	// 회원 정보 보기
	public shopMemberVO myShopPage(LoginVO vo) throws Exception;
	
	// 회원 정보 수정
	public int memberUpdate(MemberVO vo) throws Exception;
	
	// 가게 정보 수정
	public int shopUpdate(shopMemberVO vo) throws Exception;
	
	// 이미지 수정
	public int updateFile(shopMemberVO vo) throws Exception;
	
	// 회원 탈퇴
	public int memberWithdraw(MemberVO vo,HttpServletResponse response, HttpSession session) throws Exception;
	
	/* 관리자 */
	// 회원 리스트
	public List<MemberVO> memberList(PageObject pageObject) throws Exception;
	
	// 회원 등급 수정
	public int gradeModify(MemberVO vo) throws Exception;
	
	// 회원 정보 보기
	public MemberVO view(String id) throws Exception;
	
	// 관리자의 사업자 등록
	public int shopReg(shopMemberVO vo) throws Exception;

	

}
