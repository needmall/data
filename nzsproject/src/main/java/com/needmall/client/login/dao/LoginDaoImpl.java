package com.needmall.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.login.vo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSession session;

	@Override
	public LoginVO customerIdSelect(String c_id) {
		return (LoginVO) session.selectOne("customerIdSelect", c_id);
	}
	
	@Override
	public LoginVO sellerIdSelect(String s_id) {
		return (LoginVO) session.selectOne("sellerIdSelect", s_id);
	}

	@Override
	public LoginVO customerLoginSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("customerLoginSelect", lvo);
	} 
	
	@Override
	public LoginVO sellerLoginSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("sellerLoginSelect", lvo);
	}

	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		return session.insert("loginHistoryInsert", lvo);
	} 

	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return session.update("loginHistoryUpdate", lvo);
	} 

	@Override
	public LoginVO loginHistorySelect(String userId) {
		return (LoginVO) session.selectOne("loginHistorySelect", userId);
	} 
}