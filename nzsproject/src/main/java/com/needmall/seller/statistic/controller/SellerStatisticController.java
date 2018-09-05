package com.needmall.seller.statistic.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.needmall.admin.statistic.vo.SalesDataVO;
import com.needmall.seller.statistic.serviece.SellerStatisticService;

@Controller
@RequestMapping(value="/seller/statistic")
public class SellerStatisticController {
	Logger logger = Logger.getLogger(SellerStatisticController.class);
	
	@Autowired
	private SellerStatisticService sellerStatisticService;
	
	/**
	 * sellerStoreData : 매점별 기간 통계
	 * @return
	 */
	@RequestMapping(value="/sellerStoreData.do",method=RequestMethod.GET)
	public String sellerStoreData(@RequestParam("st_num") int st_num, Model model) {
		logger.info("sellerStoreData 호출 성공");
		
		// 누적 통계
		SalesDataVO sellerStoreTotal = sellerStatisticService.sellerStoreTotal(st_num);
		model.addAttribute("sellerStoreTotal", sellerStoreTotal);
		//기간별 통계
		List<SalesDataVO> sellerStoreData = sellerStatisticService.sellerStoreData(st_num);
		model.addAttribute("sellerStoreData", sellerStoreData);		
		
		return "seller/storestatistic/sellerStoreData";
	}
}
