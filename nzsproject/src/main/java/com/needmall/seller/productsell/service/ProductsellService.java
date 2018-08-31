package com.needmall.seller.productsell.service;

import java.util.List;


import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;

public interface ProductsellService {

	public List<ProductsellVO> productList(String s_id);
	public String searchList(UserCommonVO ivo);
	public int productInsert(ProductInsertVO ivo);

	
	

}
