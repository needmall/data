package com.needmall.client.mypage.controller;



import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.client.login.vo.LoginVO;
import com.needmall.client.member.service.MemberService;
import com.needmall.client.member.vo.MemberVO;
import com.needmall.client.mypage.service.MypageService;
import com.needmall.client.mypage.vo.MycartVO;
import com.needmall.client.productdetail.vo.PreviewVO;
import com.needmall.client.productdetail.vo.SreviewVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	Logger logger = Logger.getLogger(MypageController.class);

	@Autowired
	private MypageService mypageService;
//	/mypage/mycartList.do
	
	@RequestMapping("/mypageList.do")
	 public String mypageList(@RequestParam("t") int t, MycartVO mvo,Model model,HttpSession session) {
	  logger.info("mypageList 호 출");
	  LoginVO login = (LoginVO)session.getAttribute("login");
	  if(login==null) {
		  return "redirect:/member/login.do";
	  }
	  if(!login.getC_id().isEmpty()) {

	  mvo.setC_num(login.getC_num());
	  List<MycartVO> list = mypageService.mycartList(mvo);
	  logger.info(list.size());
	  if(list.size()>0) {
//	    logger.info("당황스럽네요 왜 안나오죠?"+list.size());
	  Date date =list.get(0).getCart1_date();
	  model.addAttribute("date",date);
	  }

	  model.addAttribute("t",t);
	  model.addAttribute("login",login);
	  model.addAttribute("cartList",list);
	  
	  }else {
	   return "redirect:/member/login.do";
	  }
	  
	  return "mypage/mypage";
	 }

	
	@ResponseBody
	@RequestMapping("/mybuyList.do")
	public String buyList(MycartVO mvo,ObjectMapper mapper,HttpSession session) {
		String value =""; 
		logger.info("mybuyList 호 출");
		LoginVO login = (LoginVO)session.getAttribute("login");
		if(login!=null) {
			mvo.setC_num(login.getC_num());
		}else {
			mvo.setC_num(0);//에러 띄어서 로그인 페이지로 보내야함;
		}
		List<MycartVO> buylist = mypageService.buyList(mvo);
		try {
			value= mapper.writeValueAsString(buylist);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	@ResponseBody
	@RequestMapping(value="/receiptList.do")
	public String receiptList(MycartVO mvo, ObjectMapper mapper) {
		String value = "";
		MycartVO list = mypageService.receiptList(mvo);
		try {
			value = mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
		
	}
	
	
	@ResponseBody
	@RequestMapping("/pageList.do")//페이징 전체
	public int pageList(MycartVO mvo,HttpSession session) {
		logger.info("pageList 호 출");
//		LoginVO login = (LoginVO)session.getAttribute("login");
////		mvo.setC_num(login.getC_num());
		int a = mypageService.pageList(mvo);
		logger.info("pageList = "+a);
		return a;
		
	}
	

	
	/////////////////////////////////////////////////////////////장바구니 로직
//	@RequestMapping(value="/mycartList.do")
//	public String mycartList(MycartVO mvo ,Model model) {
//		logger.info("mycartList 호 출");
//		//		mvo.setC_num(2); // 나중에 세션 값 받아서 넘겨야함
////		List<MycartVO> list = mypageService.mycartList(mvo);
////		Date date =list.get(1).getCart1_date();
////		model.addAttribute("cartList",list);
////		model.addAttribute("date",date);
//		
//		return "mypage/mycart";
//		
//	}
	


	@ResponseBody
	@RequestMapping(value="/countUpdate.do")
	public String countUpdate(MycartVO mvo) {
		logger.info("countUpdate 호 출");
		String value="";
		value = mypageService.countUpdate(mvo);
		
		return value;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/itemdelete.do")
	public String itemDelete(MycartVO mvo) {
		logger.info("itemdelete 호 출");
		String value="";
		value = mypageService.itemDelete(mvo);
		
		return value;
		
	}
	
	//장바구니에서 구매------------------------------------------>aop 걸어야함

	@RequestMapping(value="/mycartBuy.do")
	public String mycartBuy(MycartVO mvo) {
		logger.info("mycartBuy 호 출");
		mypageService.mycartBuy(mvo);
		return "mypage/mybuy";
		
	}
	
	@ResponseBody //장바구니 수정일 바꾸기
	@RequestMapping(value="/dateCountUpdate.do")
	public void dateCountUpdate(MycartVO mvo) {
		logger.info("mycartBuy 호 출");
		mypageService.dateCountUpdate(mvo);
	}
	/////////////////////////////////////////////////////////////장바구니 로직끝
	
	@RequestMapping(value="/productBuy")
	public String productBuy(MycartVO mvo, Model model) {
		logger.info("productBuy 호 출");
		String result = mypageService.productBuy(mvo);
		logger.info("productBuy = "+result );
		return "mypage/mybuy";
		
	}
	
	
	@RequestMapping(value="/mybuy.do")
	public String mybuy(MycartVO mvo, Model model ) {
		logger.info("mybuy 호 출");
		return "mypage/mybuy";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/cartConfirmList.do")
	public int cartConfirmList(MycartVO mvo) {
		int result =mypageService.cartConfirmList(mvo);
		return result;
		
	}
	

	@ResponseBody
	@RequestMapping(value="/cartConfirmUpdate.do")
	public int cartConfirmUpdate(MycartVO mvo) {
		int result =mypageService.cartConfirmUpdate(mvo);
		return result;
		
	}
	////////////댓글 
	
	//상품 리뷰 불러오기
	@ResponseBody
	@RequestMapping(value="/myProductRList.do")
	public String myProductReview(PreviewVO pvo,ObjectMapper mapper,HttpSession session) {
		String value = "";
		LoginVO login = (LoginVO)session.getAttribute("login");
		pvo.setC_num(login.getC_num());
		List<PreviewVO> list =mypageService.myProductRList(pvo);
		try {
			value=mapper.writeValueAsString(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	//삽입 상품 리뷰
	@ResponseBody
	@RequestMapping(value="/myProductRInsert.do")
	public int myProductRInsert(PreviewVO pvo, HttpServletRequest request, Model model) {
		logger.info("myProductRInsert 호출");
		int result = 0;
		result = mypageService.myProductRInsert(pvo,request);
		return result;
		
	}
	
	//삽입 서비스 리뷰
	@ResponseBody
	@RequestMapping(value="/mySellerInsert.do")
	public int mySellerInsert(SreviewVO svo, HttpServletRequest request, Model model) {
		logger.info("myProductRInsert 호출");
		int result = 0;
		result = mypageService.mySellerInsert(svo,request);
		return result;
		
	}
	
	///판매점 리뷰
	@ResponseBody
	@RequestMapping(value="/mySellerRList.do")
	public String mySellerRList(SreviewVO svo,ObjectMapper mapper,HttpSession session) {
		String value = "";
		LoginVO login = (LoginVO)session.getAttribute("login");
		svo.setC_num(login.getC_num());
		List<SreviewVO> list =mypageService.mySellerRList(svo);
		try {
			value=mapper.writeValueAsString(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	@ResponseBody
	@RequestMapping(value="/mySellerRselectList.do", method=RequestMethod.GET)
	public String mySellerRselectList(SreviewVO svo,HttpSession session,ObjectMapper mapper) {
		String value = "";
		LoginVO login = (LoginVO)session.getAttribute("login");
		svo.setC_num(login.getC_num());
		SreviewVO list =mypageService.mySellerRselectList(svo);
		try {
			value=mapper.writeValueAsString(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return value;
		
	}
	@ResponseBody
	@RequestMapping(value="/myProductRselectList.do", method=RequestMethod.GET)
	public String myProductRselectList(PreviewVO pvo,HttpSession session,ObjectMapper mapper) {
		String value = "";
		LoginVO login = (LoginVO)session.getAttribute("login");
		pvo.setC_num(login.getC_num());
		PreviewVO list =mypageService.myProductRselectList(pvo);
		try {
			value=mapper.writeValueAsString(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return value;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/mySellerDelete.do")
	public int mySellerDelete(SreviewVO svo,HttpServletRequest request) {
		logger.info("mySellerDelete 호출");
		int result = 0;
		result = mypageService.mySellerDelete(svo,request);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/mySellerRupdate.do")
	public int mySellerRupdate(SreviewVO svo,HttpServletRequest request) {
		logger.info("mySellerRupdate 호출");
		int result = 0;
		result = mypageService.mySellerRupdate(svo,request);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/myProductDelete.do")
	public int myProductDelete(PreviewVO pvo,HttpServletRequest request) {
		logger.info("myProductDelete 호출");
		int result = 0;
		result = mypageService.myProductDelete(pvo,request);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/myProductRupdate.do")
	public int myProductRupdate(PreviewVO pvo,HttpServletRequest request) {
		logger.info("myProductRupdate 호출");
		int result = 0;
		result = mypageService.myProductRupdate(pvo,request);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/recentItem.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String recentItem(ObjectMapper mapper) {
		logger.info("popItem 호출 성공");
		String listData = mypageService.recentItem(mapper);		
		return listData; // 문자열 반환
	}
	
	@ResponseBody
	@RequestMapping(value="/sellItem.do", method=RequestMethod.GET, produces ="text/plain; charset=UTF-8")
	public String sellItem(ObjectMapper mapper) {
		logger.info("popItem 호출 성공");
		String listData = mypageService.sellItem(mapper);		
		return listData; // 문자열 반환
	}
	

}
