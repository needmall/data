package com.needmall.client.productdetail.controller;

import java.util.List;

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
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.ProductdetailVO;
import com.needmall.client.productdetail.vo.SreviewVO;
import com.needmall.common.vo.FavproductVO;
import com.needmall.common.vo.FavstoreVO;
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
		try {
			value = mapper.writeValueAsString(store);
		}catch (JsonProcessingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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
	
	@ResponseBody
	@RequestMapping(value="/productdetailFavpList.do")
	public int productdetailFavpList(FavproductVO fvo) {
		logger.info("productdetailFavpList 호출");
		int result = productdetailService.productdetailFavpList(fvo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/productdetailFavsList.do")
	public int productdetailFavsList(FavstoreVO svo) {
		logger.info("productdetailFavsList 호출");
		int result = productdetailService.productdetailFavsList(svo);
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/productdetailFavpInsert.do") 	//    c_num,p_num
	public String productdetailFavpInsert(FavproductVO fvo) {
		logger.info("productdetailFavpInsert 호출");
		String value ="";
		value = productdetailService.productdetailFavpInsert(fvo);
		return value;
	}
	
	@ResponseBody
	@RequestMapping(value="/productdetailFavsInsert.do")	//    c_num,st_num
	public String productdetailFavsInsert(FavstoreVO svo) {
		logger.info("productdetailFavpUpdate 호출");
		String value ="";
		value = productdetailService.productdetailFavsInsert(svo);
		return value;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/productdetailCartList.do")
	public int productdetailCartList(ProductdetailVO pvo) {
		logger.info("productdetailCartList 호출");
		logger.info("pvo : " +pvo.getCart2_count());
		
		int result = productdetailService.productdetailCartList(pvo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/productdetailCartInsert.do")	//    c_num,st_num
	public String productdetailCartInsert(ProductdetailVO pvo) {
		logger.info("productdetailCartInsert 호출");
		String value ="";
		value = productdetailService.productdetailCartInsert(pvo);
		return value;
	}

	
}
