package com.needmall.client.productdetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.productdetail.dao.ProductdetailDao;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.vo.StoreVO;

@Service
public class ProductdetailServiceImpl implements ProductdetailService {

	@Autowired
	private ProductdetailDao productdetailDao;
	@Override
	public ProductdetailVO productdetailmain(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		ProductdetailVO detail = productdetailDao.productdetailmain(dvo);
//		int a =detail.getP_price();
//		int b =detail.getPs_price();
//		double result =(double)(a-b)/a*100.0;
//		System.out.println("a " +a);
//		System.out.println("b " +b);
//		Math.round(result);
//		System.out.println(Double.parseDouble(String.format("%.2f", result)));
//		System.out.println(Math.round(result));
//		detail.setDiscount(result);
//		System.out.println("디테일 서비스단" +detail.toString());
		return detail;
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
	@Override
	public List<SreviewVO> productdetailSreviewlist(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return productdetailDao.productdetailSreviewlist(dvo);
	}

}

