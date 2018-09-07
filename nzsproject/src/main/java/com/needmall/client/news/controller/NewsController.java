package  com.needmall.client.news.controller;

//import java.io.File;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import org.springframework.web.bind.annotation.RequestParam;

//import org.springframework.web.multipart.MultipartFile;

import com.needmall.client.news.service.NewsService;
import com.needmall.common.vo.NewsVO;



@Controller
@RequestMapping(value="/news")
public class NewsController {
	Logger logger = Logger.getLogger(NewsController.class);
	
	@Autowired
	private NewsService newsService;  //필드명은 인터페이스를 선언함으로서 모든 구현체를 받을 수 있다.

	@RequestMapping(value="/newsList.do", method=RequestMethod.GET)
	public String newsList(Model model) {   
		logger.info("newsList 호출 성공");
		
		List<NewsVO> newsList = newsService.newsList();
		model.addAttribute("newsList", newsList);     
		
		return "client/news/newsList";
	}	
	
	@RequestMapping(value="/newsDetail.do", method=RequestMethod.GET)
	public String newsDetail(NewsVO nvo,  Model model) { 
		logger.info("newsDetail 호출 성공");
		
		NewsVO detailVO = newsService.newsDetail(nvo);
		
		model.addAttribute("newsDetail", detailVO);     
		
		return "news/newsDetail";
	}	
	
	
}
