package com.needmall.client.productdetail.service;

import java.util.List;

import com.needmall.client.productdetail.vo.ProductdetailVO;

public interface ProductdetailService {

	ProductdetailVO productdetailmain(ProductdetailVO dvo);

	List<ProductdetailVO> productdetailSub(ProductdetailVO dvo);

}
