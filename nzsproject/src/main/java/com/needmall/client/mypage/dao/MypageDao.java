package com.needmall.client.mypage.dao;

import java.util.List;

import com.needmall.client.mypage.vo.MycartVO;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.SreviewVO;

public interface MypageDao {

	List<MycartVO> mycartList(MycartVO mvo);

	int countUpdate(MycartVO mvo);

	int itemDelete(MycartVO mvo);

	List<MycartVO> buyList(MycartVO mvo);

	int mycartConfirm(MycartVO mvo);

	int mycartBuy1deptInsert(MycartVO mvo);

	int mycartBuy2deptInsert(MycartVO mvo);

	int dateCountUpdate(MycartVO mvo);

	int psCountUpdate(MycartVO mvo);

	int cartConfirmList(MycartVO mvo);

	int pageList(MycartVO mvo);

	int cartConfirmUpdate(MycartVO mvo);

	List<PreviewVO> myProductRList(PreviewVO pvo);

	List<SreviewVO> mySellerRList(SreviewVO svo);

	int myProductRInsert(PreviewVO pvo);

	int mySellerInsert(SreviewVO svo);

	SreviewVO mySellerRselectList(SreviewVO svo);

	PreviewVO myProductRselectList(PreviewVO pvo);




}
