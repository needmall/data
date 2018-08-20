package com.needmall.client.productdetail.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.productdetail.vo.ProductdetailVO;

@Repository
public class ProductdetailDaoImpl implements ProductdetailDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public ProductdetailVO productdetailmain(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return (ProductdetailVO)session.selectOne("productdetailmain");
	}

}
