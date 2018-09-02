package com.needmall.seller.productsell.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;
import com.needmall.seller.productsell.vo.ProductListOneVO;

@Repository
public class ProductsellDaoImpl implements ProductsellDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductsellVO> productList(String s_id) {
		return session.selectList("productList", s_id);
	}

	@Override
	public List<ProductInfoVO> searchList(UserCommonVO ucvo) {
		return session.selectList("searchList", ucvo);
	}
	
	@Override
	public int productInsert(ProductInsertVO ivo) {
		return session.insert("productInsert", ivo);
	}

	@Override
	public ProductListOneVO productDetail(ProductInsertVO ivo) {
		return session.selectOne("productDetail", ivo);
	}

	@Override
	public int productUpdate(ProductInsertVO ivo) {
		return session.update("productUpdate", ivo);
	}

	
}
