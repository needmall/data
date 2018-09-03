package com.needmall.admin.statistic.dao;

import java.util.List;

import com.needmall.admin.statistic.vo.CustomerDataVO;
import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.admin.statistic.vo.StoreDataVO;

public interface StatisticDao {
	public List<SalesDataVO> salesDataList();
	public List<StoreDataVO> storeDataList();
	public List<CustomerDataVO> customerDataList();
}
