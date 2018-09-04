package com.needmall.admin.statistic.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.statistic.dao.StatisticDao;
import com.needmall.admin.statistic.vo.CustomerDataVO;
import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.admin.statistic.vo.StoreDataVO;


@Service
public class StatisticServiceImpl implements StatisticService{

	
	@Autowired
	private StatisticDao statisticDao;

	@Override
	public List<SalesDataVO> salesDataList() {	
		return statisticDao.salesDataList();
	}

	@Override
	public List<StoreDataVO> storeDataList() {
		return statisticDao.storeDataList();
	}

	@Override
	public List<CustomerDataVO> customerDataList() {
		return statisticDao.customerDataList();
	}
	
	
			
}
