package com.needmall.admin.statistic.service;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.statistic.vo.CustomerDataVO;
import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.admin.statistic.vo.StoreDataVO;

public interface StatisticService {
	public List<SalesDataVO> salesDataList();
	public List<StoreDataVO> storeDataList();
	public List<CustomerDataVO> customerDataList();
	public List<SalesDataVO> storeSalesList();
	public List<SalesDataVO> productSalesList();
	public List<SalesDataVO> storeSalesData(SalesDataVO sdvo);
	public List<SalesDataVO> productSalesData(SalesDataVO sdvo);
	public String popItem(ObjectMapper mapper);
}
