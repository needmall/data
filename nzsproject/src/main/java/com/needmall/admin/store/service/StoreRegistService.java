package com.needmall.admin.store.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.needmall.admin.store.vo.StoreRegistVO;
import com.needmall.common.vo.FeesVO;
import com.needmall.common.vo.ReqstoreVO;

public interface StoreRegistService {
	public List<ReqstoreVO> storeReqList();
	public String divisionlist();
	public int storeInsert(StoreRegistVO srvo, HttpServletRequest request);
	public List<StoreRegistVO> storeList();
	public int storeFeeInsert(FeesVO fvo);
	public int storeFeeDelete(FeesVO fvo);
	
//	public List<ProductRegistVO> productList(ProductRegistVO prvo);
//	public ProductRegistVO productDetail(ProductRegistVO prvo);
//	public int productUsageCount(int p_num);
//	public int productDelete(ProductRegistVO prvo, HttpServletRequest request);
//	public int productUpdate(ProductRegistVO prvo, HttpServletRequest request);
//	public int stateUpdate(int p_num, int p_state);
}
