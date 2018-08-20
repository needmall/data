package com.needmall.client.productdetail.dao;

import java.util.List;

import com.needmall.client.productdetail.vo.ProductdetailVO;

public interface ProductdetailDao {

	ProductdetailVO productdetailmain(ProductdetailVO dvo);

	List<ProductdetailVO> productdetailSub(ProductdetailVO dvo);

}
