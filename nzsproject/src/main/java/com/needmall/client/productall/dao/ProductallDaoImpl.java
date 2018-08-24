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
	public List<ProductallVO> productFavList(String c_id) {
		return session.selectList("productFavList", c_id);
	}

	@Override
	public List<ProductallVO> productAllList() {
		return session.selectList("productAllList");
	}
	
	@Override
	public List<ProductallVO> productLocList(ProductallVO pvo) {
		return session.selectList("productLocList", pvo);
	}

	




	

	
	
	
}
