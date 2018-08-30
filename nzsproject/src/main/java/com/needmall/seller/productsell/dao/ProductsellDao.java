package com.needmall.seller.productsell.dao;

import java.util.List;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;

public interface ProductsellDao {


	public List<ProductsellVO> productList(String s_id);

	public int productInsert(ProductInfoVO ivo);

	public List<ProductInfoVO> searchList(ProductInfoVO ivo);

	

}
