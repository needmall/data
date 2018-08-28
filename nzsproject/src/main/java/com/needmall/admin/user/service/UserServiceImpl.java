package com.needmall.admin.user.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.user.dao.UserDao;
import com.needmall.common.vo.CustomerVO;
import com.needmall.common.vo.SellerVO;

@Service
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserDao userDao;

	@Override
	public List<CustomerVO> customerList() {	
		List<CustomerVO> list = userDao.customerList();
		return list;
	}

	@Override
	public List<SellerVO> sellerList() {
		List<SellerVO> list = userDao.sellerList();
		return list;
	}
	
	
		
}
