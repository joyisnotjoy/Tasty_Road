package com.tasty.bookmark.service;


import com.tasty.bookmark.vo.bookmarkVO;

public interface BookmarkService {
	public bookmarkVO bm(bookmarkVO vo) throws Exception;
	public int like(bookmarkVO vo) throws Exception; 
	public int unlike(bookmarkVO vo)throws Exception;
	public bookmarkVO list(bookmarkVO vo) throws Exception;
}
