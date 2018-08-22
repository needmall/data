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
	public MemberVO customerSelect(String c_id) {
		return (MemberVO)session.selectOne("customerSelect", c_id);
	}

	@Override
	public MemberVO sellerSelect(String s_id) {
		return (MemberVO)session.selectOne("sellerSelect", s_id);
	}

	@Override
	public int customerInsert(MemberVO mvo) {
		return session.insert("customerInsert", mvo);
	}

	@Override
	public int sellerInsert(MemberVO mvo) {
		return session.insert("sellerInsert", mvo);
	}

}
