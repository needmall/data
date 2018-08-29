package com.needmall.seller.productsell.dao;

import java.util.List;

import com.needmall.common.vo.ProductsellVO;

public interface ProductsellDao {

	List<ProductsellVO> productsellList(String s_id);

}
