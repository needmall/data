package com.needmall.admin.user.dao;

import java.util.List;

import com.needmall.common.vo.CustomerVO;
import com.needmall.common.vo.SellerVO;

public interface UserDao {
	public List<CustomerVO> customerList();
	public List<SellerVO> sellerList();
}
