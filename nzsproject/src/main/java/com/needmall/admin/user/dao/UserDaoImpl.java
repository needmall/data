package com.needmall.admin.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.common.vo.CustomerVO;
import com.needmall.common.vo.SellerVO;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CustomerVO> customerList() {	
		return session.selectList("customerList");
	}

	@Override
	public List<SellerVO> sellerList() {
		return session.selectList("sellerList");
	}

		
}
