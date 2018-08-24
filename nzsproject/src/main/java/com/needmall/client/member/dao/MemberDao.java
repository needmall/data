package com.needmall.client.member.dao;

import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;

public interface MemberDao {
	
	public int customerSecurityInsert(MemberSecurity sec);
	public int sellerSecurityInsert(MemberSecurity sec);
	
	public MemberSecurity customerSecuritySelect(String c_id);
	public MemberSecurity sellerSecuritySelect(String s_id);
	
	
	public MemberVO customerSelect(String c_id);
	public MemberVO sellerSelect(String s_id);
	
	public int customerInsert(MemberVO mvo);
	public int sellerInsert(MemberVO mvo);
	
	public MemberVO storeSelect(String st_bnum);
}
