package com.needmall.client.storeall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.productall.vo.ProductallVO;
import com.needmall.client.storeall.vo.StoreallVO;
import com.needmall.common.vo.CustomerVO;

@Repository
public class StoreallDaoImpl implements StoreallDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<StoreallVO> storeList(CustomerVO cvo) {		
		return session.selectList("storeList", cvo);
	}

	@Override
	public List<ProductallVO> storeProducts(int st_num) {
		return session.selectList("storeProducts", st_num);
	}

	
}
