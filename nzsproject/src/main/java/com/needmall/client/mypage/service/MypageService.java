package com.needmall.client.mypage.service;

import java.util.List;

import com.needmall.client.mypage.vo.MycartVO;

public interface MypageService {

	List<MycartVO> mycartList(MycartVO mvo);

	String countUpdate(MycartVO mvo);

	String itemdelete(MycartVO mvo);
	
}
