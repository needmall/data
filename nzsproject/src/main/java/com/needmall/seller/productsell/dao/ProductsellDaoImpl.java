package com.needmall.seller.productsell.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.ProductsellVO;

@Repository
public class ProductsellDaoImpl implements ProductsellDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductsellVO> productsellList(String s_id) {
		
		return session.selectList("productsellList", s_id);
	}
}
