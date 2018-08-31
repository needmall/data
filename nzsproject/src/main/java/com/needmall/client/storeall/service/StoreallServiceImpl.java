package com.needmall.client.storeall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.productall.vo.ProductallVO;
import com.needmall.client.storeall.dao.StoreallDao;
import com.needmall.client.storeall.vo.StoreallVO;
import com.needmall.common.vo.CustomerVO;

@Service
public class StoreallServiceImpl implements StoreallService{
	
	@Autowired
	private StoreallDao storeallDao;

	@Override
	public String storeList(CustomerVO cvo, ObjectMapper mapper) {
		List<StoreallVO> list = null;
		list = storeallDao.storeList(cvo);
		String storeList="";
		try {
			storeList = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		}
		return storeList;
	}
	
	/**
	 * storeProducts : 선택된 스토어 상품보기
	 */
	@Override
	public String storeProducts(int st_num, ObjectMapper mapper) {
		String list="";
		List<ProductallVO> prductslist = storeallDao.storeProducts(st_num);
		try {
			list=mapper.writeValueAsString(prductslist);
		} catch (JsonProcessingException e) {		
			e.printStackTrace();
		}
		return list;
	}
}
