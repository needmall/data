package com.needmall.client.mypage.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value="/mycartList.do")
	public String mycartList(MycartVO mvo ,Model model) {
//		mvo.setC_num(2); // 나중에 세션 값 받아서 넘겨야함
		List<MycartVO> list = mypageService.mycartList(mvo);
		model.addAttribute("cartList",list);
		
		return "mypage/mycart";
		
	}
}
