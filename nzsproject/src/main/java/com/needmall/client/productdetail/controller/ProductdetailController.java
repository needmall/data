package com.needmall.client.productdetail.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.product.service.ProductRegistService;
import com.needmall.client.productall.controller.ProductallController;
import com.needmall.client.productdetail.service.ProductdetailService;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.vo.StoreVO;

@Controller
@RequestMapping(value="/productdetail")
public class ProductdetailController {
	Logger logger = Logger.getLogger(ProductallController.class);
	
	@Autowired
	private ProductdetailService productdetailService;

	@RequestMapping(value="/productdetailmain.do",method=RequestMethod.GET)

	public String productdetailmain(ProductdetailVO dvo,Model model) {
//		logger.info("테스트용 ps_num"+dvo.getPs_num());
		logger.info("productdetailmain 호출");
		ProductdetailVO detail = new ProductdetailVO();
		detail =productdetailService.productdetailmain(dvo);
//		Map<String, String> category = productdetailService.productdetailSub(dvo);
//		logger.info("나와라 디테일"+detail.toString());
		model.addAttribute("detail",detail);
	
		return "productdetail/productdetailmain";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/productdetailStore.do")
	public String productdetailStore(ProductdetailVO dvo, ObjectMapper mapper) {
		logger.info("productdetailStore 호출");
		String value="";
		StoreVO store = new StoreVO();
		store =productdetailService.productdetailStore(dvo);
//		logger.info("logger.info(store)" +store);
		try {
			value = mapper.writeValueAsString(store);
		}catch (JsonProcessingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		logger.info("logger.info(value)" +value);
		return value;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/productdetailPreviewlist.do")
	public String productdetailPreviewlist(ProductdetailVO dvo, ObjectMapper mapper) {
		logger.info("productdetailPreviewlist 호출");
		String value="";
		List<PreviewVO> pList = productdetailService.productdetailPreviewlist(dvo);
//		logger.info("logger.info(store)" +store);
		try {
			value = mapper.writeValueAsString(pList);
		}catch (JsonProcessingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		logger.info("logger.info(value)" +value);
		return value;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/productdetailSreviewlist.do")
	public String productdetailSreviewlist(ProductdetailVO dvo, ObjectMapper mapper) {
		logger.info("productdetailSreviewlist 호출");
		String value="";
		List<SreviewVO> pList = productdetailService.productdetailSreviewlist(dvo);
//		logger.info("logger.info(store)" +store);
		try {
			value = mapper.writeValueAsString(pList);
		}catch (JsonProcessingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		logger.info("logger.info(value)" +value);
		return value;
		
	}
	

	
}
