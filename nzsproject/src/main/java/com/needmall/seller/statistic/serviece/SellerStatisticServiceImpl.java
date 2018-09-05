package com.needmall.seller.statistic.serviece;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.seller.statistic.dao.SellerStatisticDao;

@Service
public class SellerStatisticServiceImpl implements SellerStatisticService {
	
	@Autowired
	private SellerStatisticDao sellerStatisticDao;
	
	
	@Override
	public SalesDataVO sellerStoreTotal(int st_num) {		
		return sellerStatisticDao.sellerStoreTotal(st_num);
	}
	
	@Override
	public List<SalesDataVO> sellerStoreData(int st_num) {		
		return sellerStatisticDao.sellerStoreData(st_num);
	}



}
