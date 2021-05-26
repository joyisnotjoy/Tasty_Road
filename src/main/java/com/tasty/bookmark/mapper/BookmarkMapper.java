package com.tasty.bookmark.mapper;

import java.util.List;

import com.tasty.bookmark.vo.bookmarkVO;

public interface BookmarkMapper {
	
	public bookmarkVO bookmark(bookmarkVO vo) throws Exception;

	public int like(bookmarkVO vo) throws Exception;
	
	public int unlike(bookmarkVO vo) throws Exception;

	public List<bookmarkVO> list(bookmarkVO vo) throws Exception;
}
