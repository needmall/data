package com.needmall.seller.productsell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.dao.ProductsellDao;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;
import com.needmall.seller.productsell.vo.ProductListOneVO;

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
	public String searchList(UserCommonVO ucvo) {
		ObjectMapper mapper = new ObjectMapper();
		String listData = "";
		
		List<ProductInfoVO> searchList = productsellDao.searchList(ucvo);
		
		try {
			listData = mapper.writeValueAsString(searchList);
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}
	
	@Override
	public String categoryList(ProductInfoVO ifvo) {
		ObjectMapper mapper = new ObjectMapper();
		String listData = "";
		
		List<ProductInfoVO> categoryList = productsellDao.categoryList(ifvo);
		
		try {
			listData = mapper.writeValueAsString(categoryList);
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}
	
	
	@Override
	public int productInsert(ProductInsertVO ivo) {
		int result = 0;
		
		result = productsellDao.productInsert(ivo);
		
		return result;
	}

	@Override
	public ProductListOneVO productDetail(ProductInsertVO ivo) {
		ProductListOneVO Detail = null;
		Detail = productsellDao.productDetail(ivo);
		return Detail;
	}

	@Override
	public int productUpdate(ProductInsertVO ivo) {
		int result = 0;
		result = productsellDao.productUpdate(ivo);
		return result;
	}

	@Override
	public int productDelete(ProductInsertVO ivo) {
		int result = 0;
		result = productsellDao.productDelete(ivo);
		return result;
	}

	@Override
	public UserCommonVO productState(ProductInsertVO ivo) {
		UserCommonVO result = null;
		result = productsellDao.productState(ivo);
		return result;
	}

	@Override
	public int productDealUpdate(ProductInsertVO ivo) {
		int result = 0;
		result = productsellDao.productDealUpdate(ivo);
		return result;
	}

	@Override
	public int feesConfirm(String s_id) {
		int result = 0;
		result = productsellDao.feesConfirm(s_id);
		return result;
	}

	@Override
	public int storeNumSelectOne(String s_id) {
		int result = 0;
		result = productsellDao.storeNumSelectOne(s_id);
		return result;
	}

	

}
