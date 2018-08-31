package  com.needmall.client.news.controller;

//import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String newsList(Model model) {   //@ModelAttribute("data") 받아온 BoardVO의 이름을 지정해줄 경우, 아래 model.addAttribute("boardList", boardList) 와 같은 역할
		logger.info("newsList 호출 성공");
		
		List<NewsVO> newsList = newsService.newsList();
		model.addAttribute("newsList", newsList);     
		
		return "client/news/newsList";
	}	
	
	
	
//	/* 메소드에 받는 인자가 param 값일 경우에는  @RequestParam("변수명") 을 사용한다.
//	 * 예) public String boardList (@RequestParam("num") int b_num){}
//	 * 	  public String boardList (@RequestParam(value="num", defaultValue="", required=false) int b_num){}	
//	 *    속성 = value : 화면으로부터 전달될 파라미터 이름, defaultValue : 화면으로부터 전달될 파라미터 정보가 없을 때, 설정할 기본값, required : 파라미터의 생략 여부
//	 * /
//	
//	/**
//	 * 글목록 구현하기(페이징 처리를 제외한 목록) 
//	 * **/
//	@RequestMapping(value="/boardList.do", method=RequestMethod.GET)
//	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {   //@ModelAttribute("data") 받아온 BoardVO의 이름을 지정해줄 경우, 아래 model.addAttribute("boardList", boardList) 와 같은 역할
//		logger.info("boardList 호출 성공");
//		
//		List<BoardVO> boardList = boardService.boardList(bvo);
//		model.addAttribute("boardList", boardList);     
//		
//		return "board/boardList";
//	}
//	
//	/**
//	 * 글쓰기 폼 출력하기
//	 * **/
//	@RequestMapping(value="/writeForm.do")
//	public String WriteForm() {
//		logger.info("writeForm 호출 성공");
//		return "board/writeForm";
//	}
//	
//	/**
//	 * 글 입력하기
//	 * **/
//	@RequestMapping(value="/insertBoard.do", method=RequestMethod.POST)
//	public String InsertBoard(BoardVO vo, Model model, HttpServletRequest request) throws IllegalAccessException, IOException {		
//		logger.info("insertBoard 호출 성공");
//
////		logger.info("fileName: "+vo.getFile().getOriginalFilename());
////		logger.info("b_tilte : "+vo.getB_title());
//				
//		int result = 0;
//		String url="";
//		
//		// 파일 업로드 처리 (수정화면에도 공통적으로 사용하기 위해 실제 로직부분 메서드 처리)
//		if(!vo.getFile().isEmpty()) {
//			String b_file = FileUploadUtil.fileUpload(vo.getFile(), request, "board");
//			vo.setB_file(b_file);
//		}
//		
//		result = boardService.insertBoard(vo);
//		
//		if(result == 1) {
//			url = "/board/boardList.do";
//		}else {
//			model.addAttribute("code", 1); 
//			url="/board/writeForm.do";
//		}
//		return "redirect:"+url ;
//	}
//	
//	/**
//	 * 상세 페이지 조회
//	 * **/
//	@RequestMapping(value="/detailBoard.do", method=RequestMethod.GET)
//	public String detailBoard(BoardVO bvo, Model model) {
//		logger.info("detailBoard 호출 성공");
//		
//		BoardVO detail= boardService.detailBoard(bvo);
//		if(detail!=null && !detail.equals("")) {
//			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br>")); //엔터 br태그로 바꿔주기
//		}
//		model.addAttribute("detail", detail);
//		
//		return "board/detailBoard";
//	}
//	
//	/**
//	 * 비밀번호 확인
//	 * @param b_num
//	 * @param b_pwd
//	 * @return int로 result를 0 또는 1을 리넡할 수 도 있고, String로 result 값을 "성공 or 실페'를 리턴할 수도 있다. (현재 문자열
//	 * @ResponseBody 는 전달된 뷰를 통해서 출력하는 것이 아니라 HTTP Response Body에 직접 출력하는 방식, produces 속성은 지정한 미디어 타입과 관련된 응답을 생성하는데 사용한 실제 
//	 * **/
//	@ResponseBody //  ajax로 뷰단을 거치지 않고 결과 값만 받을 때 사용
//	@RequestMapping(value="/passwdCheck.do", method=RequestMethod.POST, produces ="text/plain; charset=UTF-8")
//	public String passwdCheck(BoardVO bvo) {   //@ModelAttribute 
//		logger.info("passwdCheck 호출 성공");
//		String value="";
//		
//		//아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
//		int result = boardService.passwdCheck(bvo);
//		//return result+""; //정수값 반환
//		
//		if(result ==1) {
//			value="성공";
//		}else {
//			value="실패";
//		}
//		
//		return value;  //문자열 반환
//	}
//	
//	/**
//	 * 글 수정하기 입력화면
//	 * */
//	@RequestMapping(value="/updateForm.do", method=RequestMethod.POST)
//	public String updateForm(BoardVO bvo, Model model, HttpServletRequest request) throws IllegalAccessException, IOException {
//		logger.info("updateForm 호출 성공");
//				
//		BoardVO updateData=boardService.detailBoard(bvo);
//		model.addAttribute("updateData", updateData);
//		
//		return "board/updateForm";
//	}
//	
//	/**
//	 * 글 수정하기 수정
//	 * @throws IOException 
//	 * */
//	@RequestMapping(value="/updateBoard.do", method=RequestMethod.POST)	
//	public String updateBoard(BoardVO bvo, HttpServletRequest request) throws IOException {
//		logger.info("updateBoard 호출 성공");
//	
//		int result = 0;
//		String url="";
//		
//		if(!bvo.getFile().isEmpty()) {   // 새로 등록하는 파일이 있으면
//			if(!bvo.getB_file().isEmpty()) {	// 기존 등록 파일이 있으면
//				FileUploadUtil.fileDelete(bvo.getB_file(), request);  //기존파일 지워라
//			}
//			String b_file = FileUploadUtil.fileUpload(bvo.getFile(), request, "board");		// 새로운 파일 업데이트
//			bvo.setB_file(b_file);
//		}
//		
//		result = boardService.updateBoard(bvo);
//		if(result == 1) {
//			url="/board/detailBoard.do?b_num="+bvo.getB_num();
//		}else {
//			url="/board/updateForm.do?b_num="+bvo.getB_num();
//		}
//		return "redirect:"+url;
//	}
//	
//	/**
//	 * 삭제
//	 * **/
//	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.POST)
//	public String deleteBorad(BoardVO bvo, HttpServletRequest request) throws IOException {
//		logger.info("deleteBorad 호출 성공");
//				
//		//파일이 존재하면
//		if(!bvo.getB_file().isEmpty()) {
//			FileUploadUtil.fileDelete(bvo.getB_file(), request);
//		}
//		boardService.deleteBoard(bvo);
//		return "redirect:/board/boardList.do";
//	}
//	
//	/**
//	 * 답글 갯수 확인
//	 * @param b_num
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value="/replyCount.do")
//	public String replyCount(@RequestParam("b_num") int b_num){
//		logger.info("replyCount 호출 성공 ");
//		
//		int result=0;		
//		result = boardService.replyCount(b_num);
//		return result+"";  //문자로 변환
//	}
}
