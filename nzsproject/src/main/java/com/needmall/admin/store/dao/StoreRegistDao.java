package com.needmall.admin.store.dao;

import java.util.List;

import com.needmall.common.vo.ReqstoreVO;
import com.needmall.common.vo.StoreimageVO;

public interface StoreRegistDao {
	public List<ReqstoreVO> storeReqList();
	public List<StoreimageVO> divisionlist();
//	public List<Category2depVO> category2dep(int c1_num);
//	
//	public int productInsert(ProductRegistVO prvo);
//	public int proimageInsert(ProductRegistVO prvo);
//	public List<ProductRegistVO> productListAll();
//	public ProductRegistVO productDetail(ProductRegistVO prvo);
//	public int productUsageCount(int p_num);
//	public int productImageDelete(int pi_num); 
//	public int productDelete(int p_num);	
//	public int proimageUpdate(ProductRegistVO prvo);
//	public int productUpdate(ProductRegistVO prvo);
//	public int p_stateX(int p_num);
//	public int p_stateO(int p_num);	
}
