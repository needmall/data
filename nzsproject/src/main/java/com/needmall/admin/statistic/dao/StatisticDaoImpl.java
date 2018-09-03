package com.needmall.admin.statistic.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.admin.statistic.vo.CustomerDataVO;
import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.admin.statistic.vo.StoreDataVO;

@Repository
public class StatisticDaoImpl implements StatisticDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<SalesDataVO> salesDataList() {
		return session.selectList("salesDataList");
	}

	@Override
	public List<StoreDataVO> storeDataList() {
		return session.selectList("storeDataList");
	}

	@Override
	public List<CustomerDataVO> customerDataList() {

		return session.selectList("customerDataList");
	}
	
}