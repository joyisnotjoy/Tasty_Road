package com.tasty.bookmark.service;

import com.tasty.bookmark.vo.BookmarkVO;

public interface BookmarkService {
	
	public void like(BookmarkVO vo) throws Exception; 
		
	public void unlike(BookmarkVO vo)throws Exception; 
}
