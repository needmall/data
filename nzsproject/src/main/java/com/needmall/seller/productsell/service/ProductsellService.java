package com.needmall.seller.productsell.service;

import java.util.List;


import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;
import com.needmall.seller.productsell.vo.ProductListOneVO;

public interface ProductsellService {

	public List<ProductsellVO> productList(String s_id);
	public String searchList(UserCommonVO ivo);
	public int productInsert(ProductInsertVO ivo);
	public ProductListOneVO productDetail(ProductInsertVO ivo);
	public int productUpdate(ProductInsertVO ivo);
	public UserCommonVO productState(ProductInsertVO ivo);
	public int productDelete(ProductInsertVO ivo);
	public int productDealUpdate(ProductInsertVO ivo);
	public int feesConfirm(String s_id);
	public int storeNumSelectOne(String s_id);
	
}
