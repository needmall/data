package com.needmall.client.mypage.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.needmall.client.mypage.dao.MypageDao;
import com.needmall.client.mypage.vo.MycartVO;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.file.FileUploadUtil;

@Service
public class MypageServiceImpl implements MypageService {
	Logger logger = Logger.getLogger(MypageServiceImpl.class);
	@Autowired
	private MypageDao mypageDao;
	
	@Override
	public List<MycartVO> mycartList(MycartVO mvo) {
		List<MycartVO> list = mypageDao.mycartList(mvo);
		for(int i=0; i<list.size(); i++) {
			int result =list.get(i).getP_price() * list.get(i).getCart2_count();	//원가 * 개수
			int result2 =list.get(i).getPs_price()* list.get(i).getCart2_count();	//할인가 * 개수
			list.get(i).setMultiply_count(result);
			list.get(i).setOriginal_multiply_count(result2);
		}
		
		return list;
	}

	@Override
	public String countUpdate(MycartVO mvo) {
		// TODO Auto-generated method stub
		int result =mypageDao.countUpdate(mvo);
		String value="";
		if(result ==0) {
			value = "false";
		}else {
			value = "success";
		}
		
		return value;
	}

	@Override
	public String itemDelete(MycartVO mvo) {
		// TODO Auto-generated method stub
		int result =mypageDao.itemDelete(mvo);
		String value="";
		if(result ==0) {
			value = "false";
		}else {
			value = "success";
		}
		
		return value;
	}

	//구매페이지 리스
	@Override
	public List<MycartVO> buyList(MycartVO mbvo) {
		
		List<MycartVO> list = mypageDao.buyList(mbvo);
		
		for(int i=0; i<list.size(); i++) {
			int result = list.get(i).getPs_price() * list.get(i).getB_count();
			int result2 =list.get(i).getP_price() * list.get(i).getB_count();	//할인가 * 개수
			list.get(i).setMultiply_count(result);
			list.get(i).setOriginal_multiply_count(result2);
		}
		
		
		return list;
	}
	@Override
	public String mycartBuy(MycartVO mvo) {
		// TODO Auto-generated method stub
		int count_change = (mvo.getPs_count() - mvo.getCart2_count());
		System.out.println("count_change = "+count_change);
		mvo.setMultiply_count(mvo.getCart2_count());
		int confirm = 0 ;
		int last_confirm=0;
		int delete_confirm =0;
		int update_ps_count=0;
		String value ="실패";
		
		int key = mypageDao.mycartConfirm(mvo);

		if(key==0) {
			confirm = mypageDao.mycartBuy1deptInsert(mvo);
			System.out.println("confirm"+confirm);
		}
		last_confirm = mypageDao.mycartBuy2deptInsert(mvo);
		if(last_confirm ==1) {
			delete_confirm = mypageDao.itemDelete(mvo);					//장바구니 2뎁 물품 삭제
//			System.out.println("delete_confirm = " +delete_confirm);
		}
		if(delete_confirm !=0) {
			update_ps_count = mypageDao.psCountUpdate(mvo);
		}
		if(update_ps_count ==1) {
			value ="성공";
		}
		System.out.println("value = " +value);
		return value;
	}

	@Override
	public void dateCountUpdate(MycartVO mvo) {
		int a =mypageDao.dateCountUpdate(mvo);
		System.out.println("dateCountUpdate "+ a);
	}

	@Override
	public String productBuy(MycartVO mvo) {
		System.out.println("getChangeCount= " +mvo.getChangeCount());
		int confirm =0;
		int insertConfirm=0;
		int updateConfirm =0;
		String value ="";
		int key = mypageDao.mycartConfirm(mvo);

		if(key==0) {
			confirm = mypageDao.mycartBuy1deptInsert(mvo);
			System.out.println("confirm"+confirm);
		}
		insertConfirm=mypageDao.mycartBuy2deptInsert(mvo);
		if(insertConfirm==1) {
			updateConfirm=mypageDao.psCountUpdate(mvo);
		}
		if(updateConfirm==1) {
			
		}
		return value;
	}

	
	//바로 구매하기 눌렀을때 카트에 담겨져있는지 확인하는 곳
	@Override
	public int cartConfirmList(MycartVO mvo) {
		// TODO Auto-generated method stub
		
		return mypageDao.cartConfirmList(mvo);
	}

	@Override
	public int pageList(MycartVO mvo) {
		// TODO Auto-generated method stub
		return mypageDao.pageList(mvo);
	}

	@Override
	public int cartConfirmUpdate(MycartVO mvo) {
		// TODO Auto-generated method stub
		return mypageDao.cartConfirmUpdate(mvo);
	}

	@Override
	public List<PreviewVO> myProductRList(PreviewVO pvo) {
		// TODO Auto-generated method stub
		return mypageDao.myProductRList(pvo);
	}

	@Override
	public List<SreviewVO> mySellerRList(SreviewVO svo) {
		// TODO Auto-generated method stub
		return mypageDao.mySellerRList(svo);
	}

	@Override
	public int myProductRInsert(PreviewVO pvo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		int result = 0;		
		String fileName="";
		if(!pvo.getFile().isEmpty()) {  // null 로 하면 경우에 따라서 오류!!!
			try {
				fileName = FileUploadUtil.fileUpload(pvo.getFile(), request, "preview");
				pvo.setPrv_image(fileName);												
			} catch (IOException e) {			
				e.printStackTrace();
			}		
		}
		result = mypageDao.myProductRInsert(pvo);
		return result;
	}

	@Override
	public int mySellerInsert(SreviewVO svo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		int result = 0;		
		String fileName="";
		if(!svo.getFile().isEmpty()) {  // null 로 하면 경우에 따라서 오류!!!
			try {
				fileName = FileUploadUtil.fileUpload(svo.getFile(), request, "sreview");
				svo.setSrv_image(fileName);												
			} catch (IOException e) {			
				e.printStackTrace();
			}		
		}
		result = mypageDao.mySellerInsert(svo);
		return result;
	}

	@Override
	public SreviewVO mySellerRselectList(SreviewVO svo) {
		// TODO Auto-generated method stub
		return mypageDao.mySellerRselectList(svo);
	}

	@Override
	public PreviewVO myProductRselectList(PreviewVO pvo) {
		// TODO Auto-generated method stub
		return mypageDao.myProductRselectList(pvo);
	}



		
}
