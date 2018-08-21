package com.needmall.client.productdetail.service;

import java.util.List;

import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.common.vo.StoreVO;

public interface ProductdetailService {

	ProductdetailVO productdetailmain(ProductdetailVO dvo);

	List<ProductdetailVO> productdetailSub(ProductdetailVO dvo);

	StoreVO productdetailStore(ProductdetailVO dvo);

}
