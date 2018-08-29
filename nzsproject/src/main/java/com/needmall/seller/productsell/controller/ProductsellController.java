package com.needmall.seller.productsell.controller;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.seller.productsell.service.ProductsellService;

@Controller
@RequestMapping(value="/productsell")
public class ProductsellController {
	
	@Autowired
	private ProductsellService productsellService;
	String s_id = "seller_user1";
	
	@RequestMapping(value="/productList", method = RequestMethod.GET)
	public String productsellList(Model model) {
		
		if(!s_id.isEmpty()) {
			List<ProductsellVO> productList = productsellService.productsellList(s_id);
			model.addAttribute("productList", productList);
		} else {
			model.addAttribute("error", "로그인 후 다시 이용 하시기 바랍니다.");
			return "redirect:/";  
		}
		
		return "seller/productsell/productList";
	}
}
