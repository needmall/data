package com.needmall.client.storeall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.storeall.dao.StoreallDao;
import com.needmall.client.storeall.vo.StoreallVO;
import com.needmall.common.vo.CustomerVO;

@Service
public class StoreallServiceImpl implements StoreallService{
	
	@Autowired
	private StoreallDao storeallDao;

	@Override
	public List<StoreallVO> storeList(CustomerVO cvo) {
		List<StoreallVO> storeList = null;
		storeList = storeallDao.storeList(cvo);
		return storeList;
	}
	
	
}
