package com.needmall.client.productall.service;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.productall.vo.ProductallVO;

public interface ProductallService {

	public List<ProductallVO> productFavList(String c_id);
	public String productAllList(ObjectMapper mapper);
	public String productLocList(ProductallVO pvo, ObjectMapper mapper);
	

	

	

	

}
