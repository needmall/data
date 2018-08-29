package com.needmall.client.mypage.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.needmall.client.mypage.dao.MypageDao;
import com.needmall.client.mypage.vo.MycartVO;

@Service
public class MypageServiceImpl implements MypageService {
	Logger logger = Logger.getLogger(MypageServiceImpl.class);
	@Autowired
	private MypageDao mypageDao;
	
	@Override
	public List<MycartVO> mycartList(MycartVO mvo) {
		List<MycartVO> list = mypageDao.mycartList(mvo);
		for(int i=0; i<list.size(); i++) {
			int result =list.get(i).getP_price() * list.get(i).getCart2_count();	//원가 * 개수
			int result2 =list.get(i).getPs_price()* list.get(i).getCart2_count();	//할인가 * 개수
			list.get(i).setMultiply_count(result);
			list.get(i).setOriginal_multiply_count(result2);
		}
		
		return list;
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

	//구매페이지 리스
	@Override
	public List<MycartVO> mybuy(MycartVO mbvo) {
		List<MycartVO> list = mypageDao.buylist(mbvo);
		
		for(int i=0; i<list.size(); i++) {
			int result = list.get(i).getPs_price() * list.get(i).getB_count();
			int result2 =list.get(i).getP_price() * list.get(i).getB_count();	//할인가 * 개수
			list.get(i).setMultiply_count(result);
			list.get(i).setOriginal_multiply_count(result2);
			
		}
		
		return list;
	}
	
		
}
