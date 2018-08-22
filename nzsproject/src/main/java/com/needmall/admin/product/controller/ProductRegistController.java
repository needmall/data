package com.needmall.admin.product.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	/**
	 * storelist : 스토어 리스트 반환
	 * @param nowlat
	 * @param nowlon
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value="/Category1dep.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String category1dep( ObjectMapper mapper) {		
		String catedep1 = productRegistService.Category1dep(mapper);		
		return catedep1; // 문자열 반환
	}
}