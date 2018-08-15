package com.needmall.client.productall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.productall.dao.ProductallDao;

@Service
public class ProductallServiceImpl implements ProductallService {
	
	@Autowired
	private ProductallDao productallDao;
	
	
}
