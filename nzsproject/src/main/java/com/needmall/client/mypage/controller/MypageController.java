package com.needmall.client.mypage.controller;


import java.sql.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.needmall.client.mypage.service.MypageService;
import com.needmall.client.mypage.vo.MycartVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	Logger logger = Logger.getLogger(MypageController.class);

	@Autowired
	private MypageService mypageService;
//	/mypage/mycartList.do
	
	@RequestMapping("/mypageList.do")
	public String mypageList(MycartVO mvo,Model model) {
		logger.info("mypageList 호 출");
		mvo.setC_num(1);
		logger.info("mvo " +mvo.getC_num());
		
		List<MycartVO> buylist = mypageService.buyList(mvo);
		int value = mypageService.pageList(mvo);
		logger.info("value = " +value);
		model.addAttribute("value",value);
		model.addAttribute("buylist",buylist);
		return "mypage/mypage";
	}
	
	
	/////////////////////////////////////////////////////////////장바구니 로직
	@RequestMapping(value="/mycartList.do")
	public String mycartList(MycartVO mvo ,Model model) {
		logger.info("mycartList 호 출");
		//		mvo.setC_num(2); // 나중에 세션 값 받아서 넘겨야함
		List<MycartVO> list = mypageService.mycartList(mvo);
		Date date =list.get(1).getCart1_date();
		model.addAttribute("cartList",list);
		model.addAttribute("date",date);
		
		return "mypage/mycart";
		
	}
	

	
	@ResponseBody
	@RequestMapping(value="/countUpdate.do")
	public String countUpdate(MycartVO mvo) {
		logger.info("countUpdate 호 출");
		String value="";
		value = mypageService.countUpdate(mvo);
		
		return value;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/itemdelete.do")
	public String itemDelete(MycartVO mvo) {
		logger.info("itemdelete 호 출");
		String value="";
		value = mypageService.itemDelete(mvo);
		
		return value;
		
	}
	
	//장바구니에서 구매------------------------------------------>aop 걸어야함

	@RequestMapping(value="/mycartBuy.do")
	public String mycartBuy(MycartVO mvo) {
		logger.info("mycartBuy 호 출");
		mypageService.mycartBuy(mvo);
		return "mypage/mybuy";
		
	}
	
	@ResponseBody //장바구니 수정일 바꾸기
	@RequestMapping(value="/dateCountUpdate.do")
	public void dateCountUpdate(MycartVO mvo) {
		logger.info("mycartBuy 호 출");
		mypageService.dateCountUpdate(mvo);
	}
	/////////////////////////////////////////////////////////////장바구니 로직끝
	
	@RequestMapping(value="/productBuy")
	public String productBuy(MycartVO mvo, Model model) {
		logger.info("productBuy 호 출");
		String result = mypageService.productBuy(mvo);
		logger.info("productBuy = "+result );
		return "mypage/mybuy";
		
	}
	
	
	@RequestMapping(value="/mybuy.do")
	public String mybuy(MycartVO mvo, Model model ) {
		logger.info("mybuy 호 출");
		return "mypage/mybuy";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/cartConfirmList.do")
	public int cartConfirmList(MycartVO mvo) {
		int result =mypageService.cartConfirmList(mvo);
		return result;
		
	}
}
