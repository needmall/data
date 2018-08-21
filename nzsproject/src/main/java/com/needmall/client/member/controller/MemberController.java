package com.needmall.client.member.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.needmall.client.member.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	/********************************************************************
	 * 회원 가입 폼(이렇게 주석 다는거 잊지 말아요..★)
	 ********************************************************************/
	@RequestMapping(value="/join_select.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String joinForm(Model model) {
		logger.info("join.do get 방식에 의한 메서드 호출 성공");
		return "member/join_select";
	}
	
	
}
