package com.needmall.seller.productRequest.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.admin.product.vo.ReqproductRegistVO;
import com.needmall.common.vo.ReqproductVO;
import com.needmall.seller.productRequest.service.ProductRequestService;


@Controller
@RequestMapping(value="/seller/productrequest")
public class ProductRequestController {
	Logger logger = Logger.getLogger(ProductRequestController.class);
	
	@Autowired
	private ProductRequestService productRequestService;
	
	
	/**
	 * productRequest: 등록 요청화면 호출용
	 * @return
	 */
	@RequestMapping(value="/productRequest.do",method=RequestMethod.GET)
	public String productRequest() {
		logger.info("productRequest 호출 성공");		
		return "seller/productrequest/productRequest";
	}
	
	/**
	 * productRequstUpdate : 등록요청 업데이트
	 * @param rvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/productRequstUpdate.do",method=RequestMethod.POST)
	public String productRequstUpdate(ReqproductRegistVO rrvo, Model model) {
		logger.info("productRequstUpdate  호출 성공");
		int result=0;
		result=productRequestService.ProductRequestUpdate(rrvo);
		model.addAttribute("result", result);
		return "redirect:seller/productrequest/productRequest.do";
	}
}
