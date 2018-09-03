package com.needmall.admin.statistic.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.admin.statistic.vo.SalesDataVO;

@Repository
public class StatisticDaoImpl implements StatisticDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<SalesDataVO> totalData() {
		return session.selectList("totalData");
	}

		
	
}
