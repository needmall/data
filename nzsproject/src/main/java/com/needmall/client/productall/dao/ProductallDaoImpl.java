package com.needmall.client.productall.dao;

import java.util.List;
import java.util.Map;

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
	public List<ProductallVO> productLocList(Map<String, String> stuff) {
		return session.selectList("productLocList", stuff);
	}

	@Override
	public List<ProductallVO> productStoList(String st_address) {		
		return session.selectList("productStoList", st_address);
	}



	

	
	
	
}
