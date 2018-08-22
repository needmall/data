package com.needmall.client.productdetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.productdetail.dao.ProductdetailDao;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.common.vo.StoreVO;

@Service
public class ProductdetailServiceImpl implements ProductdetailService {

	@Autowired
	private ProductdetailDao productdetailDao;
	@Override
	public ProductdetailVO productdetailmain(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		ProductdetailVO detail = productdetailDao.productdetailmain(dvo);
				
		return detail;
	}
	@Override
	public List<ProductdetailVO> productdetailSub(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
//		Map<String, String> map =new HashMap<String, String>();
		List<ProductdetailVO> list=productdetailDao.productdetailSub(dvo);
		return list;
	}
	
	@Override
	public StoreVO productdetailStore(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		StoreVO store = productdetailDao.productdetailStore(dvo);
		return store;
	}
	@Override
	public List<PreviewVO> productdetailPreviewlist(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return productdetailDao.productdetailPreviewlist(dvo);
	}
}

