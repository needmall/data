package com.needmall.admin.news.service;

import java.util.List;

import com.needmall.common.vo.NewsVO;

//import com.spring.client.board.vo.BoardVO;

public interface AdminNewsService {
	public List<NewsVO> adminNewsList();
	public NewsVO adminNewsDetail(NewsVO nvo);
//	public List<BoardVO> boardList(BoardVO bvo);
//	public int insertBoard(BoardVO bvo);
//	public BoardVO detailBoard(BoardVO bvo);
//	public int passwdCheck(BoardVO bvo);
//	public int deleteBoard(BoardVO bvo);
//	public int updateBoard(BoardVO bvo);
//	public int replyCount(int b_num);
}
