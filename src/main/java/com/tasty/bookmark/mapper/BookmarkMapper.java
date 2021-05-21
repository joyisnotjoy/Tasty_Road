package com.tasty.bookmark.mapper;

import com.tasty.bookmark.vo.bookmarkVO;

public interface BookmarkMapper {

	public int like(bookmarkVO vo) throws Exception; 
	
	public void unlike(bookmarkVO vo) throws Exception; 
}
