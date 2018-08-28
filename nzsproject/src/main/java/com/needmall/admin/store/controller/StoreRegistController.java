package com.needmall.admin.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.needmall.admin.store.service.StoreRegistService;
import com.needmall.admin.store.vo.StoreRegistVO;
import com.needmall.common.vo.FeesVO;
import com.needmall.common.vo.ReqstoreVO;

@Controller
@RequestMapping(value="/admin/store")
public class StoreRegistController {
	Logger logger = Logger.getLogger(StoreRegistController.class);
	
	@Autowired
	private StoreRegistService storeRegistService;
	
	
//	
	/**
	 * storeReqList: 등록요청 리스트 화면 호출용
	 * @return
	 */
	@RequestMapping(value="/storeReqList.do",method=RequestMethod.GET)
	public String storeReqList(Model model) {
		logger.info("storeReqList 호출 성공");
		List<ReqstoreVO> list = storeRegistService.storeReqList();
		model.addAttribute("storeReqList", list);
		return "admin/store/storeReqList";
	}
	
	/**
	 * storeRegist: 등록 요청 처리 페이지
	 * @return
	 */
	@RequestMapping(value="/storeRegist.do",method=RequestMethod.POST)
	public String storeRegist(ReqstoreVO rsvo ,Model model) {
		logger.info("storeRegist 호출 성공");		
		model.addAttribute("storeReq", rsvo);
		return "admin/store/storeRegist";
	}
	
	/**
	 * division : 판매점 구분 반환	  
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/division.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String divisionlist() {		
		String division = storeRegistService.divisionlist();		
		return division; // 문자열 반환
	}

	/**
	 * storeInsert : 상품 등록	  
	 * @param prvo
	 * @param request   사진 등록을 위한 위치 확인용
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/storeInsert.do", method=RequestMethod.POST)
	public String storeInsert(StoreRegistVO srvo, HttpServletRequest request, Model model) {	
		int result =0;	
		result = storeRegistService.storeInsert(srvo, request);
		model.addAttribute("registresult",result);
		return "redirect:/admin/store/storeReqList.do"; 
	}
	
	/**
	 * storeList: 매장 리스트 화면 호출용
	 * @return
	 */
	@RequestMapping(value="/storeList.do",method=RequestMethod.GET)
	public String storeList(Model model) {
		logger.info("storeList 호출 성공");
		List<StoreRegistVO> list = storeRegistService.storeList();
		model.addAttribute("storeList", list);
		return "admin/store/storeList";
	}
	
	/**
	 * division : 판매점 구분 반환	  
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/storeFeeInsert.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public int storeFeeInsert(FeesVO fvo) {		
		int result=0;
		result = storeRegistService.storeFeeInsert(fvo);		
		return result; // 문자열 반환
	}
	
//storeFeeInsert
//	/**
//	 * productList : 상품 리스트   produces ="text/plain; charset=UTF-8"
//	 * @param prvo
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/productList.do",method=RequestMethod.GET)
//	public String productList(ProductRegistVO prvo, Model model) {
//		logger.info("productList 호출 성공");	
//		List<ProductRegistVO> list = productRegistService.productList(prvo);
//		model.addAttribute("productList", list);
//		return "admin/product/productList";
//	}
//	
//	/**
//	 * productDetail : 상세 페이지 조회
//	 * @param prvo
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/productDetail.do", method=RequestMethod.GET)
//	public String productDetail(ProductRegistVO prvo, Model model) {
//		logger.info("productDetail 호출 성공");
//		
//		ProductRegistVO detail= productRegistService.productDetail(prvo);		
//		model.addAttribute("productDetail", detail);
//		
//		return "admin/product/productDetail";
//	}
//	
//	/**
//	 *  productUsageCount : 상품 사용중 여부
//	 * @param p_num
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value="/productUsageCount.do",method=RequestMethod.POST)  // 변환 타입 위랑 다름 이유 확인!!
//	public int productUsageCount(@RequestParam("p_num") int p_num) {
//		logger.info("productUsageCount 호출 성공");	
//		int result = 0;		
//		result = productRegistService.productUsageCount(p_num);				
//		return result;
//	}
//	
//	/**
//	 * productDelete : 상품 삭제
//	 * @param prvo
//	 * @param request : 파일 삭제를 위한  위치 확인용 
//	 * @return
//	 */
//	@RequestMapping(value="/productDelete.do",method=RequestMethod.POST)
//	public String productDelete(ProductRegistVO prvo, HttpServletRequest request) {
//		logger.info("productDelete 호출 성공");	
//		productRegistService.productDelete(prvo, request);
//		return "redirect:/admin/product/productList.do";
//	}
//	
//	/**
//	 * division : 상품 수정  
//	 * @param prvo
//	 * @param request   사진 등록을 위한 위치 확인용
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value="/productUpdate.do", method=RequestMethod.POST, produces ="text/plain; charset=UTF-8")
//	public String productUpdate(ProductRegistVO prvo, HttpServletRequest request, Model model) {	
//		int result =0;	
//		result = productRegistService.productUpdate(prvo, request);
//		model.addAttribute("registresult",result);
//		return "redirect:/admin/product/productDetail.do?p_num="+prvo.getP_num(); 
//	}
//	
//	/**
//	 *  stateUpdate : 상품 사용중 여부
//	 * @param p_num
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value="/stateUpdate.do",method=RequestMethod.POST)  // 변환 타입 위랑 다름 이유 확인!!
//	public int stateUpdate(@RequestParam("p_num") int p_num, @RequestParam("p_state") int p_state) {
//		logger.info("stateUpdate 호출 성공");	
//		int result = 0;		
//		result = productRegistService.stateUpdate(p_num, p_state);				
//		return result;
//	}
}