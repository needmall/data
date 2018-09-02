package  com.needmall.admin.news.controller;

//import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.needmall.admin.news.service.AdminNewsService;
import com.needmall.admin.product.vo.ProductRegistVO;

//import org.springframework.web.bind.annotation.RequestParam;

//import org.springframework.web.multipart.MultipartFile;

import com.needmall.client.news.service.NewsService;
import com.needmall.common.vo.NewsVO;



@Controller
@RequestMapping(value="admin/news")
public class AdminNewsController {
	Logger logger = Logger.getLogger(AdminNewsController.class);
	
	@Autowired
	private AdminNewsService adminnewsService;  //필드명은 인터페이스를 선언함으로서 모든 구현체를 받을 수 있다.

	
	/**
	 * adminNewsList : 공지사항 리스트 보기
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/adminNewsList.do", method=RequestMethod.GET)
	public String adminNewsList(Model model) {   
		logger.info("adminNewsList 호출 성공");
		
		List<NewsVO> newsList = adminnewsService.adminNewsList();
		model.addAttribute("adminNewsList", newsList);     
		
		return "admin/news/adminNewsList";
	}	
	
	/**
	 * adminNewsDetail: 공지사항 상세보기 
	 * @param nvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/adminNewsDetail.do", method=RequestMethod.GET)
	public String adminNewsDetail(NewsVO nvo,  Model model) { 
		logger.info("adminNewsDetail 호출 성공");
		
		NewsVO detailVO = adminnewsService.adminNewsDetail(nvo);
		
		model.addAttribute("adminNewsDetail", detailVO);     
		
		return "admin/news/adminNewsDetail";
	}
	
	/**
	 * adminNewsDelete : 공지사항 삭제
	 * @param nvo
	 * @param request : 파일 삭제를 위한  위치 확인용 
	 * @return
	 */
	@RequestMapping(value="/adminNewsDelete.do",method=RequestMethod.POST)
	public String adminNewsDelete(NewsVO nvo, HttpServletRequest request) {
		logger.info("adminNewsDelete 호출 성공");	
		adminnewsService.adminNewsDelete(nvo, request);
		return "redirect:/admin/news/adminNewsList.do";
	}
	
	/**
	 * adminNewsUpdate : 공지사항 수정  
	 * @param nvo
	 * @param request   사진 등록을 위한 위치 확인용
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/adminNewsUpdate.do", method=RequestMethod.POST, produces ="text/plain; charset=UTF-8")
	public String adminNewsUpdate(NewsVO nvo, HttpServletRequest request, Model model) {
		logger.info("adminNewsUpdate 호출 성공");	
		int result =0;	
		result = adminnewsService.adminNewsUpdate(nvo, request);
		model.addAttribute("registresult",result);
		return "redirect:/admin/news/adminNewsDetail.do?n_num="+nvo.getN_num(); 
	}
	
	/**
	 * adminNewsRegist : 공지사항 등록  양식 호출
	 * @return
	 */
	@RequestMapping(value="/adminNewsRegist.do", method=RequestMethod.GET)
	public String adminNewsRegist() {			
		logger.info("adminNewsRegist 호출 성공");	
		return "admin/news/adminNewsRegist";
	}
	
	
	
	/**
	 * adminNewsInsert : 공지사항 등록  
	 * @param nvo
	 * @param request   사진 등록을 위한 위치 확인용
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/adminNewsInsert.do", method=RequestMethod.POST, produces ="text/plain; charset=UTF-8")
	public String adminNewsInsert(NewsVO nvo, HttpServletRequest request, Model model) {	
		int result =0;	
		result = adminnewsService.adminNewsInsert(nvo, request);		
		return "redirect:/admin/news/adminNewsList.do";
	}

}
