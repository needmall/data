package com.needmall.client.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.needmall.client.mypage.vo.MycartVO;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.SreviewVO;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<MycartVO> mycartList(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("mycartList",mvo);
	}

	@Override
	public int countUpdate(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.update("countUpdate",mvo);
	}

	@Override
	public int itemDelete(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.delete("itemDelete",mvo);
	}

	@Override
	public List<MycartVO> buyList(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("buyList",mvo);
	}

	@Override
	public int mycartConfirm(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.selectOne("mycartConfirm",mvo);
	}

	@Override
	public int mycartBuy1deptInsert(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.insert("mycartBuy1deptInsert",mvo);
	}

	@Override
	public int mycartBuy2deptInsert(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.insert("mycartBuy2deptInsert",mvo);
	}

	@Override
	public int dateCountUpdate(MycartVO mvo) {   		//장바구니 날짜 수정 쿼리
		// TODO Auto-generated method stub
		return session.update("dateCountUpdate",mvo);
	}

	@Override
	public int psCountUpdate(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.update("psCountUpdate",mvo);
	}

	@Override
	public int cartConfirmList(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.selectOne("cartConfirmList",mvo);
	}

	@Override
	public int pageList(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.selectOne("pageList",mvo);
	}

	@Override
	public int cartConfirmUpdate(MycartVO mvo) {
		// TODO Auto-generated method stub
		return session.update("cartConfirmUpdate",mvo);
	}

	@Override
	public List<PreviewVO> myProductRList(PreviewVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("myProductRList",pvo);
	}

	@Override
	public List<SreviewVO> mySellerRList(SreviewVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("mySellerRList",svo);
	}

	@Override
	public int myProductRInsert(PreviewVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("myProductRInsert",pvo);
	}

	@Override
	public int mySellerInsert(SreviewVO svo) {
		// TODO Auto-generated method stub
		return session.insert("mySellerInsert",svo);
	}

	@Override
	public SreviewVO mySellerRselectList(SreviewVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("mySellerRselectList",svo);
	}

	@Override
	public PreviewVO myProductRselectList(PreviewVO pvo) {
		// TODO Auto-generated method stub
		return session.selectOne("myProductRselectList",pvo);
	}

	@Override
	public int mySellerRupdate(SreviewVO svo) {
		// TODO Auto-generated method stub
		return session.update("mySellerRupdate",svo);
	}

	@Override
	public int mySellerDelete(SreviewVO svo) {
		// TODO Auto-generated method stub
		return session.delete("mySellerDelete",svo);
	}
	@Override
	public int myProductRupdate(PreviewVO pvo) {
		// TODO Auto-generated method stub
		return session.update("myProductRupdate",pvo);
	}

	@Override
	public int myProductDelete(PreviewVO pvo) {
		// TODO Auto-generated method stub
		return session.delete("myProductDelete",pvo);
	}



}
