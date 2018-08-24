package com.needmall.client.productall.dao;

import java.util.List;


import com.needmall.client.productall.vo.ProductallVO;

public interface ProductallDao {

	public List<ProductallVO> productFavList(String c_id);
	public List<ProductallVO> productAllList();
	public List<ProductallVO> productLocList(ProductallVO pvo);
	

	

}
