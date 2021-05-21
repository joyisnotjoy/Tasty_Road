package com.tasty.bookmark.service;

import com.tasty.bookmark.vo.bookmarkVO;

public interface BookmarkService {
	
	public int like(bookmarkVO vo) throws Exception; 
		
	public void unlike(bookmarkVO vo)throws Exception; 
}
