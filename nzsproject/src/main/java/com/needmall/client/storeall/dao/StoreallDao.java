package com.needmall.client.storeall.dao;

import java.util.List;

import com.needmall.client.storeall.vo.StoreallVO;
import com.needmall.common.vo.CustomerVO;

public interface StoreallDao {
	public List<StoreallVO> storeList(CustomerVO cvo);
}
