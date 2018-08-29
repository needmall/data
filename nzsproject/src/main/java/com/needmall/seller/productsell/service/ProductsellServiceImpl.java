package com.needmall.seller.productsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.seller.productsell.dao.ProductsellDao;

@Service
public class ProductsellServiceImpl implements ProductsellService {
	
	@Autowired
	private ProductsellDao productsellDao;

	@Override
	public List<ProductsellVO> productsellList(String s_id) {
		
		List<ProductsellVO> list = null;
		
		list = productsellDao.productsellList(s_id);
		
		return list;
	}
}
