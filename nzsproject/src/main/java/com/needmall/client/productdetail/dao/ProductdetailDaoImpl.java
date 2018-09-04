package com.needmall.client.productdetail.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.vo.FavproductVO;
import com.needmall.common.vo.FavstoreVO;
import com.needmall.common.vo.StoreVO;

@Repository
public class ProductdetailDaoImpl implements ProductdetailDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public ProductdetailVO productdetailmain(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return (ProductdetailVO)session.selectOne("productdetailmain",dvo);
	}

	@Override
	public StoreVO productdetailStore(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return (StoreVO)session.selectOne("productdetailStore",dvo);
	}

	@Override
	public List<PreviewVO> productdetailPreviewlist(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return session.selectList("productdetailPreviewlist",dvo);
	}

	@Override
	public List<SreviewVO> productdetailSreviewlist(ProductdetailVO dvo) {
		// TODO Auto-generated method stub
		return session.selectList("productdetailSreviewlist",dvo);
	}

	@Override
	public List<FavproductVO> productdetailFavpList(FavproductVO fvo) {
		// TODO Auto-generated method stub
		return session.selectList("productdetailFavpList",fvo);
	}

	@Override
	public List<FavstoreVO> productdetailFavsList(FavstoreVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("productdetailFavsList",svo);
	}

	@Override
	public int productdetailFavpInsert(FavproductVO fvo) {
		// TODO Auto-generated method stub
		return session.insert("productdetailFavpInsert",fvo);
	}

	@Override
	public int productdetailFavsInsert(FavstoreVO svo) {
		// TODO Auto-generated method stub
		return session.insert("productdetailFavsInsert",svo);
	}

	@Override
	public List<ProductdetailVO> productdetailCartList(ProductdetailVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("productdetailCartList",pvo);
	}

	@Override
	public int productdetailCartInsert(ProductdetailVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("productdetailCartInsert",pvo);
	}

	@Override
	public int productdetailConfirm(ProductdetailVO pvo) {
		// TODO Auto-generated method stub
		return session.selectOne("productdetailConfirm",pvo);
	}

	@Override
	public int productdetailBigCartInsert(ProductdetailVO pvo) {
		return session.insert("productdetailBigCartInsert",pvo);
		
	}

	@Override
	public int productdetailFavpDelete(FavproductVO fvo) {
		// TODO Auto-generated method stub
		return session.delete("productdetailFavpDelete",fvo);
	}

	@Override
	public int productdetailFavsDelete(FavstoreVO fvo) {
		// TODO Auto-generated method stub
		return session.delete("productdetailFavsDelete",fvo);
	}





}
