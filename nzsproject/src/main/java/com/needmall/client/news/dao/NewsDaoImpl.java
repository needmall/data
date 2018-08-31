package com.needmall.client.news.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.NewsVO;



@Repository
public class NewsDaoImpl implements NewsDao {
	@Autowired
	private SqlSession session; //mybatis에서 필요

	@Override
	public List<NewsVO> newsList() {		
		return session.selectList("newsList");
	}

	@Override
	public List<NewsVO> newsDetail() {		
		return session.selectOne("newsDetail");
	}
	
	
	
//	@Override
//	public List<BoardVO> boardList(BoardVO bvo) {
//		return session.selectList("boardList", bvo);
//	}
//
//	@Override
//	public int insertBoard(BoardVO bvo) {
//		return session.insert("insertBoard", bvo);
//		
//	}
//
//	@Override
//	public BoardVO detailBoard(BoardVO bvo) {
//		
//		return (BoardVO)session.selectOne("detailBoard", bvo);
//	}
//
//	@Override
//	public int passwdCheck(BoardVO bvo) {			
//		return (Integer)session.selectOne("passwdCheck", bvo); 
//	}
//
//	@Override
//	public int deleteBoard(BoardVO bvo) {		
//		return session.delete("deleteBoard", bvo);
//	}
//
//	@Override
//	public int updateBoard(BoardVO bvo) {
//		return session.update("updateBoard", bvo);
//	}
//	
//	

	
}
