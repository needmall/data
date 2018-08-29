package com.needmall.client.productdetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int productdetailFavpList(FavproductVO fvo) {
		// TODO Auto-generated method stub
		List<FavproductVO> list = productdetailDao.productdetailFavpList(fvo);
		int result=0;
		for (FavproductVO a : list) {
			if(a.getP_num() == fvo.getP_num()) {
				result=1;
			}
		}
		return result;
	}

	@Override
	public int productdetailFavsList(FavstoreVO svo) {
		List<FavstoreVO> list = productdetailDao.productdetailFavsList(svo);;
		int result=0;
		for (FavstoreVO a : list) {
			if(a.getSt_num() == svo.getSt_num()) {
				result=1;
			}
		}
		return result;
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


	@Transactional
	@Override
	public int productdetailCartList(ProductdetailVO pvo) {
		// TODO Auto-generated method stub
		int key = productdetailDao.productdetailConfirm(pvo);
		System.out.println("key 값 :  " +key);
		int confirm=0;
		int result =0;

		if(key ==0) {
			confirm= productdetailDao.productdetailBigCartInsert(pvo);
		}
		System.out.println("confirm : "+confirm);
		List<ProductdetailVO> list = productdetailDao.productdetailCartList(pvo);
		if(!list.isEmpty()) {
			for (ProductdetailVO a : list) {
				if(a.getPs_num() == pvo.getPs_num()) {
					result=1;
				}
			}
		}else {
			System.out.println("비어있습니다.");
		}
		return result;
	}


	@Override
	public String productdetailCartInsert(ProductdetailVO pvo) {
		// TODO Auto-generated method stub
		int a= productdetailDao.productdetailCartInsert(pvo);
		String value = "false";
		if(a==1) {
			value="success";
		}
		return value;
	}

}

