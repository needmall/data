package com.needmall.admin.product.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRegistDaoImpl implements ProductRegistDao{
	
	@Autowired
	private SqlSession session;


}
