package com.needmall.client.mypage.controller;


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
		model.addAttribute("cartList",list);
		
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
	public String itemdelete(MycartVO mvo) {
		logger.info("itemdelete 호 출");
		String value="";
		value = mypageService.itemdelete(mvo);
		
		return value;
		
	}
	/////////////////////////////////////////////////////////////장바구니 로직끝
	
	@RequestMapping(value="/mybuy.do")
	public String mybuy(MycartVO mbvo, Model model ) {
		logger.info("mybuy 호 출");
		List<MycartVO> buylist = mypageService.mybuy(mbvo);
		model.addAttribute("buylist",buylist);
		return "mypage/mybuy";
		
	}
}
