package com.tasty.bookmark.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tasty.bookmark.mapper.BookmarkMapper;
import com.tasty.bookmark.vo.BookmarkVO;

import lombok.extern.log4j.Log4j;

@Service
@Qualifier("bsi")
@Log4j
public class BookmarkServiceImpl implements BookmarkService{

	@Inject
	private BookmarkMapper mapper;
	
	@Override
	public void like(BookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.like(vo);
		log.info(vo);
	}

	@Override
	public void unlike(BookmarkVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.unlike(vo);
	}

}
