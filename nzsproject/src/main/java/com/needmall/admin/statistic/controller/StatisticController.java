package com.needmall.admin.statistic.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.admin.statistic.service.StatisticService;
import com.needmall.admin.statistic.vo.CustomerDataVO;
import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.admin.statistic.vo.StoreDataVO;

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
	public String totalData(SalesDataVO sdvo,Model model) {
		logger.info("totalData 호출 성공");	
		List<SalesDataVO> salesDataList = statisticService.salesDataList();
		model.addAttribute("salesDataList", salesDataList);
		List<StoreDataVO> storeDataList = statisticService.storeDataList();
		model.addAttribute("storeDataList", storeDataList);
		List<CustomerDataVO> customerDataList = statisticService.customerDataList();
		model.addAttribute("customerDataList", customerDataList);
		return "admin/statistic/totalData";
	}
//
//	/**
//	 * productData : 상품별 판매량
//	 * @return
//	 */
//	@RequestMapping(value="/productData.do",method=RequestMethod.POST)
//	public String productData(Model model) {
//		logger.info("productData 호출 성공");		
//		return "admin/statistic/productData";
//	}
//	/**
//	 * storeData : 매장별 판매량
//	 * @return
//	 */
//	@RequestMapping(value="/storeData.do",method=RequestMethod.POST)
//	public String storeData(Model model) {
//		logger.info("storeData 호출 성공");		
//		return "admin/statistic/storeData";
//	}
}