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
	public String itemDelete(MycartVO mvo) {
		// TODO Auto-generated method stub
		int result =mypageDao.itemDelete(mvo);
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
	public List<MycartVO> buyList(MycartVO mbvo) {
		List<MycartVO> list = mypageDao.buyList(mbvo);
		
		for(int i=0; i<list.size(); i++) {
			int result = list.get(i).getPs_price() * list.get(i).getB_count();
			int result2 =list.get(i).getP_price() * list.get(i).getB_count();	//할인가 * 개수
			list.get(i).setMultiply_count(result);
			list.get(i).setOriginal_multiply_count(result2);
			
		}
		
		return list;
	}
	@Override
	public String mycartBuy(MycartVO mvo) {
		// TODO Auto-generated method stub
		int key = mypageDao.mycartConfirm(mvo);
		int confirm = 0 ;
		int last_confirm=0;
		int delete_confirm =0;
		int update_count = 0; 
		int update_ps_count=0;
		String value = "";
		if(key==0) {
			confirm = mypageDao.mycartBuy1deptInsert(mvo);
			System.out.println("confirm"+confirm);
		}
		last_confirm = mypageDao.mycartBuy2deptInsert(mvo);
		System.out.println("last_confirm = " +last_confirm);
		if(last_confirm !=0) {
			delete_confirm = mypageDao.itemDelete(mvo);
			System.out.println("delete_confirm = " +delete_confirm);
		}
		if(delete_confirm !=0) {
			value = "성공";
//			update_count =  mypageDao.pscountUpdate(mvo);
//			update_ps_count = mypageDao.countUpdate(mvo)
		}
		
		return value;
	}
	
		
}
