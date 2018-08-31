package com.needmall.client.news.dao;

import java.util.List;

import com.needmall.common.vo.NewsVO;



public interface NewsDao {
	public List<NewsVO> newsList();
	public List<NewsVO> newsDetail(int n_num);
//	public List<BoardVO> boardList(BoardVO bvo);
//	public int insertBoard(BoardVO bvo);
//	public BoardVO detailBoard(BoardVO bvo);
//	public int passwdCheck(BoardVO bvo);
//	public int deleteBoard(BoardVO bvo);
//	public int updateBoard(BoardVO bvo);
}
