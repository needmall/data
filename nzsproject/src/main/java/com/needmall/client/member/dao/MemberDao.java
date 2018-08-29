package com.needmall.client.member.dao;

import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;

public interface MemberDao {
	
	public int customerSecurityInsert(MemberSecurity sec);
	public int sellerSecurityInsert(MemberSecurity sec);
	
	public MemberSecurity customerSecuritySelect(String c_id);
	public MemberSecurity sellerSecuritySelect(String s_id);
	
	
	public int customerSelect(String c_id);
	public int sellerSelect(String s_id);
	public JoinVO reqstoreSelect(String st_bnum);
	
	public int customerInsert(MemberVO mvo);	
	public int sellerInsert(JoinVO jvo);
	public int reqstoreInsert(JoinVO jvo);
	
	
}
