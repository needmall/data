package com.needmall.admin.news.dao;

import java.util.List;

import com.needmall.common.vo.NewsVO;



public interface AdminNewsDao {
	public List<NewsVO> adminNewsList();
	public NewsVO adminNewsDetail(NewsVO  nvo);
//	public List<BoardVO> boardList(BoardVO bvo);
//	public int insertBoard(BoardVO bvo);
//	public BoardVO detailBoard(BoardVO bvo);
//	public int passwdCheck(BoardVO bvo);
//	public int deleteBoard(BoardVO bvo);
//	public int updateBoard(BoardVO bvo);
}
