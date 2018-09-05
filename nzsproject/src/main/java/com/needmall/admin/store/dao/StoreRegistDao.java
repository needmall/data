package com.needmall.admin.store.dao;

import java.util.List;

import com.needmall.admin.store.vo.FavStoreListVO;
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
	public StoreRegistVO storeDetail(StoreRegistVO srvo);
	public int storeUpdate(StoreRegistVO srvo);
	public List<FavStoreListVO> favStore(int c_num);	

}
