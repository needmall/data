package com.needmall.client.mypage.dao;

import java.util.List;

import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;
import com.needmall.client.mypage.vo.MycartVO;

public interface MypageDao {

	List<MycartVO> mycartList(MycartVO mvo);

	int countUpdate(MycartVO mvo);

	int itemDelete(MycartVO mvo);

	List<MycartVO> buyList(MycartVO mbvo);

	int mycartConfirm(MycartVO mvo);

	int mycartBuy1deptInsert(MycartVO mvo);

	int mycartBuy2deptInsert(MycartVO mvo);


}
