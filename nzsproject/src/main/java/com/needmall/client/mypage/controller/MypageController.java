package com.needmall.client.mypage.controller;


import java.sql.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.mypage.service.MypageService;
import com.needmall.client.mypage.vo.MycartVO;
import com.needmall.common.vo.ProductsellVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	Logger logger = Logger.getLogger(MypageController.class);

	@Autowired
	private MypageService mypageService;
//	/mypage/mycartList.do
	
	@RequestMapping("/mypageList.do")
	public String mypageList() {
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
	@ResponseBody
	@RequestMapping(value="/mycartBuy.do")
	public String mycartBuy(MycartVO mvo) {
		logger.info("mycartBuy 호 출");
		String value="";
		value = mypageService.mycartBuy(mvo);
		return value;
		
	}
	/////////////////////////////////////////////////////////////장바구니 로직끝
	
	@RequestMapping(value="/mybuy.do")
	public String mybuy(MycartVO mvo, Model model ) {
		logger.info("mybuy 호 출");
		
		model.addAttribute("form",mvo);
		List<MycartVO> buylist = mypageService.buyList(mvo);
		model.addAttribute("buylist",buylist);
		return "mypage/mybuy";
		
	}
}
