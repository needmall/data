package com.needmall.seller.productRequest.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.ReqproductVO;

@Repository
public class ProductRequestDaoImpl implements ProductRequestDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int ProductRequestUpdate(ReqproductVO rvo) {
		return session.update("ProductRequestUpdate", rvo);
	}
	
}
