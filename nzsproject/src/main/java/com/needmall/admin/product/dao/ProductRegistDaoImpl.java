package com.needmall.admin.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.Category1depVO;

@Repository
public class ProductRegistDaoImpl implements ProductRegistDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Category1depVO> category1dep() {		
		return session.selectList("category1dep");
	}


}
