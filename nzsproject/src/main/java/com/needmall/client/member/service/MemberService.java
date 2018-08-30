package com.needmall.client.member.service;

import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberVO;

public interface MemberService {
	public int customerIdConfirm(String c_id);
	public int sellerIdConfirm(String s_id);
	public int customerInsert(MemberVO mvo);
	public int sellerInsert(JoinVO jvo);
	
	public int stBnumConfirm(String st_bnum);
	
	public int csCount(LoginVO lvo);
	
	public int customerDelete(String c_id);
}
