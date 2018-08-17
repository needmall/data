package com.needmall.client.productdetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.client.productdetail.service.ProductdetailService;
import com.needmall.client.productdetail.vo.ProductdetailVO;

@Controller
@RequestMapping(value="/productdetail")
public class ProductdetailController {

	@Autowired
	private ProductdetailService productdetailService;
	
	@RequestMapping(value="/productdetailmain.do",method=RequestMethod.GET)
	public String productdetailmain(ProductdetailVO dvo,Model model) {
//		ProductdetailVO detail = new ProductdetailVO();
//		detail =productdetailService.productdetailmain(dvo);
//		model.addAttribute("detail",detail);
		return "productdetail/productdetailmain";
		
	}
	
}
