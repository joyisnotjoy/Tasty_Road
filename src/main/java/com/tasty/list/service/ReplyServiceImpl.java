package com.tasty.list.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.list.mapper.ReplyMapper;
import com.tasty.list.vo.ReplyVO;
import com.webjjang.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
// private 변수에 대한 자동 DI - 생성자
@AllArgsConstructor
@Qualifier("rsi")
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	private ReplyMapper mapper;

	@Override
	public List<ReplyVO> list(PageObject pageObject, String shopNo) throws Exception {
		// TODO Auto-generated method stub
		// 게시판 글번호에 맞는 전체 데이터 갯수 가져오기
//		pageObject.setTotalRow(mapper.getTotalRow(shopNo));
		pageObject.setTotalRow(mapper.getTotalRow(shopNo));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageObject", pageObject);
		map.put("shopNo", shopNo);
		return mapper.list(map);
	}

	@Override
	public int write(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

	
}
