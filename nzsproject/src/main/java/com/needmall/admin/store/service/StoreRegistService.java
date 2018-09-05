package com.needmall.admin.store.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
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
	public StoreRegistVO storeDetail(StoreRegistVO srvo);
	public int storeUpdate(StoreRegistVO srvo, HttpServletRequest request);
	public String favStore(int c_num, ObjectMapper mapper);


}
