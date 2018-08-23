package com.needmall.admin.product.dao;

import java.util.List;

import com.needmall.common.vo.Category1depVO;
import com.needmall.common.vo.Category2depVO;
import com.needmall.common.vo.ProductVO;

public interface ProductRegistDao {
	public List<Category1depVO> category1dep();
	public List<Category2depVO> category2dep(int c1_num);
	public List<ProductVO> divisionlist();
}
