package com.needmall.client.mypage.dao;

import java.util.List;

import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;
import com.needmall.client.mypage.vo.MycartVO;

public interface MypageDao {

	List<MycartVO> mycartList(MycartVO mvo);

	int countUpdate(MycartVO mvo);

	int itemdelete(MycartVO mvo);

	List<MycartVO> buylist(MycartVO mbvo);

}
