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

	@Override
	public List<SalesDataVO> storeSalesList() {
		return statisticDao.storeSalesList();
	}

	@Override
	public List<SalesDataVO> productSalesList() {
		return statisticDao.productSalesList();
	}

	@Override
	public List<SalesDataVO> storeSalesData(SalesDataVO sdvo) {
		return statisticDao.storeSalesData(sdvo);
	}

	@Override
	public List<SalesDataVO> productSalesData(SalesDataVO sdvo) {
		return statisticDao.productSalesData(sdvo);
	}
	
	
			
}
