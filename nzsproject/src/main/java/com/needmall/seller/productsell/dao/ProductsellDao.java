package com.needmall.seller.productsell.dao;

import java.util.List;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;
import com.needmall.seller.productsell.vo.ProductListOneVO;

public interface ProductsellDao {

	public List<ProductsellVO> productList(String s_id);
	public List<ProductInfoVO> searchList(UserCommonVO ucvo);
	public int productInsert(ProductInsertVO ivo);
	public ProductListOneVO productDetail(ProductInsertVO ivo);
	public int productUpdate(ProductInsertVO ivo);
	public UserCommonVO productState(ProductInsertVO ivo);
	public int productDelete(ProductInsertVO ivo);
	public int productDealUpdate(ProductInsertVO ivo);
	public int feesConfirm(String s_id);
	public int storeNumSelectOne(String s_id);
	public List<ProductInfoVO> categoryList(ProductInfoVO ifvo);
	
}
