package com.needmall.seller.productsell.service;

import java.util.List;


import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;

public interface ProductsellService {

	public List<ProductsellVO> productList(String s_id);

	public int productInsert(ProductInfoVO ivo);

	public String searchList(UserCommonVO ivo);

	
	

}
