package com.tasty.member.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.member.mapper.MemberMapper;
import com.tasty.member.vo.LoginVO;
import com.tasty.member.vo.MemberVO;

// 자동 생성
@Service
@Qualifier("msi")
public class MemberServiceImpl implements MemberService {

	// 자동 DI- Mapper
	@Inject
	private MemberMapper mapper;
	
	@Override
	public LoginVO login(LoginVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

	@Override
	public int join(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.join(vo);
	}

	@Override
	public int shopJoin(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.shopJoin(vo);
	}

}
 