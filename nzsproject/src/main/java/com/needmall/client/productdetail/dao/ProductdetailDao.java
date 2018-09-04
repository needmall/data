package com.needmall.client.productdetail.dao;

import java.util.List;

import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.vo.FavproductVO;
import com.needmall.common.vo.FavstoreVO;
import com.needmall.common.vo.StoreVO;

public interface ProductdetailDao {

	ProductdetailVO productdetailmain(ProductdetailVO dvo);

	StoreVO productdetailStore(ProductdetailVO dvo);

	List<PreviewVO> productdetailPreviewlist(ProductdetailVO dvo);

	List<SreviewVO> productdetailSreviewlist(ProductdetailVO dvo);

	List<FavproductVO> productdetailFavpList(FavproductVO fvo);

	List<FavstoreVO> productdetailFavsList(FavstoreVO svo);

	int productdetailFavpInsert(FavproductVO fvo);

	int productdetailFavsInsert(FavstoreVO svo);

	List<ProductdetailVO> productdetailCartList(ProductdetailVO pvo);

	int productdetailCartInsert(ProductdetailVO pvo);

	int productdetailConfirm(ProductdetailVO pvo);

	int productdetailBigCartInsert(ProductdetailVO pvo);

	int productdetailFavpDelete(FavproductVO fvo);

	int productdetailFavsDelete(FavstoreVO fvo);


}
