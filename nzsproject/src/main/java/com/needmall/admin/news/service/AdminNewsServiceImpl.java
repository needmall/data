package com.needmall.admin.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.news.dao.AdminNewsDao;
import com.needmall.common.vo.NewsVO;



@Service
public class AdminNewsServiceImpl implements AdminNewsService {
	
	
	@Autowired
	private AdminNewsDao adminNewsDao;

	@Override
	public List<NewsVO> adminNewsList() {
		List<NewsVO> list = adminNewsDao.adminNewsList();
		return list;
	}

	@Override
	public NewsVO adminNewsDetail(NewsVO nvo) {		
		return adminNewsDao.adminNewsDetail(nvo);
	}
	
	
	
//	@Autowired
//	private ReplyDao replyDao;  //ReplyDao 사용을 위한  //답글 확인 메서드 사용
//
//	@Override
//	public List<BoardVO> boardList(BoardVO bvo) {
//		List<BoardVO> myList = null;			
//		//if(bvo.getSearch()=="")bvo.setSearch("all");
//		myList = boardDao.boardList(bvo);
//		return myList;
//	}
//
//	@Override
//	public int insertBoard(BoardVO bvo) {
//		int result = 0;
//		try {
//			
//			result=boardDao.insertBoard(bvo);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return 	result;	
//	}
//
//	@Override
//	public BoardVO detailBoard(BoardVO bvo) {		
//		bvo = boardDao.detailBoard(bvo);
//		return bvo;
//	}
//
//	@Override
//	public int passwdCheck(BoardVO bvo) {		
//		return boardDao.passwdCheck(bvo);
//	}
//
//	@Override
//	public int deleteBoard(BoardVO bvo) {
//		int result =0;
//		try {
//			bvo.setB_pwd(bvo.getB_pwd().trim());
//			result = boardDao.deleteBoard(bvo); 
//		}catch (Exception e) {
//			e.printStackTrace();
//			result = 0;
//		}
//		return 	result;		
//	}
//
//	@Override
//	public int updateBoard(BoardVO bvo)	{
//		int result =0;
//		try {
//			bvo.setB_pwd(bvo.getB_pwd().trim());
//			result = boardDao.updateBoard(bvo); 
//		}catch (Exception e) {
//			e.printStackTrace();
//			result = 0;
//		}
//		return 	result;	
//	}
//	
//	
//	// 보드에서 리플라이쪽 접근하기 위해 의존 객체 주입 필요 (필드 확인)
//	@Override
//	public int replyCount(int b_num) {
//		int result = replyDao.replyCount(b_num);		
//		return result;
//	}
//	

}
