package com.needmall.client.productall.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.needmall.client.productall.service.ProductallService;
import com.needmall.client.productall.vo.ProductallVO;



@Controller
@RequestMapping(value="/productall")
public class ProductallController {
	Logger logger = Logger.getLogger(ProductallController.class);
	
	@Autowired
	private ProductallService productallService;
	private String c_id = "customer_user1";
	
	@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productallList(Model model) {
		logger.info("productList 호출 성공");
		
		
		if(c_id != null) {
			// 즐겨찾기
			List<ProductallVO> productFavList = productallService.productFavList(c_id);
			model.addAttribute("productFavList", productFavList);
		}
		
		return "client/productall/productList";   
	}
	
	
	/*@RequestMapping(value="/productList.do", method = RequestMethod.GET)
	public String productallList(@RequestParam("st_address") String st_address, @RequestParam("c_lat") double c_lat, @RequestParam("c_lon") double c_lon, Model model) {
		logger.info("productList 호출 성공");
		
		
		if(c_id != null) {
			// 즐겨찾기
			List<ProductallVO> productFavList = productallService.productFavList(c_id);
			model.addAttribute("productFavList", productFavList);
		}

		if(c_lat > 0.0 && c_lon > 0.0) {
			// Location : 위도, 경도
			List<ProductallVO> productLocList = productallService.productLocList(c_lat, c_lon);
			model.addAttribute("productLocList", productLocList);
		} else if(st_address != null) {
			// 주소 검색
			List<ProductallVO> productStoList = productallService.productStoList(st_address);
			model.addAttribute("productStoList", productStoList);
		}	
		
		return "productall/productList";
	}*/
	
	
	
}
