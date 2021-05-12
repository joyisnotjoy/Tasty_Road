package com.tasty.bookmark.mapper;

import com.tasty.bookmark.vo.BookmarkVO;

public interface BookmarkMapper {

	public void like(BookmarkVO vo); 
	
	public void unlike(BookmarkVO vo); 
}
