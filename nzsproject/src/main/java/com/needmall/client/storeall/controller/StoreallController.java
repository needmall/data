package com.needmall.client.storeall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.needmall.client.storeall.service.StoreallService;

@Controller
@RequestMapping(value="/storeall")
public class StoreallController {
	
	@Autowired
	private StoreallService StoreallService;
	
	@RequestMapping(value="/storeall.do")
	public String storeall() {
		return "storeall/storeall";
	}
}
