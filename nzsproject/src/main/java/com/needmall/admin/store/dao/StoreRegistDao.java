package com.needmall.admin.store.dao;

import java.util.List;

import com.needmall.admin.store.vo.StoreRegistVO;
import com.needmall.common.vo.FeesVO;
import com.needmall.common.vo.ReqstoreVO;
import com.needmall.common.vo.StoreimageVO;

public interface StoreRegistDao {
	public List<ReqstoreVO> storeReqList();
	public List<StoreimageVO> divisionlist();	
	public int storeInsert(StoreRegistVO srvo);
	public int storeimageInsert(StoreRegistVO srvo);
	public List<StoreRegistVO> storeList();
	public int storeFeeInsert(FeesVO fvo);
	public int storeFeeDelete(FeesVO fvo);
	
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
