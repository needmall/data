package com.needmall.client.mypage.service;

import java.util.List;

import com.needmall.client.mypage.vo.MycartVO;

public interface MypageService {

	List<MycartVO> mycartList(MycartVO mvo);

	String countUpdate(MycartVO mvo);

	String itemDelete(MycartVO mvo);

	List<MycartVO> buyList(MycartVO mvo);

	String mycartBuy(MycartVO mvo);

	void dateCountUpdate(MycartVO mvo);

	String productBuy(MycartVO mvo);

	int cartConfirmList(MycartVO mvo);

	int pageList(MycartVO mvo);
	
}
