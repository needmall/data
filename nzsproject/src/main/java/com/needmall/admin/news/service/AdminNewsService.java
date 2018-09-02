package com.needmall.admin.news.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.needmall.common.vo.NewsVO;

//import com.spring.client.board.vo.BoardVO;

public interface AdminNewsService {
	public List<NewsVO> adminNewsList();
	public NewsVO adminNewsDetail(NewsVO nvo);
	public int adminNewsDelete(NewsVO bvo, HttpServletRequest request);
	public int adminNewsUpdate(NewsVO bvo, HttpServletRequest request);
	public int adminNewsInsert(NewsVO bvo, HttpServletRequest request);
}
