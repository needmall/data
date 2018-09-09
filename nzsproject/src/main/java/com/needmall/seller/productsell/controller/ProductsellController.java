package com.needmall.seller.productsell.controller;






import java.util.List;


import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.needmall.client.login.vo.LoginVO;
import com.needmall.common.vo.ProductsellVO;
import com.needmall.common.vo.UserCommonVO;
import com.needmall.seller.productsell.service.ProductsellService;
import com.needmall.seller.productsell.vo.ProductInfoVO;
import com.needmall.seller.productsell.vo.ProductInsertVO;
import com.needmall.seller.productsell.vo.ProductListOneVO;


@Controller
@RequestMapping(value="/productsell")
public class ProductsellController {
	Logger logger = Logger.getLogger(ProductsellController.class);
	 
	@Autowired
	private ProductsellService productsellService;
	
	String s_id = "";
	 
	/* 판매 상품 목록 */
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String productList(Model model, HttpSession session){
		logger.info("productList 호출 성공");
		int st_num = 0;
		LoginVO login = (LoginVO)session.getAttribute("login");
		logger.info("출력 : " + login);
		// 세션 확인, 판매자 구분
		if(login != null && !login.getS_id().isEmpty() ) { 
			s_id = login.getS_id();
			logger.info("출력 : " + s_id);
			// 상품 판매 목록 조회
			List<ProductsellVO> productList = productsellService.productList(s_id);
			model.addAttribute("productList", productList);
			  
			// 통계 페이지 조회
			st_num = productsellService.storeNumSelectOne(s_id);
			model.addAttribute("st_num", st_num);
			
		} else {
			model.addAttribute("code", 1);
			return "redirect:/member/login.do";  
		}
		return "seller/productsell/productSellSelectList";
	}
	
	/* 판매 상품 등록 페이지 이동 */
	@RequestMapping(value="/writeform.do")
	public String writeForm(Model model) {
		logger.info("writeForm 호출 성공");
		int result = 0;
		String url = "";
		
		if(!s_id.isEmpty()) {
			// 수수료 기한 납부 확인
			result = productsellService.feesConfirm(s_id);
			
			if(result > 0) {
				// 상품 등록
				return "seller/productsell/productSellInsert";
			} else {
				// 기한 만료
				model.addAttribute("code", 2);
				url = "/productsell/list.do";
			}
		} else {
			model.addAttribute("code", 1);
			url = "/member/login.do";
		}
		return "redirect:" + url;
	}
	
	/* 판매 상품 검색 */
	@ResponseBody
	@RequestMapping(value="/search.do", method = RequestMethod.GET)
	public String searchList(UserCommonVO ucvo, Model model) {
		logger.info("searchList 호출 성공");
		String listData = "";
		  
		if(!s_id.isEmpty()) {
			ucvo.setS_id(s_id);
			listData = productsellService.searchList(ucvo);
		} else {
			model.addAttribute("code", 1);
			return "redirect:/member/login.do";
		} 
		return listData;
	}
	
	/* 판매 상품 카테고리 선택 */
	@ResponseBody
	@RequestMapping(value="/category.do", method = RequestMethod.GET)
	public String categoryList(ProductInfoVO ifvo, Model model) {
		logger.info("categoryList 호출 성공");
		String listData = "";
		  
		if(!s_id.isEmpty()) {
			ifvo.setS_id(s_id);
			listData = productsellService.categoryList(ifvo);
		} else {
			model.addAttribute("code", 1);
			return "redirect:/member/login.do";
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
				model.addAttribute("code", 3);
			}
			
		} else {
			model.addAttribute("code", 1);
			url =  "/member/login.do";
		}
		
		return "redirect:" + url;
	}
	
	/* 상세 페이지 이동 및 출력 */
	@RequestMapping(value="/detailform.do", method=RequestMethod.GET)
	public String productDetail(ProductInsertVO ivo, Model model) {
		logger.info("productDetail 호출 성공");
		ProductListOneVO Detail = null;
		
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			Detail = productsellService.productDetail(ivo);
			model.addAttribute("Detail", Detail);
			
			//productsellService.product
		} else {
			model.addAttribute("code", 1);
			return "redirect:/member/login.do";
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
			model.addAttribute("code", 1);
			return "redirect:/member/login.do";
		}
		return "seller/productsell/productSellUpdate";
	}
	
	/* 상품 정보 수정 및 재등록 */
	@RequestMapping(value="/productupdate.do", method=RequestMethod.POST)
	public String productUpdate(ProductInsertVO ivo, Model model) {
		logger.info("productUpdate 호출 성공");
		
		UserCommonVO status = null;
		ProductListOneVO updateData = null;
		
		int result = 0;
		String url = "";
		
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			
			// 판매상품 가격변경, 거래상태 조회
			status = productsellService.productState(ivo);
			
			// 가격 변경상태 저장
			ivo.setPriceStatus(status.getPriceStatus());
			
			// 가격 변경, 상품 판매
			if(status.getPriceStatus() == 0 && status.getDealStatus() > 0) {
				// 가격 변경 판매상품 정보조회 
				updateData = productsellService.productDetail(ivo);
				
				// 상품정보 수정			
				int ps_price = ivo.getPs_price();
				int ps_count = ivo.getPs_count();
				
				updateData.setS_id(s_id);
				updateData.setPs_price(ps_price);
				updateData.setPs_count(ps_count);
				
				// 상품 판매 재등록
				productsellService.productInsert(updateData);
			} else {
				ivo.setPriceStatus(1);
			}
			
			// 판매 상품 상태 변경 및 판매갯수 등록
			result = productsellService.productDealUpdate(ivo);
				
			if(result == 1) {
				// 수정 이동
				url = "/productsell/list.do";
			} else {
				url = "/productsell/detailform.do?ps_num=" + ivo.getPs_num();
				model.addAttribute("code", 4);
			}
			
		} else {
			model.addAttribute("code", 1);
			url = "/member/login.do";
		}
		return "redirect:" + url;
	}
	
	/* 판매상품 확인 및 삭제 */
	@RequestMapping(value="/productdelete.do", method=RequestMethod.POST)
	public String productDelete(ProductInsertVO ivo, Model model) {
		logger.info("productDelete 호출 성공");
		
		UserCommonVO status = null;
		
		int result = 0;
		String url = "";
		
		if(!s_id.isEmpty()) {
			ivo.setS_id(s_id);
			
			// 판매상품 가격변경, 거래상태 조회
			status = productsellService.productState(ivo);
			// 판매상품 상태 변경
			ivo.setPriceStatus(0);
							 
			// 가격 변경, 판매 중
			if(status.getDealStatus() > 0) {
				// 판매 상품 상태 변경 및 판매갯수 등록
				result = productsellService.productDealUpdate(ivo);
			} else {
				// 판매된 상품 없을 경우 삭제
				result = productsellService.productDelete(ivo);
			}
			
			if(result == 1) {
				// 수정 이동
				url = "/productsell/list.do";
			} else {
				// 삭제 실패
				url = "/productsell/detailform.do?ps_num=" + ivo.getPs_num();
				model.addAttribute("code", 4);
			}
			
		} else {
			model.addAttribute("code", 1);
			url = "/member/login.do";
		}
		return "redirect:" + url;
	}
	
}
