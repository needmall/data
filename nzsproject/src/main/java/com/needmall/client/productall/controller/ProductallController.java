package com.needmall.client.productall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.productall.service.ProductallService;
import com.needmall.client.productall.vo.ProductallVO;



@Controller
@RequestMapping(value="/productall")
public class ProductallController {
	Logger logger = Logger.getLogger(ProductallController.class);
	
	@Autowired
	private ProductallService productallService;
	private String c_id = "";
	// customer_user1 / customer_user1
	
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productallList(Model model, HttpSession session) {
		logger.info("productList 호출 성공");
		String succes = "";
		LoginVO login = (LoginVO)session.getAttribute("login");

		// 세션 확인 
		if(login != null) {
			// 사용자 정보 대입
			c_id = login.getC_id();
			
			// 즐겨찾기 매장 판매 상품
			List<ProductallVO> productFavList = productallService.productFavList(c_id);
			model.addAttribute("productFavList", productFavList);
			
			// 로그인 확인
			succes = "true";
			model.addAttribute("succes", succes);
		} 
		
		return "client/productall/productList";   
	}
	
	@ResponseBody
	@RequestMapping(value="/productLocList.do", method=RequestMethod.GET, produces = "text/plain; charset=UTF-8") 
	public String productLocList(ProductallVO pvo, ObjectMapper mapper) {
		logger.info("productLocList 호출 성공");
		String listData = "";
		if(pvo.getC_lat() > 0.0 && pvo.getC_lon() > 0.0) {
			// 검색 주소의 위도, 경도
			listData = productallService.productLocList(pvo, mapper);	
		} 
		/*else if(pvo.getC_lat() < 0.0 || pvo.getC_lon() < 0.0) {
			listData = "code : 1";
		}*/ 
		else {
			listData = productallService.productAllList(mapper);
		}
		return listData;
	}
	
}
