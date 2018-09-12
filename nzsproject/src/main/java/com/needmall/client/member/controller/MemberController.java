package com.needmall.client.member.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.needmall.common.email.service.EmailService;
import com.needmall.common.email.vo.EmailVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private EmailService emailService;
	


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
	 * customer 정보 수정 폼
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
	 * customer 비밀번호 수정 폼
	 **************************************************************/
	@RequestMapping(value="/customerModifyPwd.do", method = RequestMethod.GET) 
	public ModelAndView customerModifyPwd(HttpSession session){
		logger.info("customerModifyPwd.do(비밀번호 수정폼) get 방식에 의한 메서드 호출 성공");
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
		mav.setViewName("member/customerModifyPwd"); 
		return mav;
	}

	/**************************************************************
	 * customer 정보 수정 처리(AOP 예외 처리 후)
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
		mav.setViewName("redirect:/");
		return mav;  
	}
	
	/**************************************************************
	 * customer 비밀번호 수정 처리(AOP 예외 처리 후)
	 **************************************************************/
	@RequestMapping(value="/customerModifyPwd.do", method = RequestMethod.POST) 
	public ModelAndView customerModifyPwd(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("customerModifyPwd.do post 방식에 의한 메서드 호출 성공");

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
			mav.setViewName("member/customerModifyPwd");
			return mav;
		} 

		memberService.customerPwdUpdate(mvo);
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
	 * seller 비밀번호 수정 폼
	 **************************************************************/
	@RequestMapping(value="/sellerModifyPwd.do", method = RequestMethod.GET) 
	public ModelAndView sellerModifyPwd(HttpSession session){
		logger.info("sellerModifyPwd.do(비밀번호 수정폼) get 방식에 의한 메서드 호출 성공");
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
		mav.setViewName("member/sellerModifyPwd"); 
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
		mav.setViewName("redirect:/");
		return mav;  
	}
	
	/**************************************************************
	 * seller 비밀번호 수정 처리(AOP 예외 처리 후)
	 **************************************************************/
	@RequestMapping(value="/sellerModifyPwd.do", method = RequestMethod.POST) 
	public ModelAndView sellerModifyPwd(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("sellerModifyPwd.do post 방식에 의한 메서드 호출 성공");

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
			mav.setViewName("member/sellerModifyPwd");
			return mav;
		} 

		memberService.sellerPwdUpdate(mvo);
		mav.setViewName("redirect:/member/logout.do");
		return mav;  
	}

	/**************************************************************
	 * customer 수정시 비밀번호 확인 폼
	 **************************************************************/
	@RequestMapping(value="/modify_customer_check.do", method = RequestMethod.GET) 
	public ModelAndView modifyCustomerCheck(HttpSession session){
		logger.info("modify_customer_check.do(수정폼) get 방식에 의한 메서드 호출 성공");
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
		mav.setViewName("member/modify_customer_check"); 
		return mav;
	} 

	/**************************************************************
	 * customer 수정 비밀번호 확인 처리(AOP 예외 처리 후)
	 **************************************************************/
	@RequestMapping(value="/modify_customer_check.do", method = RequestMethod.POST) 
	public ModelAndView modifyCustomerCheckProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("modify_customer_check.do post 방식에 의한 메서드 호출 성공");

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
			mav.setViewName("member/modify_customer_check");
			return mav;
		} 

		//memberService.customerUpdate(mvo);
		mav.setViewName("redirect:/member/join_customer_modify.do");
		return mav;  
	}

	/**************************************************************
	 * seller 수정시 비밀번호 확인 폼
	 **************************************************************/
	@RequestMapping(value="/modify_seller_check.do", method = RequestMethod.GET) 
	public ModelAndView modifySellerCheck(HttpSession session){
		logger.info("modify_seller_check.do(수정폼) get 방식에 의한 메서드 호출 성공");
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
		mav.setViewName("member/modify_seller_check"); 
		return mav;
	} 

	/**************************************************************
	 * seller 수정 비밀번호 확인 처리(AOP 예외 처리 후)
	 **************************************************************/
	@RequestMapping(value="/modify_seller_check.do", method = RequestMethod.POST) 
	public ModelAndView modifySellerCheckProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("modify_seller_check.do post 방식에 의한 메서드 호출 성공");

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
			mav.setViewName("member/modify_seller_check");
			return mav;
		} 

		//memberService.sellerUpdate(mvo);
		mav.setViewName("redirect:/member/join_seller_modify.do");
		return mav;  
	}
	
	/**************************************************************
	 * customer 탈퇴시 비밀번호 확인 폼
	 **************************************************************/
	@RequestMapping(value="/delete_customer_check.do", method = RequestMethod.GET) 
	public ModelAndView deleteCustomerCheck(HttpSession session){
		logger.info("delete_customer_check.do(탈퇴시 비밀번호 확인폼) get 방식에 의한 메서드 호출 성공");
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
		mav.setViewName("member/delete_customer_check"); 
		return mav;
	} 

	/**************************************************************
	 * customer 탈퇴 비밀번호 확인 처리(AOP 예외 처리 후)
	 **************************************************************/
	@RequestMapping(value="/delete_customer_check.do", method = RequestMethod.POST) 
	public ModelAndView deleteCustomerCheckProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("delete_customer_check.do post 방식에 의한 메서드 호출 성공");

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
			mav.setViewName("member/delete_customer_check");
			return mav;
		} 

		//memberService.customerUpdate(mvo);
		mav.setViewName("redirect:/member/customerDelete.do");
		return mav;  
	}

	/**************************************************************
	 * seller 탈퇴시 비밀번호 확인 폼
	 **************************************************************/
	@RequestMapping(value="/delete_seller_check.do", method = RequestMethod.GET) 
	public ModelAndView deleteSellerCheck(HttpSession session){
		logger.info("delete_seller_check.do(수정폼) get 방식에 의한 메서드 호출 성공");
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
		mav.setViewName("member/delete_seller_check"); 
		return mav;
	} 

	/**************************************************************
	 * seller 탈퇴 비밀번호 확인 처리(AOP 예외 처리 후)
	 **************************************************************/
	@RequestMapping(value="/delete_seller_check.do", method = RequestMethod.POST) 
	public ModelAndView deleteSellerCheckProcess(MemberVO mvo, HttpSession session, ModelAndView mav){
		logger.info("delete_seller_check.do post 방식에 의한 메서드 호출 성공");

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
			mav.setViewName("member/delete_seller_check");
			return mav;
		} 

		//memberService.sellerUpdate(mvo);
		mav.setViewName("redirect:/member/sellerDelete.do");
		return mav;  
	}
	

	/********************************************************************
	 * id 찾기 선택 폼(idIden)
	 ********************************************************************/
	@RequestMapping(value="/idIdenSelect.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String idIdenSelect(Model model) {
		logger.info("idIdenSelect.do get 방식에 의한 메서드 호출 성공");
		return "member/idIdenSelect";
	}

	/********************************************************************
	 * customer id 찾기 폼(idIden)
	 ********************************************************************/
	@RequestMapping(value="/customerIdIden.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String customerIdIden(Model model) {
		logger.info("customerIdIden.do get 방식에 의한 메서드 호출 성공");
		return "member/customerIdIden";
	}

	/**************************************************************
	 * customer id 찾기
	 *************************************************************/
	@RequestMapping(value="/customerIdIden.do", method = RequestMethod.POST)
	public ModelAndView customerIdIdenProcess(@ModelAttribute LoginVO lvo, @RequestParam("c_name") String c_name, @RequestParam("c_mail") String c_mail, ModelAndView mav) {
		logger.info("customerIdIdenProcess 메서드 호출 성공");
		logger.info("전 mav : " + mav);

		String idCheck = memberService.customerIdIden(c_name, c_mail);

		if(idCheck == null) {
			logger.info("id가 존재하지 않아요!");
			mav.addObject("status", 1);
			mav.setViewName("member/customerIdIden");
			logger.info("mav : " + mav);
			return mav;
		} else {
			mav.addObject("c_id", memberService.customerIdIden(c_name, c_mail));
			mav.addObject("c_name", c_name);

			mav.setViewName("member/idIdenSuccess");
			logger.info("memberService.customerIdIden : "+memberService.customerIdIden(c_name, c_mail));

			lvo.setC_id(memberService.customerIdIden(c_name, c_mail));
			logger.info("lvo.getC_id() : "+lvo.getC_id());
			logger.info("후 mav : " + mav);
			return mav;
		}

	}


	/********************************************************************
	 * seller id 찾기 폼(idIden)
	 ********************************************************************/
	@RequestMapping(value="/sellerIdIden.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String sellerIdIden(Model model) {
		logger.info("sellerIdIden.do get 방식에 의한 메서드 호출 성공");
		return "member/sellerIdIden";
	}

	/**************************************************************
	 * seller id 찾기
	 *************************************************************/
	@RequestMapping(value="/sellerIdIden.do", method = RequestMethod.POST)
	public ModelAndView sellerIdIdenProcess(@ModelAttribute LoginVO lvo, @RequestParam("s_name") String s_name, @RequestParam("s_mail") String s_mail, ModelAndView mav) {
		logger.info("sellerIdIdenProcess 메서드 호출 성공");
		logger.info("전 mav : " + mav);

		String idCheck = memberService.sellerIdIden(s_name, s_mail);

		if(idCheck == null) {
			logger.info("id가 존재하지 않아요!");
			mav.addObject("status", 1);
			mav.setViewName("member/sellerIdIden");
			logger.info("mav : " + mav);
			return mav;
		} else {
			mav.addObject("s_id", memberService.sellerIdIden(s_name, s_mail));
			mav.addObject("s_name", s_name);

			mav.setViewName("member/idIdenSuccess");
			logger.info("memberService.sellerIdIden : "+memberService.sellerIdIden(s_name, s_mail));

			lvo.setS_id(memberService.sellerIdIden(s_name, s_mail));
			logger.info("lvo.getS_id() : "+lvo.getS_id());
			logger.info("후 mav : " + mav);
			return mav;
		}

	}

	/********************************************************************
	 * pwd 찾기 선택 폼
	 ********************************************************************/
	@RequestMapping(value="/pwdIdenSelect.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String pwdIdenSelect(Model model) {
		logger.info("pwdIdenSelect.do get 방식에 의한 메서드 호출 성공");
		return "member/pwdIdenSelect";
	}
	
	/********************************************************************
	 * customer pwd 찾기 폼
	 ********************************************************************/
	@RequestMapping(value="/customerPwdIden.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String customerPwdIden(Model model) {
		logger.info("customerPwdIden.do get 방식에 의한 메서드 호출 성공");
		return "member/customerPwdIden";
	}

	/**************************************************************
	 * customer pwd 찾기
	 *************************************************************/
	@RequestMapping(value="/customerPwdIden.do", method = RequestMethod.POST)
	public ModelAndView customerPwdIdenProcess(@ModelAttribute MemberVO mvo, @RequestParam("c_id") String c_id, @RequestParam("c_mail") String c_mail, @RequestParam("c_pwd") String c_pwd, ModelAndView mav) {
		logger.info("customerPwdIdenProcess 메서드 호출 성공");
		logger.info("전 mav : " + mav);
		logger.info("c_pwd : "+c_pwd);
		
		// customerPwdIden : c_id, c_mail 로 일치 정보 있는지 확인
		String pwdCheck = memberService.customerPwdSelect(c_id, c_mail);

		if(pwdCheck == null) {
			logger.info("pwd가 존재하지 않아요!");
			logger.info(pwdCheck);
			mav.addObject("status", 1);
			mav.setViewName("member/customerPwdIden");
			logger.info("mav : " + mav);
			return mav;
		} else {
			logger.info(pwdCheck);
			//mav.addObject("c_id", memberService.customerPwdIden(c_name, c_mail));
			mav.addObject("c_id", c_id);
			mav.addObject("c_mail", c_mail);
			mav.addObject("c_pwd", c_pwd);
			
			mvo.setC_pwd(c_pwd);
			mvo.setC_id(c_id);
			mvo.setC_mail(c_mail);
			
			EmailVO evo = new EmailVO();
			evo.setTo(c_mail);
			evo.setSubject("[NeedMall] 비밀번호 찾기 입니다.");
			evo.setText("변경된 비밀번호는 " + c_pwd + "입니다.\n반드시 비밀번호를 재설정해주세요!");
			emailService.sendMimeMail(evo); //email 보내기
			
			memberService.customerPwdFindUpdate(mvo);
			logger.info("memberService.customerPwdIden : "+memberService.customerPwdSelect(c_id, c_mail));

			mav.setViewName("member/pwdIdenSuccess");

			// lvo.setC_id(memberService.customerPwdIden(c_id, c_mail));
			//logger.info("lvo.getC_pwd() : "+lvo.getC_pwd());
			logger.info("후 mav : " + mav);
			logger.info("c_pwd : "+c_pwd);
			return mav;
		}

	}


	/********************************************************************
	 * seller pwd 찾기 폼
	 ********************************************************************/
	@RequestMapping(value="/sellerPwdIden.do", method = RequestMethod.GET)	// console창에 sever 구동할때 "{[/member/join.do],methods=[GET]}"
	public String sellerPwdIden(Model model) {
		logger.info("sellerPwdIden.do get 방식에 의한 메서드 호출 성공");
		return "member/sellerPwdIden";
	}

	/**************************************************************
	 * seller pwd 찾기
	 *************************************************************/
	@RequestMapping(value="/sellerPwdIden.do", method = RequestMethod.POST)
	public ModelAndView sellerPwdIdenProcess(@ModelAttribute MemberVO mvo, @RequestParam("s_id") String s_id, @RequestParam("s_mail") String s_mail, @RequestParam("s_pwd") String s_pwd, ModelAndView mav) {
		logger.info("sellerPwdIdenProcess 메서드 호출 성공");
		logger.info("전 mav : " + mav);
		logger.info("s_pwd : "+s_pwd);
		
		// sellerPwdIden : s_id, s_mail 로 일치 정보 있는지 확인
		String pwdCheck = memberService.sellerPwdSelect(s_id, s_mail);

		if(pwdCheck == null) {
			logger.info("pwd가 존재하지 않아요!");
			logger.info(pwdCheck);
			mav.addObject("status", 1);
			mav.setViewName("member/sellerPwdIden");
			logger.info("mav : " + mav);
			return mav;
		} else {
			logger.info(pwdCheck);
			//mav.addObject("s_id", memberService.sellerPwdIden(s_name, s_mail));
			mav.addObject("s_id", s_id);
			mav.addObject("s_mail", s_mail);
			mav.addObject("s_pwd", s_pwd);
			
			mvo.setS_pwd(s_pwd);
			mvo.setS_id(s_id);
			mvo.setS_mail(s_mail);
			
			EmailVO evo = new EmailVO();
			evo.setTo(s_mail);
			evo.setSubject("[NeedMall] 비밀번호 찾기 입니다.");
			evo.setText("변경된 비밀번호는 " + s_pwd + "입니다.\n반드시 비밀번호를 재설정해주세요!");
			emailService.sendMimeMail(evo); //email 보내기
			
			memberService.sellerPwdFindUpdate(mvo);
			logger.info("memberService.sellerPwdIden : "+memberService.sellerPwdSelect(s_id, s_mail));

			mav.setViewName("member/pwdIdenSuccess");

			// lvo.sets_id(memberService.sellerPwdIden(s_id, s_mail));
			//logger.info("lvo.gets_pwd() : "+lvo.gets_pwd());
			logger.info("후 mav : " + mav);
			logger.info("s_pwd : "+s_pwd);
			return mav;
		}

	}


	/********************************************************************
	 * customer email 인증 메서드
	 ********************************************************************/
	// ↓ browser가 바로 응답해줄 수 있게 @ResponseBody	// console창에 sever 구동할때 "{[/member/userIdConfirm.do],methods=[POST]}" 뜸
	@ResponseBody
	@RequestMapping(value="/customerEmailConfirm.do", method=RequestMethod.POST)
	public String customerEmailConfirm(@RequestParam("emailConfirm") String emailConfirm, @RequestParam("c_mail") String c_mail) {
		EmailVO evo = new EmailVO();
		evo.setTo(c_mail);
		evo.setSubject("[NeedMall] 이메일 인증 입니다.");
		evo.setText("인증번호는 " + emailConfirm + "입니다.");
		logger.info("evo : " + evo);
		String emailIden = emailService.sendMimeMail(evo); //email 보내기
		//int result = memberService.customerEmailConfirm(emailConfirm);
		logger.info(emailIden);
		return emailIden;
	}

	/********************************************************************
	 * seller email 인증 메서드
	 ********************************************************************/
	// ↓ browser가 바로 응답해줄 수 있게 @ResponseBody	// console창에 sever 구동할때 "{[/member/userIdConfirm.do],methods=[POST]}" 뜸
	@ResponseBody
	@RequestMapping(value="/sellerEmailConfirm.do", method=RequestMethod.POST)
	public String sellerEmailConfirm(@RequestParam("emailConfirm") String emailConfirm, @RequestParam("s_mail") String s_mail) {
		EmailVO evo = new EmailVO();
		evo.setTo(s_mail);
		evo.setSubject("[NeedMall] 이메일 인증 입니다.");
		evo.setText("인증번호는 " + emailConfirm + "입니다.");
		logger.info("evo : " + evo);
		String emailIden = emailService.sendMimeMail(evo); //email 보내기
		//int result = memberService.sellerEmailConfirm(emailConfirm);
		logger.info(emailIden);
		return emailIden;
	}

}
