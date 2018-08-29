package com.needmall.client.login.dao;

import com.needmall.client.login.vo.LoginVO;

public interface LoginDao {
	public LoginVO customerIdSelect(String c_id);
	public LoginVO customerLoginSelect(LoginVO lvo);
	
	public LoginVO sellerIdSelect(String s_id);
	public LoginVO sellerLoginSelect(LoginVO lvo);

	public int loginHistoryInsert(LoginVO lvo) ;
	public int loginHistoryUpdate(LoginVO lvo);
	public LoginVO loginHistorySelect(String userId); 
}