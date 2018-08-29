package com.needmall.seller.productRequest.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.needmall.common.vo.ReqproductVO;
import com.needmall.seller.productRequest.service.ProductRequestService;


@Controller
@RequestMapping(value="/seller/productrequest")
public class ProductRequestController {
	Logger logger = Logger.getLogger(ProductRequestController.class);
	
	@Autowired
	private ProductRequestService productRequestService;
	
	public String productRequstUpdate(ReqproductVO rvo, Model model) {
		logger.info("productRequstUpdate  호출 성공");
		int result=0;
		result=productRequestService.ProductRequestUpdate(rvo);
		model.addAttribute("result", result);
		return "seller/productrequest/productRequstUpdate";
	}
}
