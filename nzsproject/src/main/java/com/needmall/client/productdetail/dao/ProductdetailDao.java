package com.needmall.client.productdetail.dao;

import java.util.List;

import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.common.vo.StoreVO;

public interface ProductdetailDao {

	ProductdetailVO productdetailmain(ProductdetailVO dvo);

	List<ProductdetailVO> productdetailSub(ProductdetailVO dvo);

	StoreVO productdetailStore(ProductdetailVO dvo);

}
