package com.needmall.admin.product.dao;

import java.util.List;


import com.needmall.admin.product.vo.ProductRegistVO;
import com.needmall.common.vo.Category1depVO;
import com.needmall.common.vo.Category2depVO;
import com.needmall.common.vo.ProductVO;
import com.needmall.common.vo.ReqstoreVO;

public interface ProductRegistDao {
	public List<Category1depVO> category1dep();
	public List<Category2depVO> category2dep(int c1_num);
	public List<ProductVO> divisionlist();
	public int productInsert(ProductRegistVO prvo);
	public int proimageInsert(ProductRegistVO prvo);
	public List<ProductRegistVO> productListAll();
	public ProductRegistVO productDetail(ProductRegistVO prvo);
	public int productUsageCount(int p_num);
	public int productImageDelete(int pi_num); 
	public int productDelete(int p_num);	
	public int proimageUpdate(ProductRegistVO prvo);
	public int productUpdate(ProductRegistVO prvo);
	public int p_stateX(int p_num);
	public int p_stateO(int p_num);	
	public List<ReqstoreVO> productReqList();
}
