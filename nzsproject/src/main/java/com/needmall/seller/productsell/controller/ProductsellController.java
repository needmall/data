package com.needmall.seller.productsell.controller;





import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.service.ProductsellService;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;

@Controller
@RequestMapping(value="/productsell")
public class ProductsellController {
	Logger logger = Logger.getLogger(ProductsellController.class);
	 
	@Autowired
	private ProductsellService productsellService;
	String s_id = "seller_user1";
	
	/* 판매 상품 목록 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String productList(Model model) {
		
		if(!s_id.isEmpty()) {
			List<ProductsellVO> productList = productsellService.productList(s_id);
			model.addAttribute("productList", productList);
		} else {
			model.addAttribute("error", "로그인 후 다시 이용 하시기 바랍니다.");
			return "redirect:/";  
		}
		
		return "seller/productsell/productSellList";
	}
	
	/* 판매 상품 등록 페이지 이동 */
	@RequestMapping(value="/writeform.do")
	public String writeForm() {
		logger.info("writeForm 호출 성공");
				
		return "seller/productsell/productSellInsert";
	}
	
	/* 판매 상품 검색 */
	@ResponseBody
	@RequestMapping(value="/search.do", method = RequestMethod.GET)
	public String searchList(UserCommonVO ucvo) {
		String listData = "";
		  
		if(!s_id.isEmpty()) {
			ucvo.setS_id(s_id);
			listData = productsellService.searchList(ucvo);
		} else {
			return "redirect:/";
		} 
		return listData;
	} 
	
	/* 판매 상품 등록 */
	@RequestMapping(value="/productinsert.do", method = RequestMethod.POST)
	public String productInsert(ProductInsertVO ivo, Model model) {
		String url = "";
		int result = 0;
		System.out.println(ivo.getPs_expiration());
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			result = productsellService.productInsert(ivo);
			
			if(result == 1) {
				url = "/productsell/writeform.do";
			} else {
				url = "/productsell/writeform.do";
				model.addAttribute("error", "상품 등록 실패, 관리자에 문의 하십시요.");
			}
			
		} else {
			return "redirect:/";
		}
		
		return "redirect:" + url;
	}
}
