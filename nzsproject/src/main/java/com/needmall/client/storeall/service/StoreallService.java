package com.needmall.client.storeall.service;

import java.util.List;

import com.needmall.client.storeall.vo.StoreallVO;
import com.needmall.common.vo.CustomerVO;

public interface StoreallService {
	public List<StoreallVO> storeList(CustomerVO cvo);
}
