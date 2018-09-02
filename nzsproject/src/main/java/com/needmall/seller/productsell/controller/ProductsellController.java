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
import com.needmall.seller.productsell.vo.ProductInsertVO;
import com.needmall.seller.productsell.vo.ProductListOneVO;

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
		logger.info("productList 호출 성공");
		
		if(!s_id.isEmpty()) { 
			List<ProductsellVO> productList = productsellService.productList(s_id);
			model.addAttribute("productList", productList);
		} else {
			model.addAttribute("error", "로그인 후 다시 이용 하시기 바랍니다.");
			return "redirect:/";  
		}
		
		return "seller/productsell/productSellSelectList";
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
		logger.info("searchList 호출 성공");
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
		logger.info("productInsert 호출 성공");
		int result = 0;
		String url = "";
		
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
				
			// 상품 등록
			result = productsellService.productInsert(ivo);
			
			if(result == 1) {
				url = "/productsell/list.do";
			} else {
				url = "/productsell/writeform.do";
				model.addAttribute("error", "상품 등록 실패, 관리자에 문의 하십시요.");
			}
			
		} else {
			url =  "/";
		}
		
		return "redirect:" + url;
	}
	
	/* 상세 페이지 이동 및 출력 */
	@RequestMapping(value="/detailform.do", method=RequestMethod.GET)
	public String productDetail(ProductInsertVO ivo, Model model) {
		logger.info("productDetail 호출 성공");
		ProductListOneVO Detail = null;
		String url = "";
		
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			Detail = productsellService.productDetail(ivo);
			model.addAttribute("Detail", Detail);
			
			//productsellService.product
		} else {
			return "redirect:/";
		}
		return "seller/productsell/productSellSelectOne";
	}
	
	/* 수정 페이지 이동 및 출력 */
	@RequestMapping(value="/updateform.do", method=RequestMethod.POST)
	public String productDetailUpdate(ProductInsertVO ivo, Model model) {
		logger.info("productDetailUpdate 호출 성공");
		ProductListOneVO Detail = null;

		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			Detail = productsellService.productDetail(ivo);
			model.addAttribute("Detail", Detail);
		} else {
			return "redirect:/";
		}
		return "seller/productsell/productSellUpdate";
	}
	
	/* 상품 정보 수정 및 재등록 */
	@RequestMapping(value="/productupdate.do", method=RequestMethod.POST)
	public String productUpdate(ProductInsertVO ivo, Model model) {
		logger.info("productUpdate 호출 성공");
		ProductListOneVO Detail = null;
		int result = 0;
		String url = "";
		
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			
			// 판매상품 상태값 변경
			result = productsellService.productUpdate(ivo);
			
			if(result == 1) {
				// 판매상품 정보 조회
				Detail = productsellService.productDetail(ivo);
				
				// 상품정보 수정 조합			
				int ps_price = ivo.getPs_price();
				int ps_count = ivo.getPs_count();
				 
				Detail.setS_id(s_id);
				Detail.setPs_price(ps_price);
				Detail.setPs_count(ps_count);
					 
				// 상품 판매 재등록
				result = productsellService.productInsert(Detail);
					
				// 수정 이동
				url = "/productsell/list.do";
				} else {
				url = "/productsell/updateform.do?ps_num=" + ivo.getPs_num();
				model.addAttribute("error", "상품 등록 실패, 관리자에 문의 하십시요.");
			}
		
		} else {
			return "redirect:/";
		}
		return "redirect:" + url;
	}
	
	/* 판매상품 확인 및 삭제 */
	@RequestMapping(value="/productdelete.do", method=RequestMethod.POST)
	public String productDelete(ProductInsertVO ivo, Model model) {
		logger.info("productDelete 호출 성공");
		int result = 0;
		String url = "";
		
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			
			// 판매상품 거래 조회
			//result = productsellService.productUpdate(ivo);
			/*
			 SELECT *
			FROM customer c INNER JOIN buy1dep b1 ON c.c_num = b1.c_num INNER JOIN buy2dep b2 ON b2.b1_num = b1.b1_num
			WHERE b_confirm = 0 AND ps_num = (SELECT ps_num FROM seller s INNER JOIN store st ON s.s_num = st.s_num INNER JOIN productsell ps ON ps.s_num = s.s_num WHERE s_id = 'seller_user1' AND ps_num = 1);
			 * */
			if(result == 1) {
				
				// 상품 판매 삭제
				//result = productsellService.productInsert(Detail);
					
				// 
				url = "/productsell/list.do";
			} else {
				url = "/productsell/detailform.do?ps_num=" + ivo.getPs_num();
				model.addAttribute("error", "상품 등록 실패, 관리자에 문의 하십시요.");
			} 
		
		} else {
			return "redirect:/";
		}
		return "redirect:" + url;
	}
	
}
