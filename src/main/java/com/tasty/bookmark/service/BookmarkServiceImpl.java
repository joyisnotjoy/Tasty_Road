package com.tasty.bookmark.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.bookmark.mapper.BookmarkMapper;
import com.tasty.bookmark.vo.bookmarkVO;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("bsi")
@Log4j
public class BookmarkServiceImpl implements BookmarkService{

	@Inject
	private BookmarkMapper mapper;

	@Override
	public bookmarkVO bm(String shopNo) throws Exception {
		// TODO Auto-generated method stub

		bookmarkVO vo = new bookmarkVO();

		vo.setId("test");

		log.info(vo);

		return mapper.bookmark(shopNo);

	}

	@Override
	public int like(bookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub

		log.info(vo);
		return mapper.like(vo);
	}

	@Override
	public int unlike(bookmarkVO vo) throws Exception { 
		// TODO Auto-generated method stub
		mapper.unlike(vo);
		log.info(vo);
		return mapper.unlike(vo);
	}
	@Override
	public int increase(bookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.increase(vo);
		log.info(vo);
		return mapper.increase(vo);
	}
	@Override
	public int decrease(bookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.decrease(vo);
		log.info(vo);
		return mapper.decrease(vo);
	}

}
