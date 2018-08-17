package com.needmall.client.productall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.productall.dao.ProductallDao;
import com.needmall.client.productall.vo.ProductallVO;

@Service
public class ProductallServiceImpl implements ProductallService {
	
	@Autowired
	private ProductallDao productallDao;

	@Override
	public List<ProductallVO> productFavList(ProductallVO pvo) {
		List<ProductallVO> List = null;		
		List = productallDao.productFavList(pvo);
		return List;
	}

	@Override
	public List<ProductallVO> productStoList(ProductallVO pvo) {
		List<ProductallVO> List = null;		
		List = productallDao.productStoList(pvo);
		return List;
	}

	
	
	
}
