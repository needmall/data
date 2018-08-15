package com.needmall.client.productall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductallDaoImpl implements ProductallDao {
	
	@Autowired
	private SqlSession session;
	
	
}
