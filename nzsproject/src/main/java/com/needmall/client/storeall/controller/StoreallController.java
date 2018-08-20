package com.needmall.client.storeall.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.client.storeall.service.StoreallService;
import com.needmall.client.storeall.vo.StoreallVO;
import com.needmall.common.vo.CustomerVO;

@Controller
@RequestMapping(value="/storeall")
public class StoreallController {
	Logger logger = Logger.getLogger(StoreallController.class);
	
	@Autowired
	private StoreallService storeallService;
		
	@RequestMapping(value="/storeall.do", method=RequestMethod.GET)
	public String storeall(CustomerVO cvo, StoreallVO svo, Model model ) {
		logger.info("storeall 호출 성공");
		
		List<StoreallVO> storeList = storeallService.storeList(cvo);		
		model.addAttribute("storeList", storeList);     
		
		return "storeall/storeall";
	}
}
