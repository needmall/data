package com.needmall.client.productdetail.service;

import java.util.List;

import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.vo.StoreVO;

public interface ProductdetailService {

	ProductdetailVO productdetailmain(ProductdetailVO dvo);


	StoreVO productdetailStore(ProductdetailVO dvo);

	List<PreviewVO> productdetailPreviewlist(ProductdetailVO dvo);

	List<SreviewVO> productdetailSreviewlist(ProductdetailVO dvo);

	List<ProductdetailVO> productdetailcategory1List(ProductdetailVO dvo);

	List<ProductdetailVO> productdetailcategory2List(ProductdetailVO dvo);

}
