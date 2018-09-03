package com.needmall.client.member.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.needmall.client.login.service.LoginService;
import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.service.MemberService;
import com.needmall.client.member.vo.JoinVO;
import com.needmall.client.member.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoginService loginService;
	
	
	/********************************************************************
	 * 회원 가입 폼(join_select)
	 ********************************************************************/
	@RequestMapping(value="/join_select.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String joinSelect(Model model) {
		logger.info("join_select.do get 방식에 의한 메서드 호출 성공");
		return "member/join_select";
	}
	
	/********************************************************************
	 * 회원 가입 폼(join_customer)
	 ********************************************************************/
	@RequestMapping(value="/join_customer.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String joinCustomer(Model model) {
		logger.info("join_customer.do get 방식에 의한 메서드 호출 성공");
		return "member/join_customer";
	}
	
	/********************************************************************
	 * 회원 가입 폼(join_seller)
	 ********************************************************************/
	@RequestMapping(value="/join_seller.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String joinSeller(Model model) {
		logger.info("join_seller.do get 방식에 의한 메서드 호출 성공");
		return "member/join_seller";
	}
	
	/********************************************************************
	 * customer 약관 동의 폼(join_customer_agreement)
	 ********************************************************************/
	@RequestMapping(value="/join_customer_agreement.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join_customer_agreement.do],methods=[GET]}"
	public String joinCustomerAgreement(Model model) {
		logger.info("join_customer_agreement.do get 방식에 의한 메서드 호출 성공");
		return "member/join_customer_agreement";
	}
	
	/********************************************************************
	 * seller 약관 동의 폼(join_seller_agreement)
	 ********************************************************************/
	@RequestMapping(value="/join_seller_agreement.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join_customer_agreement.do],methods=[GET]}"
	public String joinSellerAgreement(Model model) {
		logger.info("join_seller_agreement.do get 방식에 의한 메서드 호출 성공");
		return "member/join_seller_agreement";
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
	 * 사업자 번호(st_bnum) 중복 체크 메서드
	 ********************************************************************/
	// ↓ browser가 바로 응답해줄 수 있게 @ResponseBody	// console창에 sever 구동할때 "{[/member/userIdConfirm.do],methods=[POST]}" 뜸
	@ResponseBody
	@RequestMapping(value="/stBnumConfirm.do", method=RequestMethod.POST)
	public String stBnumConfirm(@RequestParam("st_bnum") String st_bnum) {
		
		int result = memberService.stBnumConfirm(st_bnum);
		return result+"";
	}
	
	/********************************************************************
	 * 회원 가입 처리(customer)
	 ********************************************************************/
	/*@RequestMapping(value="/join_customer.do", method = RequestMethod.POST)
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
	}*/
	
	/********************************************************************
	 * 회원 가입 처리(customer)	(AOP)
	 ********************************************************************/
	@RequestMapping(value="/join_customer.do", method = RequestMethod.POST)
	public ModelAndView customerInsert(MemberVO mvo, ModelAndView mav) {
		logger.info("join_customer.do post 방식에 의한 메서드 호출 성공");
		
		memberService.customerInsert(mvo);
		mav.setViewName("client/member/join_success");
		return mav;
	}
	
	/********************************************************************
	 * 회원 가입 처리(seller)	(AOP)
	 ********************************************************************/
	@RequestMapping(value="/join_seller.do", method = RequestMethod.POST)
	public ModelAndView sellerInsert(JoinVO jvo, ModelAndView mav) {	// console창에 sever 구동할때 "{[/member/join.do],methods=[POST]}"
		logger.info("join_seller.do post 방식에 의한 메서드 호출 성공");
		
		jvo.setCs_division(1); 		// cs_division : 1 판매자 확인해보기
		memberService.sellerInsert(jvo);
		mav.setViewName("client/member/join_success");
		return mav;
	}
	

	 /**************************************************************
	  * customer 회원 탈퇴 처리
	  **************************************************************/
	 @RequestMapping("/customerDelete.do") 
	 public ModelAndView memberDelete(HttpSession session){
	 logger.info("customerDelete.do get방식에 의한 메서드 호출 성공");
	  
	 ModelAndView mav=new ModelAndView();
	 LoginVO login =(LoginVO)session.getAttribute("login");
	  
	 if(login==null){
	 mav.setViewName("member/login"); 
	 return mav;
	 }
	  
	 memberService.customerDelete(login.getC_id());
	 mav.setViewName("redirect:/member/logout.do");	//logout 으로 굳이 넘길 필요가 있나..?
	 return mav; 									//넘겨야지..탈퇴하면 로그아웃 돼야지
	}
	 
	 /**************************************************************
	  * seller 회원 탈퇴 처리
	  **************************************************************/
	 @RequestMapping("/sellerDelete.do") 
	 public ModelAndView sellerDelete(HttpSession session){
	 logger.info("sellerDelete.do get방식에 의한 메서드 호출 성공");
	  
	 ModelAndView mav=new ModelAndView();
	 LoginVO login =(LoginVO)session.getAttribute("login");
	  
	 if(login==null){
	 mav.setViewName("member/login"); 
	 return mav;
	 }
	 logger.info("control단 login : " + login);
	 logger.info("control단 sellerDelete s_num : "+login.getS_num());
	 //mvo.setS_num(login.getS_num());
	 memberService.reqStoreDelete(login.getS_num());
	 memberService.sellerDelete(login.getS_id());
	 mav.setViewName("redirect:/member/logout.do");	//logout 으로 굳이 넘길 필요가 있나..?
	 return mav; 									//넘겨야지..탈퇴하면 로그아웃 돼야지
	}
	 
	 /**************************************************************
	  * customer 수정 폼
	  **************************************************************/
	 @RequestMapping(value="/join_customer_modify.do", method = RequestMethod.GET) 
	 public ModelAndView customerModify(HttpSession session){
		 logger.info("join_customer_modify.do(수정폼) get 방식에 의한 메서드 호출 성공");
		 ModelAndView mav=new ModelAndView();
		 // session 객체에서 로그인 정보 얻기 
		 LoginVO login =(LoginVO)session.getAttribute("login");

		 // 추후 아래 부분에 대한 제어는 한곳에서 설정되도록 변경해 주면 된다 
		 // 혹 로그인되어 있지 않으면 로그인 화면으로 이동.
		 if(login==null){
			 mav.setViewName("member/login"); 
			 return mav;
		 }
		 // 세션에서 로그인 정보 중 아이디만 가지고 해당 아이디에 대한 상세내역  DB에서 조회
		 MemberVO vo = memberService.customerSelect(login.getC_id());
		 mav.addObject("member", vo);
		 mav.setViewName("member/join_customer_modify"); 
		 return mav;
	 } 
	 
	 /**************************************************************
	  * customer 수정 처리(AOP 예외 처리 후)
	  **************************************************************/
	 @RequestMapping(value="/join_customer_modify.do", method = RequestMethod.POST) 
	 public ModelAndView customerModifyProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		 logger.info("join_customer_modify.do post 방식에 의한 메서드 호출 성공");

		 LoginVO login =(LoginVO)session.getAttribute("login");

		 if(login==null){
			 mav.setViewName("member/login"); 
			 return mav;
		 }
		 // 세션으로 얻은 로그인 정보를 가지고 다시 회원테이블에 존재하는 확인
		 mvo.setC_id(login.getC_id());
		 MemberVO vo = memberService.customerSelect(mvo.getC_id());
		 // 기존 비빌번호로 회원정보를 확인하여 일치하면 수정 가능하도록 확인 작업
		 if (loginService.customerLoginSelect(mvo.getC_id(), mvo.getC_opwd()) == null ) {
			 mav.addObject("status", 1);
			 mav.addObject("member",vo);
			 mav.setViewName("member/join_customer_modify");
			 return mav;
		 } 

		 memberService.customerUpdate(mvo);
		 mav.setViewName("redirect:/member/logout.do");
		 return mav;  
	 }
	 
	 /**************************************************************
	  * seller 수정 폼
	  **************************************************************/
	 @RequestMapping(value="/join_seller_modify.do", method = RequestMethod.GET) 
	 public ModelAndView sellerModify(HttpSession session){
		 logger.info("join_seller_modify.do(수정폼) get 방식에 의한 메서드 호출 성공");
		 ModelAndView mav=new ModelAndView();
		 // session 객체에서 로그인 정보 얻기 
		 LoginVO login =(LoginVO)session.getAttribute("login");

		 // 추후 아래 부분에 대한 제어는 한곳에서 설정되도록 변경해 주면 된다 
		 // 혹 로그인되어 있지 않으면 로그인 화면으로 이동.
		 if(login==null){
			 mav.setViewName("member/login"); 
			 return mav;
		 }
		 // 세션에서 로그인 정보 중 아이디만 가지고 해당 아이디에 대한 상세내역  DB에서 조회
		 MemberVO vo = memberService.sellerSelect(login.getS_id());
		 mav.addObject("member", vo);
		 mav.setViewName("member/join_seller_modify"); 
		 return mav;
	 } 
	 
	 /**************************************************************
	  * seller 수정 처리(AOP 예외 처리 후)
	  **************************************************************/
	 @RequestMapping(value="/join_seller_modify.do", method = RequestMethod.POST) 
	 public ModelAndView sellerModifyProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		 logger.info("join_seller_modify.do post 방식에 의한 메서드 호출 성공");

		 LoginVO login =(LoginVO)session.getAttribute("login");

		 if(login==null){
			 mav.setViewName("member/login"); 
			 return mav;
		 }
		 // 세션으로 얻은 로그인 정보를 가지고 다시 회원테이블에 존재하는 확인
		 mvo.setS_id(login.getS_id());
		 MemberVO vo = memberService.sellerSelect(mvo.getS_id());
		 // 기존 비빌번호로 회원정보를 확인하여 일치하면 수정 가능하도록 확인 작업
		 if (loginService.sellerLoginSelect(mvo.getS_id(), mvo.getS_opwd()) == null ) {
			 mav.addObject("status", 1);
			 mav.addObject("member",vo);
			 mav.setViewName("member/join_seller_modify");
			 return mav;
		 } 

		 memberService.sellerUpdate(mvo);
		 mav.setViewName("redirect:/member/logout.do");
		 return mav;  
	 }
	
}
