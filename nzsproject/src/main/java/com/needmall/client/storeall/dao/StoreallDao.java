package com.needmall.client.storeall.dao;

import java.util.List;

import com.needmall.admin.store.vo.FavStoreListVO;
import com.needmall.client.productall.vo.ProductallVO;
import com.needmall.client.storeall.vo.StoreallVO;
import com.needmall.common.vo.CustomerVO;

public interface StoreallDao {
	public List<StoreallVO> storeList(CustomerVO cvo);
	public List<ProductallVO> storeProducts(int st_num);
	public List<FavStoreListVO> favStore(int c_num);	
}
