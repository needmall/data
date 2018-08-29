package com.needmall.seller.productRequest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.common.vo.ReqproductVO;
import com.needmall.seller.productRequest.dao.ProductRequestDao;

@Service
public class ProductRequestServiceImpl implements ProductRequestService {
	
	@Autowired
	private ProductRequestDao productRequestDao;

	@Override
	public int ProductRequestUpdate(ReqproductVO rvo) {		
		return productRequestDao.ProductRequestUpdate(rvo);
	}
	
	
}
