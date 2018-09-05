package com.needmall.client.storeall.service;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.common.vo.CustomerVO;

public interface StoreallService {
	public String storeList(CustomerVO cvo, ObjectMapper mapper);
	public String storeProducts(int st_num, ObjectMapper mapper);
	public String favStore(int c_num, ObjectMapper mapper);
}
