package com.needmall.client.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.needmall.client.mypage.vo.MycartVO;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.SreviewVO;

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

	int cartConfirmUpdate(MycartVO mvo);

	List<PreviewVO> myProductRList(PreviewVO pvo);

	List<SreviewVO> mySellerRList(SreviewVO svo);

	int myProductRInsert(PreviewVO pvo, HttpServletRequest request);

	int mySellerInsert(SreviewVO svo, HttpServletRequest request);

	SreviewVO mySellerRselectList(SreviewVO svo);

	PreviewVO myProductRselectList(PreviewVO pvo);

	
}
