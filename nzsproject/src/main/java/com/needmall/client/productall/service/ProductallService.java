package com.needmall.client.productall.service;

import java.util.List;

import com.needmall.client.productall.vo.ProductallVO;

public interface ProductallService {

	public List<ProductallVO> productFavList(String c_id);

	public List<ProductallVO> productLocList(double c_lat, double c_lon);

	public List<ProductallVO> productStoList(String st_address);

	

	

	

}
