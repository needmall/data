package com.needmall.client.main.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	Logger logger = Logger.getLogger(MainController.class);
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String main() {
		
		return "index";
	}
}
