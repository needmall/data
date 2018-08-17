package com.needmall.client.productall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.productall.vo.ProductallVO;

@Repository
public class ProductallDaoImpl implements ProductallDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductallVO> productFavList(ProductallVO pvo) {
		return session.selectList("productFavList", pvo);
	}

	@Override
	public List<ProductallVO> productStoList(ProductallVO pvo) {
		return session.selectList("productStoList", pvo);
	}
	
	
}
