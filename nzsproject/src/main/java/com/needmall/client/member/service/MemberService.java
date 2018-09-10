package com.needmall.client.member.service;

import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberVO;

public interface MemberService {
	public int customerIdConfirm(String s_id);
	public int sellerIdConfirm(String s_id);
	public int customerInsert(MemberVO mvo);
	public int sellerInsert(JoinVO jvo);
	
	public int stBnumConfirm(String st_bnum);
	
	public int csCount(LoginVO lvo);
	
	public int customerDelete(String c_id);
	public int sellerDelete(String s_id);
	public int reqStoreDelete(int s_num);

	public int customerUpdate(MemberVO mvo);
	public int customerPwdUpdate(MemberVO mvo);
	
	public int sellerUpdate(MemberVO mvo);
	public int sellerPwdUpdate(MemberVO mvo);
	
	public MemberVO customerSelect(String c_id);
	public MemberVO sellerSelect(String s_id);
	
	public String customerIdIden(String c_name, String c_mail);
	public String sellerIdIden(String s_name, String s_mail);
	
	public String customerPwdSelect(String c_id, String c_mail);	
	public int customerPwdFindUpdate(MemberVO mvo);
	
	public String sellerPwdSelect(String s_id, String s_mail);	
	public int sellerPwdFindUpdate(MemberVO mvo);
	
}
