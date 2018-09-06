package com.needmall.client.member.dao;

import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;

public interface MemberDao {
	
	public int customerSecurityInsert(MemberSecurity sec);
	public int sellerSecurityInsert(MemberSecurity sec);
	
	public MemberSecurity customerSecuritySelect(String c_id);
	public MemberSecurity sellerSecuritySelect(String s_id);
	
	
	public int customerIdSelect(String c_id);
	public int sellerIdSelect(String s_id);
	public JoinVO reqstoreSelect(String st_bnum);
	
	public int customerInsert(MemberVO mvo);	
	public int sellerInsert(JoinVO jvo);
	public int reqstoreInsert(JoinVO jvo);
	
	public int customerAgreeInsert(MemberVO mvo);
	public int sellerAgreeInsert(JoinVO jvo);
	
	public int customerDelete(String c_id);
	//public int customerSecurityDelete(String c_id) ;
	
	public int sellerDelete(String s_id);
	//public int customerSecurityDelete(String c_id) ;
	
	public int reqStoreDelete(int s_num);
	
	public int customerUpdate(MemberVO mvo);
	public int sellerUpdate(MemberVO mvo);
	
	public MemberVO customerSelect(String c_id);
	public MemberVO sellerSelect(String s_id);
	
	public String customerIdIdenSelect(MemberVO mvo);
	public String sellerIdIdenSelect(MemberVO mvo);
	
	public String customerPwdSelect(MemberVO mvo);	
	public int customerPwdFindUpdate(MemberVO mvo);
	
	public String sellerPwdSelect(MemberVO mvo);	
	public int sellerPwdFindUpdate(MemberVO mvo);
	
}
