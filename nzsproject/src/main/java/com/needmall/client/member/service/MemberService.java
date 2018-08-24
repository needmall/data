package com.needmall.client.member.service;

import com.needmall.client.member.vo.MemberVO;

public interface MemberService {
	public int customerIdConfirm(String c_id);
	public int sellerIdConfirm(String s_id);
	public int customerInsert(MemberVO mvo);
	public int sellerInsert(MemberVO mvo);
	
	public int stBnumConfirm(String st_bnum);
	
}
