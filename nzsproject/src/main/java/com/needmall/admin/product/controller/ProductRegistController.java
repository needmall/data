package com.needmall.admin.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.product.service.ProductRegistService;
import com.needmall.admin.product.vo.ProductRegistVO;

@Controller
@RequestMapping(value="/admin/product")
public class ProductRegistController {
	Logger logger = Logger.getLogger(ProductRegistController.class);
	
	@Autowired
	private ProductRegistService productRegistService;
	
	@RequestMapping(value="/productRegist.do",method=RequestMethod.GET)
	public String productRegist() {
		logger.info("productRegist 호출 성공");		
		return "admin/product/productRegist";
	}
	
	
	/**
	 * category1dep : 카테고리 1 반환
	 * @param mapper
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/Category1dep.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String category1dep( ObjectMapper mapper) {		
		String catedep1 = productRegistService.category1dep(mapper);		
		return catedep1; // 문자열 반환
	}
	
	/**
	 * category2dep : 카테고리 2 반환
	 * @param mapper
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/Category2dep.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String category2dep(@RequestParam("c1_num") int c1_num,  ObjectMapper mapper) {		
		String catedep1 = productRegistService.category2dep(c1_num, mapper);		
		return catedep1; // 문자열 반환
	}
	
	/**
	 * division : 판매점 구분 반환	  
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/division.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String divisionlist() {		
		String catedep1 = productRegistService.divisionlist();		
		return catedep1; // 문자열 반환
	}
	
	/**
	 * division : 상품 등록	  
	 * @return
	 */	
	@RequestMapping(value="/productInsert.do", method=RequestMethod.POST, produces ="text/plain; charset=UTF-8")
	public String productInsert(ProductRegistVO prvo, HttpServletRequest request, Model model) {	
		int result =0;	
		result = productRegistService.productInsert(prvo, request);
		model.addAttribute("registresult",result);
		return "admin/product/productRegist"; 
	}
	
	/**
	 * productList : 상품 리스트
	 * @return
	 */
	@RequestMapping(value="/productList.do",method=RequestMethod.GET)
	public String productList(ProductRegistVO prvo, Model model) {
		logger.info("productList 호출 성공");	
		List<ProductRegistVO> list = productRegistService.productList(prvo);
		model.addAttribute("productList", list);
		return "admin/product/productList";
	}
	
	/**
	 * 상세 페이지 조회
	 * **/
	@RequestMapping(value="/productDetail.do", method=RequestMethod.GET)
	public String productDetail(ProductRegistVO prvo, Model model) {
		logger.info("productDetail 호출 성공");
		
		ProductRegistVO detail= productRegistService.productDetail(prvo);		
		model.addAttribute("productDetail", detail);
		
		return "admin/product/productDetail";
	}
	
	/**
	 * productUsageCount : 상품 사용중 여부
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="/productUsageCount.do",method=RequestMethod.POST)  // 변환 타입 위랑 다름 이유 확인!!
	public int productUsageCount(@RequestParam("p_num") int p_num) {
		logger.info("productUsageCount 호출 성공");	
		int result = 0;		
		result = productRegistService.productUsageCount(p_num);				
		return result;
	}
	
	@RequestMapping(value="/productDelete.do",method=RequestMethod.POST)
	public String productDelete(ProductRegistVO prvo, HttpServletRequest request) {
		logger.info("productDelete 호출 성공");	
		productRegistService.productDelete(prvo, request);
		return "redirect:/admin/product/productList.do";
	}
}