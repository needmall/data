package com.needmall.client.productall.dao;

import java.util.List;
import java.util.Map;

import com.needmall.client.productall.vo.ProductallVO;

public interface ProductallDao {

	public List<ProductallVO> productFavList(String c_id);
	public List<ProductallVO> productLocList(Map<String, String> stuff);
	public List<ProductallVO> productStoList(String st_address);

	


	

}
