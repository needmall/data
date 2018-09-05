package com.needmall.admin.store.controller;

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
	 * storeFeeInsert : 수수료 결제 확인 
	 * @return
	 */
	
	@RequestMapping(value="/storeFeeInsert.do", method=RequestMethod.POST)
	public String storeFeeInsert(FeesVO fvo, Model model) {
		int result=0;
		result = storeRegistService.storeFeeInsert(fvo);
		model.addAttribute("insertresult",result);		
		return "redirect:/admin/store/storeList.do"; 
	}
	
	/**
	 * storeFeeDelete : 수수료 결제 삭제 
	 * @return
	 */
	
	@RequestMapping(value="/storeFeeDelete.do", method=RequestMethod.POST)
	public String storeFeeDelete(FeesVO fvo, Model model) {
		int result=0;
		result = storeRegistService.storeFeeDelete(fvo);
		model.addAttribute("deleteresult",result);		
		return "redirect:/admin/store/storeList.do"; 
	}
	
	/**
	 * storeDetail : 상세 페이지 조회
	 * @param prvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/storeDetail.do", method=RequestMethod.GET)
	public String productDetail(StoreRegistVO srvo, Model model) {
		logger.info("storeDetail 호출 성공");
		
		StoreRegistVO detail= storeRegistService.storeDetail(srvo);		
		model.addAttribute("storeDetail", detail);
		
		return "admin/store/storeDetail";
	}

	/**
	 * storeUpdate : 상품 업데이트
	 * @param prvo
	 * @param request : 파일업데이트 위한  위치 확인용 
	 * @return
	 */
	@RequestMapping(value="/storeUpdate.do",method=RequestMethod.POST)
	public String storeUpdate(StoreRegistVO srvo, HttpServletRequest request) {
		logger.info("storeUpdate 호출 성공");	
		storeRegistService.storeUpdate(srvo, request);
		return "redirect:/admin/store/storeDetail.do?st_num="+srvo.getSt_num();
	}

	/**
	 * favStore : 즐겨찾기 목록반환	  
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/favStore.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String favStore(@RequestParam("c_num") int c_num, ObjectMapper mapper) {		
		String favStore = storeRegistService.favStore(c_num, mapper);		
		return favStore; // 문자열 반환
	}
}