package com.needmall.client.productall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.needmall.client.productall.service.ProductallService;

@Controller
@RequestMapping(value="productall")
public class ProductallController {
	
	@Autowired
	private ProductallService productallService;
	
	
	
}
