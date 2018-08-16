package com.needmall.client.storeall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.client.storeall.dao.StoreallDao;

@Service
public class StoreallServiceImpl implements StoreallService{
	
	@Autowired
	private StoreallDao storeallDao;
}
