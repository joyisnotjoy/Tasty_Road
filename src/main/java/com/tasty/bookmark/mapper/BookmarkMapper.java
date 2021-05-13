package com.tasty.bookmark.mapper;

import com.tasty.bookmark.vo.BookmarkVO;

public interface BookmarkMapper {

	public int like(BookmarkVO vo) throws Exception; 
	
	public void unlike(BookmarkVO vo) throws Exception; 
}
