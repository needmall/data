package com.needmall.seller.statistic.dao;

import java.util.List;

import com.needmall.admin.statistic.vo.SalesDataVO;

public interface SellerStatisticDao {
	public SalesDataVO sellerStoreTotal(int st_num);
	public List<SalesDataVO> sellerStoreData(int st_num);
}
