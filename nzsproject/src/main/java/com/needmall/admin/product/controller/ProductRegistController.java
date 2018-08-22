package com.needmall.admin.product.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.admin.product.service.ProductRegistService;


@Controller
@RequestMapping(value="/admin/product")
public class ProductRegistController {
	Logger logger = Logger.getLogger(ProductRegistController.class);
	
	@Autowired
	private ProductRegistService productRegistService;
	
	@RequestMapping(value="/productregist.do",method=RequestMethod.GET)
	public String productRegist() {
		logger.info("productRegist 호출 성공");		
		return "admin/product/productregist";
	}
}
