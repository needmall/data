package com.needmall.seller.productsell.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;

@Repository
public class ProductsellDaoImpl implements ProductsellDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductsellVO> productList(String s_id) {
		return session.selectList("productsellList", s_id);
	}

	@Override
	public List<ProductInfoVO> searchList(UserCommonVO ucvo) {
		return session.selectList("searchList", ucvo);
	}
	
	@Override
	public int productInsert(ProductInsertVO ivo) {
		return session.insert("productInsert", ivo);
	}

	
}
