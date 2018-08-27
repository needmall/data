package com.needmall.client.productdetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.productdetail.dao.ProductdetailDao;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.vo.FavproductVO;
import com.needmall.common.vo.FavstoreVO;
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


	@Override
	public List<FavproductVO> productdetailFavpList(FavproductVO fvo) {
		// TODO Auto-generated method stub
		return productdetailDao.productdetailFavpList(fvo);
	}


	@Override
	public List<FavstoreVO> productdetailFavsList(FavstoreVO svo) {
		// TODO Auto-generated method stub
		return productdetailDao.productdetailFavsList(svo);
	}


	@Override
	public String productdetailFavpInsert(FavproductVO fvo) {
		// TODO Auto-generated method stub
		
		int a= productdetailDao.productdetailFavpInsert(fvo);
		String value = "false";
		if(a==1) {
			value="success";
		}
		return value;
				
	}


	@Override
	public String productdetailFavsInsert(FavstoreVO svo) {
		// TODO Auto-generated method stub
		int a= productdetailDao.productdetailFavsInsert(svo);
		String value = "false";
		if(a==1) {
			value="success";
		}
		return value;
	}

}

