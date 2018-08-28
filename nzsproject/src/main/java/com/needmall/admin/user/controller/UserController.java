package com.needmall.admin.user.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.admin.user.service.UserService;
import com.needmall.common.vo.CustomerVO;
import com.needmall.common.vo.SellerVO;


@Controller
@RequestMapping(value="/admin/user")
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	

	/**
	 * customerList : 고객 리스트
	 * @param cvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/customerList.do",method=RequestMethod.GET)
	public String customerList(Model model) {
		logger.info("customerList 호출 성공");	
		List<CustomerVO> list = userService.customerList();
		model.addAttribute("customerList", list);
		return "admin/user/customerList";
	}
	
	/**
	 * userList : 셀러 리스트
	 * @param prvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/sellerList.do",method=RequestMethod.GET)
	public String sellerList( Model model) {
		logger.info("sellerList 호출 성공");	
		List<SellerVO> list = userService.sellerList();
		model.addAttribute("sellerList", list);
		return "admin/user/sellerList";
	}
}