package com.needmall.client.productall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<ProductallVO> productLocList(double c_lat, double c_lon) {
		List<ProductallVO> list = null;
		Map<String, String> stuff = new HashMap<String, String>();
		
		stuff.put("c_lat", c_lat+"");
		stuff.put("c_lon", c_lon+"");
		
		list = productallDao.productLocList(stuff);
		 
		return list;
	}

	@Override
	public List<ProductallVO> productStoList(String st_address) {
		List<ProductallVO> list = null;
		
		list = productallDao.productStoList(st_address);
		 
		return list;
	}

	

	
	
	
}
