package com.needmall.seller.productsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.common.vo.ProductsellVO;
import com.needmall.seller.productsell.dao.ProductsellDao;
import com.needmall.seller.productsell.vo.ProductInfoVO;

@Service
public class ProductsellServiceImpl implements ProductsellService {
	
	@Autowired
	private ProductsellDao productsellDao;

	@Override
	public List<ProductsellVO> productList(String s_id) {
		
		List<ProductsellVO> list = null;
		
		list = productsellDao.productList(s_id);
		
		return list;
	}

	@Override
	public int productInsert(ProductInfoVO ivo) {
		int result = 0;
		
		result = productsellDao.productInsert(ivo);
		
		return result;
	}

	@Override
	public String searchList(ProductInfoVO ivo) {
		ObjectMapper mapper = new ObjectMapper();
		String listData = "";
		
		List<ProductInfoVO> searchList = productsellDao.searchList(ivo);
		
		try {
			listData = mapper.writeValueAsString(searchList);
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}


}
