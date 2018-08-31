package com.needmall.seller.productsell.dao;

import java.util.List;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;

public interface ProductsellDao {

	public List<ProductsellVO> productList(String s_id);
	public List<ProductInfoVO> searchList(UserCommonVO ucvo);
	public int productInsert(ProductInsertVO ivo);

	

}
