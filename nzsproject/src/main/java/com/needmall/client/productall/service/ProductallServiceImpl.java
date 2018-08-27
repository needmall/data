package com.needmall.client.productall.service;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.productall.dao.ProductallDao;

import com.needmall.client.productall.vo.ProductallVO;


@Service
public class ProductallServiceImpl implements ProductallService {
	
	@Autowired
	private ProductallDao productallDao;

	@Override
	public List<ProductallVO> productFavList(String c_id) {
		List<ProductallVO> list = null;
		
		list = productallDao.productFavList(c_id);
		 
		return list;
	}
	
	@Override
	public List<ProductallVO> productAllList() {
		List<ProductallVO> list = null;
		
		list = productallDao.productAllList();
		 
		return list;
	}
	
	@Override
	public String productLocList(ProductallVO pvo, ObjectMapper mapper) {
		List<ProductallVO> list = null;
		String productLocList = "";
		
		try {
			list = productallDao.productLocList(pvo);
			productLocList = mapper.writeValueAsString(list);
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return productLocList;
	}

	

	

	

	
	
	
}
