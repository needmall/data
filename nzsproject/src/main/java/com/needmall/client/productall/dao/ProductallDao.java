package com.needmall.client.productall.dao;

import java.util.List;

import com.needmall.client.productall.vo.ProductallVO;

public interface ProductallDao {

	public List<ProductallVO> productFavList(ProductallVO pvo);
	public List<ProductallVO> productStoList(ProductallVO pvo);

}
