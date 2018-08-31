package com.needmall.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public int customerSecurityInsert(MemberSecurity sec) {		
		return session.insert("customerSecurityInsert", sec);
	}
	
	@Override
	public int sellerSecurityInsert(MemberSecurity sec) {		
		return session.insert("sellerSecurityInsert", sec);
	}

	@Override
	public MemberSecurity customerSecuritySelect(String c_id) {
		return (MemberSecurity)session.selectOne("customerSecuritySelect", c_id);
	}
	
	@Override
	public MemberSecurity sellerSecuritySelect(String s_id) {
		return (MemberSecurity)session.selectOne("sellerSecuritySelect", s_id);
	}

	@Override
	public int customerSelect(String c_id) {
		return session.selectOne("customerSelect", c_id);
	}

	@Override
	public int sellerSelect(String s_id) {
		return session.selectOne("sellerSelect", s_id);
	}

	@Override
	public int customerInsert(MemberVO mvo) {
		return session.insert("customerInsert", mvo);
	}

	@Override
	public int sellerInsert(JoinVO jvo) {
		return session.insert("sellerInsert", jvo);
	}

	@Override
	public JoinVO reqstoreSelect(String st_bnum) {
		return (JoinVO)session.selectOne("reqstoreSelect", st_bnum);
	}

	@Override
	public int reqstoreInsert(JoinVO jvo) {
		return session.insert("reqstoreInsert", jvo);
	}

	@Override
	public int customerAgreeInsert(MemberVO mvo) {
		return session.insert("customerAgreeInsert", mvo);
	}

	@Override
	public int sellerAgreeInsert(JoinVO jvo) {
		return session.insert("sellerAgreeInsert", jvo);
	}

	@Override
	public int customerDelete(String c_id) {
		return session.delete("customerDelete", c_id);
	}

	@Override
	public int sellerDelete(String s_id) {
		return session.delete("sellerDelete", s_id);
	}

	@Override
	public int reqStoreDelete(int s_num) {
		return session.delete("reqStoreDelete", s_num);
	}

	/*
	@Override
	public int customerSecurityDelete(String c_id) {
		return session.delete("customerSecurityDelete", c_id);
	}//security 굳이 지워야하나
	*/
	
	
}
