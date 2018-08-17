package com.needmall.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	/*파일 업로드할 폴더 생성*/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			//폴더가 있으면 그냥 리턴
			return;
		}
			//없으면 해당경로 폴더 모두 생성
		fileDir.mkdirs();
	}
	
	/*파일 업로드 메서드*/
	public static String fileUpload(MultipartFile file, HttpServletRequest request, String fileName) throws IOException{
		logger.info("fileUpload 호출 성공");
		
		String real_name=null;
		// MultipartFile 클래스의getFile() 메서드로 클라이언트가 업로드한 파일
		String org_name = file.getOriginalFilename();  // getOriginalFilename() : 업로드할 파일명 문자열로 리턴
		logger.info("org_name :"+org_name);
		
		//파일명 변경(중복되지 않게)
		if(org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_"+System.currentTimeMillis()+"_"+org_name; //저장할 파일 이름
			
			//파일 업로드할 경로 설정
			String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+fileName);
			makeDir(docRoot);  // 위에 메서드 호출
			
			//new File(경로명 +"/"+업로드할 파일명) 파일 객체 생성.
			File fileAdd = new File(docRoot + "/" + real_name);
			logger.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			// 파일 업로드 (저장)
			file.transferTo(fileAdd);  //transferTo() : 업로드한 파일을 destFile에 저장
		}		
		return real_name;
	}
	
	/*파일 삭제 메서드*/
	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException{
		boolean result = false;
		String dirName = fileName.substring(0, fileName.indexOf("_"));				// '_'바로 파일명 앞에 붙은 경로 추출
		String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+dirName);  //추출한 경로를 포함한 실제 경로 저장
		
		File fileDelete = new File(docRoot+"/"+fileName);   //파일 객체 생성(경로 + 파일명)
		logger.info("삭제할 파일(fileDelete): "+fileDelete);
		
		if(fileDelete.exists() && fileDelete.isFile()) {	// 파일 존재 여부 && 파일이 맞는지 여부
			result = fileDelete.delete();                //파일 객체로 삭제하는 메서드 호출
		}
		
		logger.info("파일 삭제 여부(true / false): "+result);
	}
	
	/*파일 Thumbnail 생성 메서드*/
	public static String makeThumbnail(String fileName, HttpServletRequest request) throws Exception{
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		//logger.info("dirName:"+dirName);
		//이미지가 존재하는 폴더 추출
		String imgPath = request.getSession().getServletContext().getRealPath("/uploadStorage/"+dirName);
		//logger.info("imgPath:"+imgPath);
		
		// 추출된 폴더의 실제 경로(물리적 위치 : C:\...)
		File fileAdd = new File(imgPath, fileName);
		//logger.info("원본 이미지파일(fileAdd):"+fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133);
		//resize(대상[BufferedImage 타입], 원본비율, 높이 또는 너비, 크기)
		
		String thumbnailName = "thumbnail_"+fileName;
		String docRoot = imgPath +"/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName);
		//logger.info("업로드할 파일(newFile):" + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//logger.info("확장자(formatNAme):"+formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName;
	}
	
}
