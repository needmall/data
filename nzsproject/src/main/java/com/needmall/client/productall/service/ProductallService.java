package com.needmall.client.productall.service;

import java.util.List;

import com.needmall.client.productall.vo.ProductallVO;

public interface ProductallService {

	public List<ProductallVO> productFavList(ProductallVO pvo);
	public List<ProductallVO> productStoList(ProductallVO pvo);

	

}
