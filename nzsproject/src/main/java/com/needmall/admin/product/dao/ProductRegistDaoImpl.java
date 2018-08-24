package com.needmall.admin.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.admin.product.vo.ProductRegistVO;
import com.needmall.common.vo.Category1depVO;
import com.needmall.common.vo.Category2depVO;
import com.needmall.common.vo.ProductVO;

@Repository
public class ProductRegistDaoImpl implements ProductRegistDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Category1depVO> category1dep() {		
		return session.selectList("category1dep");
	}

	@Override
	public List<Category2depVO> category2dep(int c1_num) {		
		return session.selectList("category2dep", c1_num);
	}

	@Override
	public List<ProductVO> divisionlist() {		
		return session.selectList("divisionlist");
	}

	@Override
	public int proimageInsert(ProductRegistVO prvo) {		
		return session.insert("proimageInsert", prvo);
	}
	
	@Override
	public int productInsert(ProductRegistVO prvo) {		
		return session.insert("productInsert", prvo);
	}

	@Override
	public List<ProductRegistVO> productListAll() {
		return session.selectList("productListAll");
	}

	@Override
	public ProductRegistVO productDetail(ProductRegistVO prvo) {		
		return (ProductRegistVO)session.selectOne("productDetail",prvo);
	}

	@Override
	public int productUsageCount(int p_num) {		
		return (Integer)session.selectOne("productUsageCount", p_num);
	}
	
}
