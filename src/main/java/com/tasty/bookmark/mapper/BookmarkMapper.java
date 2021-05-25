package com.tasty.bookmark.mapper;

import com.tasty.bookmark.vo.bookmarkVO;

public interface BookmarkMapper {
	
	public bookmarkVO bookmark(String shopNo) throws Exception;

	public int like(bookmarkVO vo) throws Exception;
	public int increase(bookmarkVO vo) throws Exception;
	
	public int unlike(bookmarkVO vo) throws Exception;
	public int decrease(bookmarkVO vo) throws Exception;
}
