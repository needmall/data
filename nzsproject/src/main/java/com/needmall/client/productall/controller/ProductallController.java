package com.needmall.client.productall.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.client.productall.service.ProductallService;
import com.needmall.client.productall.vo.ProductallVO;

@Controller
@RequestMapping(value="/productall")
public class ProductallController {
	Logger logger = Logger.getLogger(ProductallController.class);
	
	@Autowired
	private ProductallService productallService;
	
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productallList(ProductallVO pvo, Model model) {
		logger.info("productList 호출 성공");
		
		List<ProductallVO> productFavList = productallService.productFavList(pvo);
		model.addAttribute("productFavList", productFavList);
		
		List<ProductallVO> productStoList = productallService.productStoList(pvo);
		model.addAttribute("productStoList", productStoList);
		
		return "productall/productList";
	}
	
}
