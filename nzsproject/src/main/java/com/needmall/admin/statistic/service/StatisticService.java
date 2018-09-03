package com.needmall.admin.statistic.service;

import java.util.List;

import com.needmall.admin.statistic.vo.CustomerDataVO;
import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.admin.statistic.vo.StoreDataVO;

public interface StatisticService {
	public List<SalesDataVO> salesDataList();
	public List<StoreDataVO> storeDataList();
	public List<CustomerDataVO> customerDataList();
}