package com.needmall.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public int securityInsert(MemberSecurity sec) {
		return session.insert("securityInsert", sec);
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
	public MemberVO customerSelect(String c_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO sellerSelect(String s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int customerInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sellerInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
