package com.needmall.admin.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.admin.store.vo.FavStoreListVO;
import com.needmall.admin.store.vo.StoreRegistVO;
import com.needmall.common.vo.FeesVO;
import com.needmall.common.vo.ReqstoreVO;
import com.needmall.common.vo.StoreimageVO;


@Repository
public class StoreRegistDaoImpl implements StoreRegistDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ReqstoreVO> storeReqList() {		
		return session.selectList("storeReqList");
	}

	@Override
	public List<StoreimageVO> divisionlist() {
		return session.selectList("divisionlist");
	}

	@Override
	public int storeimageInsert(StoreRegistVO srvo) {		
		return session.insert("storeimageInsert", srvo);
	}
	
	@Override
	public int storeInsert(StoreRegistVO srvo) {		
		return session.insert("storeInsert", srvo);
	}

	@Override
	public List<StoreRegistVO> storeList() {		
		return session.selectList("storeList");
	}

	@Override
	public int storeFeeInsert(FeesVO fvo) {		
		return session.insert("storeFeeInsert", fvo);
	}

	@Override
	public int storeFeeDelete(FeesVO fvo) {
		return session.delete("storeFeeDelete", fvo);
	}

	@Override
	public StoreRegistVO storeDetail(StoreRegistVO srvo) {
		return session.selectOne("storeDetail", srvo);
	}

	@Override
	public int storeUpdate(StoreRegistVO srvo) {
		return session.update("storeUpdate",srvo);
	}

}
