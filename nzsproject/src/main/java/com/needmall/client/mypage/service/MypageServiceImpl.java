package com.needmall.client.mypage.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.needmall.client.member.dao.MemberDao;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;
import com.needmall.client.mypage.dao.MypageDao;
import com.needmall.client.mypage.vo.MycartVO;
import com.needmall.common.util.OpenCrypt;
import com.needmall.common.util.Util;

@Service
public class MypageServiceImpl implements MypageService {
	Logger logger = Logger.getLogger(MypageServiceImpl.class);
	@Autowired
	private MypageDao mypageDao;
	
	@Override
	public List<MycartVO> mycartList(MycartVO mvo) {
		// TODO Auto-generated method stub
		return mypageDao.mycartList(mvo);
	}

	@Override
	public String countUpdate(MycartVO mvo) {
		// TODO Auto-generated method stub
		int result =mypageDao.countUpdate(mvo);
		String value="";
		if(result ==0) {
			value = "false";
		}else {
			value = "success";
		}
		
		return value;
	}

	@Override
	public String itemdelete(MycartVO mvo) {
		// TODO Auto-generated method stub
		int result =mypageDao.itemdelete(mvo);
		String value="";
		if(result ==0) {
			value = "false";
		}else {
			value = "success";
		}
		
		return value;
	}

	@Override
	public List<MycartVO> mybuy(MycartVO mbvo) {
		// TODO Auto-generated method stub
		return mypageDao.buylist(mbvo);
	}
	
		
}
