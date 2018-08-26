package com.needmall.client.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.needmall.client.member.dao.MemberDao;
import com.needmall.client.member.vo.MemberSecurity;
import com.needmall.client.member.vo.MemberVO;
import com.needmall.client.mypage.vo.MycartVO;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<MycartVO> mycartList(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("mycartList",mvo);
	}


}
