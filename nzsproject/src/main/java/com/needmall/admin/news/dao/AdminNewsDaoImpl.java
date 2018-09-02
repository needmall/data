package com.needmall.admin.news.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.NewsVO;



@Repository
public class AdminNewsDaoImpl implements AdminNewsDao {
	@Autowired
	private SqlSession session; //mybatis에서 필요

	@Override
	public List<NewsVO> adminNewsList() {		
		return session.selectList("adminNewsList");
	}

	@Override
	public NewsVO adminNewsDetail(NewsVO nvo) {		
		return session.selectOne("adminNewsDetail", nvo);
	}

	@Override
	public int adminNewsDelete(NewsVO nvo) {		
		return session.delete("adminNewsDelete", nvo);
	}

	@Override
	public int adminNewsUpdate(NewsVO nvo) {		
		return session.update("adminNewsUpdate", nvo);
	}

	@Override
	public int adminNewsInsert(NewsVO nvo) {		
		return session.insert("adminNewsInsert", nvo);
	}
	
	
}
