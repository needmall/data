package com.needmall.client.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.needmall.client.login.service.LoginService;
import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.service.MemberService;
import com.needmall.client.member.vo.MemberVO;


@Controller
@SessionAttributes("login")
@RequestMapping("/member")
public class LoginController {
	Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MemberService memberService;
	

	@ModelAttribute("login")
	public LoginVO login() {
		return new LoginVO();
	}

	/**************************************************************
	 * 로그인 폼 처리
	 **************************************************************/
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String loginForm() {  
		logger.info("login.do get 호출 성공");
		return "member/login";
	}

	/**************************************************************
	 * customer 로그인 처리
	 * 참고 : 로그인 실패시 횟수 제한을 제어하지 않은 처리
	 *************************************************************/
		@RequestMapping(value="/login.do", method = RequestMethod.POST)
		public ModelAndView customerLoginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav) {
			//MemberVO mvo = new MemberVO();
			int cs_count = memberService.csCount(lvo);
			
			if(cs_count == 0) {	// customer
				logger.info("customer : "+cs_count);
				logger.info("customerLoginInsert.do post 호출 성공");
				
				String c_id = lvo.getC_id();
				String c_pwd = lvo.getC_pwd();
				LoginVO loginCheckResult = loginService.customerLoginSelect(c_id, c_pwd);
				logger.info("customerLoginSelect : " +loginCheckResult);
				
				// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
				if(loginCheckResult == null){
					logger.info("customer loginCheckResult 존재하지 않아요!!");
					mav.addObject("status", 1); 
					mav.setViewName("member/login");
					logger.info("customer id,pwd 불일치 : "+mav);
					return mav; 
				}else { // 일치하면
					logger.info("customer loginCheckResult 존재하오!!");
					mav.addObject("login", loginCheckResult);
					//mav.setViewName("member/login");
					mav.setViewName("redirect:/");
					//★★★ loginCheck Table 채울거
					return mav;
				}  
			} else if(cs_count == 1) {	// seller
				logger.info("seller : "+cs_count);
				logger.info("sellerLoginInsert.do post 호출 성공");

				String s_id = lvo.getS_id();
				String s_pwd = lvo.getS_pwd();
				LoginVO loginCheckResult = loginService.sellerLoginSelect(s_id, s_pwd);
				logger.info("sellerLoginSelect : " + loginCheckResult);
				
				// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
				if(loginCheckResult == null){
					logger.info("seller loginCheckResult 존재하지 않아요!!");
					mav.addObject("status", 1); 
					mav.setViewName("member/login");  
					logger.info("seller id,pwd 불일치 : " + mav);
					return mav; 
				}else { // 일치하면
					logger.info("seller loginCheckResult 존재하오!!");
					mav.addObject("login", loginCheckResult);
					//mav.setViewName("member/login");
					mav.setViewName("redirect:/");
					//★★★ loginCheck Table 채울거
					return mav;
				}
			} else {	// 존재하지 않는 아이디
				logger.info("존재하지 않는걸");
				mav.addObject("status", 1);
				mav.setViewName("member/login");
				logger.info(cs_count);
				logger.info("존재하지 않는 아이디 : " + mav);
				return mav;
			}
			
			
			/*if(lvo.getCs_division()==0) {
				logger.info(mvo.getCs_division());
				logger.info("customerLoginInsert.do post 호출 성공");
				
				
				String c_id = lvo.getC_id();
				String c_pwd = lvo.getC_pwd();
				LoginVO loginCheckResult = loginService.customerLoginSelect(c_id, c_pwd);
				
				// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
				if(loginCheckResult == null){
					mav.addObject("status", 1); 
					mav.setViewName("member/login");   
					return mav; 
				}else { // 일치하면
					mav.addObject("login", loginCheckResult);
					mav.setViewName("member/login");
					//★★★ loginCheck Table 채울거
					return mav;
				}  
			} else {
				logger.info(mvo.getCs_division());
				logger.info("sellerLoginInsert.do post 호출 성공");

				String s_id = lvo.getS_id();
				String s_pwd = lvo.getS_pwd();
				LoginVO loginCheckResult = loginService.sellerLoginSelect(s_id, s_pwd);

				// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
				if(loginCheckResult == null){
					mav.addObject("status", 1); 
					mav.setViewName("member/login");   
					return mav; 
				}else { // 일치하면
					mav.addObject("login", loginCheckResult);
					mav.setViewName("member/login");
					//★★★ loginCheck Table 채울거
					return mav;
				}  
			}*/
			
		} 

	/**************************************************************
	 * 로그인 처리 메서드
	 * 참고 : 로그인 실패시 처리 내용 포함.
	 **************************************************************/
	/*@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav, HttpServletRequest request) {
		logger.info("login.do post 호출 성공");

		String userId = lvo.getC_id();
		int resultData = loginService.loginHistoryInsert(lvo);

		// 우선 아이디가 존재하는지 먼저 확인 작업 진행(1: 존재하지 않을 때)
		if(resultData==1){ 
			mav.addObject("status", 1);
			mav.setViewName("member/login"); 
			return mav; 
		} else { 
			LoginVO vo = loginService.loginHistorySelect(userId);
			logger.info("최근 로그인 일시 : " + new SimpleDateFormat("YYYY-MM-dd").format(vo.getLastSuccessedLogin()));
			logger.info("retry(로그인 시도 횟수): "+vo.getRetry());

			// 로그인 시도횟수가 5회가 넘으면 30초간 로그인 잠금 
			if(vo.getRetry() >= 5 ) {
				if (new Date().getTime() - vo.getLastFailedLogin() < 30000) {
					mav.addObject("status", 6);   // 30초동안 로그인잠금 알림
					mav.setViewName("member/login"); 
					return mav; 
				} else {
					vo.setRetry(0);
					vo.setLastFailedLogin(0);
					loginService.loginHistoryUpdate(vo);
				}
			}

			LoginVO loginCheckResult = loginService.loginSelect(lvo.getUserId(), lvo.getUserPw());

			// 로그인이 틀리면, 로그인 시도횟수를 1증가 시키고, 로그인 실패 시간을 DB에 업데이트 한다.  
			if(loginCheckResult == null){
				vo.setRetry(vo.getRetry()+1);
				vo.setLastFailedLogin(new Date().getTime());
				loginService.loginHistoryUpdate(vo);

				mav.addObject("retry",vo.getRetry());
				mav.addObject("status", 1);
				mav.setViewName("member/login");   
				return mav; 
			}
			// 로그인이 성공하면, 로그인 시도횟수를 0로 reset, 마지막으로 로그인 실패 시간 0으로 reset, 
			// 성공한 클라이언트 IP를 DB에 업데이트,로그인 성공시간 DB에 업데이트  
			else {
				vo.setRetry(0);
				vo.setLastFailedLogin(0);
				vo.setLastSuccessedLogin(new Date().getTime());
				vo.setClientIP(request.getRemoteAddr());
				loginService.loginHistoryUpdate(vo);

				//session.setAttribute("login", loginCheckResult);
				mav.addObject("login", loginCheckResult);
				mav.setViewName("member/login");
				return mav;
			}
		} 
	}
*/
		
		/**************************************************************
		 * seller 로그인 처리
		 * 참고 : 로그인 실패시 횟수 제한을 제어하지 않은 처리
		 *************************************************************/
		/*@RequestMapping(value="/login.do", method = RequestMethod.POST)
		public ModelAndView sellerLoginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav) {
			logger.info("sellerLoginInsert.do post 호출 성공");

			String s_id = lvo.getS_id();
			String s_pwd = lvo.getS_pwd();
			LoginVO loginCheckResult = loginService.sellerLoginSelect(s_id, s_pwd);

			// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
			if(loginCheckResult == null){
				mav.addObject("status", 1); 
				mav.setViewName("member/login");   
				return mav; 
			}else { // 일치하면
				mav.addObject("login", loginCheckResult);
				mav.setViewName("member/login");
				//★★★ loginCheck Table 채울거
				return mav;
			}  
		} */
	
		
	/**************************************************************
	 * 로그아웃 처리 메서드
	 **************************************************************/
	@RequestMapping("/logout.do")
	public String logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
		return "redirect:/";
	}
}