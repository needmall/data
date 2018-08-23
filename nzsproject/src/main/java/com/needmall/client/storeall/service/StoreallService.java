package com.needmall.client.storeall.service;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.common.vo.CustomerVO;

public interface StoreallService {
	public String storeList(CustomerVO cvo, ObjectMapper mapper);
}
