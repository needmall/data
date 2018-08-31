package com.needmall.client.storeall.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.productall.vo.ProductallVO;
import com.needmall.client.storeall.service.StoreallService;
import com.needmall.common.vo.CustomerVO;

@Controller
@RequestMapping(value="/storeall")
public class StoreallController {
	Logger logger = Logger.getLogger(StoreallController.class);
	
	@Autowired
	private StoreallService storeallService;
	
	/**
	 * storeall : 전체매장 화면 호출
	 * @return
	 */
	@RequestMapping(value="/storeall.do", method=RequestMethod.GET)
	public String storeall() {
		logger.info("storeall 호출 성공");		
		return "storeall/storeall";
	}
	
	
	/**
	 * storelist : 스토어 리스트 반환
	 * @param nowlat
	 * @param nowlon
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/storelist.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String storelist(CustomerVO cvo, ObjectMapper mapper) {
		logger.info("storelist 호출 성공");
		String listData = storeallService.storeList(cvo, mapper);	
		return listData; // 문자열 반환
	}
	@ResponseBody
	@RequestMapping(value="/storeProducts.do", method=RequestMethod.GET, produces = "text/plain; charset=UTF-8") 
	public String storeProducts(@RequestParam("st_num") int st_num, ObjectMapper mapper) {
		logger.info("storeProducts 호출 성공");
		String list = "";
		list = storeallService.storeProducts(st_num, mapper);
		return list;
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="/storelist.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String storelist(CustomerVO cvo, ObjectMapper mapper) {
		logger.info("storelist 호출 성공");
		String listData = "";
		List<StoreallVO> list = storeallService.storeList(cvo);
		try {
			listData = mapper.writeValueAsString(list); // list의 객체를 listData에 jason형태로 담는다.
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData; // 문자열 반환
	}*/
}
