package com.needmall.client.productdetail.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.client.productall.controller.ProductallController;
import com.needmall.client.productdetail.service.ProductdetailService;
import com.needmall.client.productdetail.vo.ProductdetailVO;

@Controller
@RequestMapping(value="/productdetail")
public class ProductdetailController {
	Logger logger = Logger.getLogger(ProductallController.class);
	
	@Autowired
	private ProductdetailService productdetailService;
	
	@RequestMapping(value="/productdetailmain.do",method=RequestMethod.GET)
	public String productdetailmain(ProductdetailVO dvo,Model model) {
		logger.info("productdetailmain 호출");
		ProductdetailVO detail = new ProductdetailVO();
		detail =productdetailService.productdetailmain(dvo);
		model.addAttribute("detail",detail);
		logger.info(detail.toString());
	
		return "productdetail/productdetailmain";
		
	}
	
}
