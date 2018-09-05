package com.needmall.seller.statistic.serviece;

import java.util.List;

import com.needmall.admin.statistic.vo.SalesDataVO;

public interface SellerStatisticService {
	public SalesDataVO sellerStoreTotal(int st_num);
	public List<SalesDataVO> sellerStoreData(int st_num);
}
