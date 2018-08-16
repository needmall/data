package com.needmall.client.storeall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreallDaoImpl implements StoreallDao{
	
	@Autowired
	private SqlSession session;
}
