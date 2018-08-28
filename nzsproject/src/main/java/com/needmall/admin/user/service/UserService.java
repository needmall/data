package com.needmall.admin.user.service;

import java.util.List;

import com.needmall.common.vo.CustomerVO;
import com.needmall.common.vo.SellerVO;

public interface UserService {
	public List<CustomerVO> customerList();
	public List<SellerVO> sellerList();
}
