package com.needmall.client.member.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.needmall.client.member.service.MemberService;
import com.needmall.client.member.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	/********************************************************************
	 * 회원 가입 폼(join_select)
	 ********************************************************************/
	@RequestMapping(value="/join_select.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String joinSelect(Model model) {
		logger.info("join.do get 방식에 의한 메서드 호출 성공");
		return "member/join_select";
	}
	
	/********************************************************************
	 * 회원 가입 폼(join_customer)
	 ********************************************************************/
	@RequestMapping(value="/join_customer.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String joinCustomer(Model model) {
		logger.info("join.do get 방식에 의한 메서드 호출 성공");
		return "member/join_customer";
	}
	
	/********************************************************************
	 * 회원 가입 폼(join_seller)
	 ********************************************************************/
	@RequestMapping(value="/join_seller.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String joinSeller(Model model) {
		logger.info("join.do get 방식에 의한 메서드 호출 성공");
		return "member/join_seller";
	}
	
	/********************************************************************
	 * 사용자 아이디(c_id) 중복 체크 메서드
	 ********************************************************************/
	// ↓ browser가 바로 응답해줄 수 있게 @ResponseBody	// console창에 sever 구동할때 "{[/member/userIdConfirm.do],methods=[POST]}" 뜸
	@ResponseBody
	@RequestMapping(value="/customerIdConfirm.do", method=RequestMethod.POST)
	public String customerIdConfirm(@RequestParam("c_id") String c_id) {
		
		int result = memberService.customerIdConfirm(c_id);
		return result+"";
	}
	
	/********************************************************************
	 * 판매자 아이디(s_id) 중복 체크 메서드
	 ********************************************************************/
	// ↓ browser가 바로 응답해줄 수 있게 @ResponseBody	// console창에 sever 구동할때 "{[/member/userIdConfirm.do],methods=[POST]}" 뜸
	@ResponseBody
	@RequestMapping(value="/sellerIdConfirm.do", method=RequestMethod.POST)
	public String sellerIdConfirm(@RequestParam("s_id") String s_id) {
		
		int result = memberService.sellerIdConfirm(s_id);
		return result+"";
	}
	
	/********************************************************************
	 * 회원 가입 처리(customer)
	 ********************************************************************/
	@RequestMapping(value="/join_customer.do", method = RequestMethod.POST)
	public ModelAndView customerInsert(MemberVO mvo) {	// console창에 sever 구동할때 "{[/member/join.do],methods=[POST]}"
		logger.info("join_customer.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		int result = 0;
		result = memberService.customerInsert(mvo);
		
		switch(result) {
		case 1:
			mav.addObject("errCode", 1);	//userId already exist
			mav.setViewName("client/member/join_customer");	//client 넣어줘?
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("client/member/join_success");	// success to add new member
			break;
		default:
			mav.addObject("errCode", 2);
			mav.setViewName("client/member/join_customer");	// failed to add new member
			break;
		}
		mvo.setCs_division(0);
		return mav;
	}
	
	/********************************************************************
	 * 회원 가입 처리(seller)
	 ********************************************************************/
	@RequestMapping(value="/join_seller.do", method = RequestMethod.POST)
	public ModelAndView sellerInsert(MemberVO mvo) {	// console창에 sever 구동할때 "{[/member/join.do],methods=[POST]}"
		logger.info("join.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		int result = 0;
		result = memberService.sellerInsert(mvo);
		
		switch(result) {
		case 1:
			mav.addObject("errCode", 1);	//userId already exist
			mav.setViewName("member/join");
			break;
		case 3:
			mav.addObject("errCode", 3);
			mav.setViewName("member/join_success");	// success to add new member
			break;
		default:
			mav.addObject("errCode", 2);
			mav.setViewName("member/join");	// failed to add new member
			break;
		}
		mvo.setCs_division(1);
		return mav;
	}
	
}
