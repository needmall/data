package com.needmall.admin.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.product.dao.ProductRegistDao;

@Service
public class ProductRegistServiceImpl implements ProductRegistService{
	
	@Autowired
	private ProductRegistDao productRegistDao;

	
	
	
}
