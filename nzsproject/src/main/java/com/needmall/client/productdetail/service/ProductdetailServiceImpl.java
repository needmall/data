package com.needmall.client.productdetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.productdetail.dao.ProductdetailDao;
import com.needmall.client.productdetail.vo.ProductdetailVO;

@Service
public class ProductdetailServiceImpl implements ProductdetailService {

	@Autowired
	private ProductdetailDao productdetailDao;
	@Override
	public ProductdetailVO productdetailmain(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		ProductdetailVO detail = productdetailDao.productdetailmain(dvo);
				
		return detail;
	}
	@Override
	public List<ProductdetailVO> productdetailSub(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return productdetailDao.productdetailSub(dvo);
	}

}
