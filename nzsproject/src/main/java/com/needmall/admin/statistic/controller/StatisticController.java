package com.needmall.admin.statistic.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.statistic.service.StatisticService;
import com.needmall.admin.statistic.vo.CustomerDataVO;
import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.admin.statistic.vo.StoreDataVO;
import com.needmall.common.vo.CustomerVO;

@Controller
@RequestMapping(value="/admin/statistic")
public class StatisticController {
	Logger logger = Logger.getLogger(StatisticController.class);
	
	@Autowired
	private StatisticService statisticService;
	
	/**
	 * totalData : 전체 판매량
	 * @return
	 */
	@RequestMapping(value="/totalData.do",method=RequestMethod.GET)
	public String totalData(Model model) {
		logger.info("totalData 호출 성공");	
		List<SalesDataVO> salesDataList = statisticService.salesDataList();
		model.addAttribute("salesDataList", salesDataList);
		List<StoreDataVO> storeDataList = statisticService.storeDataList();
		model.addAttribute("storeDataList", storeDataList);
		List<CustomerDataVO> customerDataList = statisticService.customerDataList();
		model.addAttribute("customerDataList", customerDataList);
		return "admin/statistic/totalData";
	}
	
	/**
	 * storeSalesList : 매장별 판매량
	 * @return
	 */
	@RequestMapping(value="/storeSalesList.do",method=RequestMethod.GET)
	public String storeSalesList(Model model) {
		logger.info("storeSalesList 호출 성공");
		List<SalesDataVO> storeSalesList = statisticService.storeSalesList();
		model.addAttribute("storeSalesList", storeSalesList);
		return "admin/statistic/storeSalesList";
	}

	/**
	 * productSalesList : 상품별 판매량
	 * @return
	 */
	@RequestMapping(value="/productSalesList.do",method=RequestMethod.GET)
	public String productSalesList(Model model) {
		logger.info("productSalesList 호출 성공");	
		List<SalesDataVO> productSalesList = statisticService.productSalesList();
		model.addAttribute("productSalesList", productSalesList);
		return "admin/statistic/productSalesList";
	}
	
	/**
	 * storeSalesData : 매점별 기간 통계
	 * @return
	 */
	@RequestMapping(value="/storeSalesData.do",method=RequestMethod.GET)
	public String storeSalesData(SalesDataVO sdvo,Model model) {
		logger.info("storeSalesData 호출 성공");	
		List<SalesDataVO> storeSalesData = statisticService.storeSalesData(sdvo);
		model.addAttribute("storeSalesData", storeSalesData);
		
		return "admin/statistic/storeSalesData";
	}
	
	/**
	 * productSalesData : 상붐별 기간 통계
	 * @return
	 */
	@RequestMapping(value="/productSalesData.do",method=RequestMethod.GET)
	public String productSalesData(SalesDataVO sdvo,Model model) {
		logger.info("productSalesData 호출 성공");	
		List<SalesDataVO> productSalesData = statisticService.productSalesData(sdvo);
		model.addAttribute("productSalesData", productSalesData);
		
		return "admin/statistic/productSalesData";
	}
	
	/**
	 * popItem : 인기상품 반환
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/popItem.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String popItem(ObjectMapper mapper) {
		logger.info("popItem 호출 성공");
		String listData = statisticService.popItem(mapper);		
		return listData; // 문자열 반환
	}
}