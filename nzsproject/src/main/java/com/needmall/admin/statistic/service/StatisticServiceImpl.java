package com.needmall.admin.statistic.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.statistic.dao.StatisticDao;
import com.needmall.admin.statistic.vo.SalesDataVO;


@Service
public class StatisticServiceImpl implements StatisticService{

	
	@Autowired
	private StatisticDao statisticDao;

	@Override
	public List<SalesDataVO> totalData() {	
		return statisticDao.totalData();
	}
	
	
			
}
