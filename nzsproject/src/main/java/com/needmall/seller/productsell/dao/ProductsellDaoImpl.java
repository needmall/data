package com.needmall.seller.productsell.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;

@Repository
public class ProductsellDaoImpl implements ProductsellDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductsellVO> productList(String s_id) {
		return session.selectList("productsellList", s_id);
	}


	@Override
	public int productInsert(ProductInfoVO ivo) {
		//return session.insert("productInsert", ivo);
		return 0;
	}


	@Override
	public List<ProductInfoVO> searchList(ProductInfoVO ivo) {
		return session.selectList("searchList", ivo);
	}
	
	
}
