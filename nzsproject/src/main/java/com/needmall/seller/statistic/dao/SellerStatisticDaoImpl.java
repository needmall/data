package com.needmall.seller.statistic.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.admin.statistic.vo.SalesDataVO;

@Repository
public class SellerStatisticDaoImpl implements SellerStatisticDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@Override
	public SalesDataVO sellerStoreTotal(int st_num) {		
		return sqlSession.selectOne("sellerStoreTotal", st_num);
	}



	@Override
	public List<SalesDataVO> sellerStoreData(int st_num) {	
		return sqlSession.selectList("sellerStoreData", st_num);
	}

}
