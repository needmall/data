package com.needmall.client.productdetail.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.productall.controller.ProductallController;
import com.needmall.client.productdetail.service.ProductdetailService;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.common.vo.StoreVO;

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
//		Map<String, String> category = productdetailService.productdetailSub(dvo);
		List<ProductdetailVO> category = productdetailService.productdetailSub(dvo);
		List<ProductdetailVO> category2 = productdetailService.productdetailSub(dvo);

		
		model.addAttribute("category",category);
		model.addAttribute("category2",category2);
		model.addAttribute("detail",detail);
	
		return "productdetail/productdetailmain";
		
	}
	
//	@ResponseBody
//	@RequestMapping(value="/productdetailStore.do",method= RequestMethod.GET,produces="text/plain; charset=UTF-8")
//	public String productdetailStore(ProductdetailVO dvo, ObjectMapper mapper) {
//		String value="";
//		StoreVO store = new StoreVO();
//		store =productdetailService.productdetailStore(dvo);
//		try {
//			value = mapper.writeValueAsString(store);
//		}catch (JsonProcessingException e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		logger.info(store.toString());
//		return value;
//		
//	}
	
	
}
