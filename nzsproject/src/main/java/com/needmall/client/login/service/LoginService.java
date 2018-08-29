package com.needmall.client.login.service;

import com.needmall.client.login.vo.LoginVO;

public interface LoginService {
	public LoginVO customerIdSelect(String c_id);	
	public LoginVO customerLoginSelect(String c_id, String c_pwd);
	
	public LoginVO sellerIdSelect(String s_id);	
	public LoginVO sellerLoginSelect(String s_id, String s_pwd);

	public int loginHistoryInsert(LoginVO lvo) ;
	public int loginHistoryUpdate(LoginVO lvo);
	public LoginVO loginHistorySelect(String c_id); 
}