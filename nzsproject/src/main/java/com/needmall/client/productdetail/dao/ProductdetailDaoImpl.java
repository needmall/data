package com.needmall.client.productdetail.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
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





}
