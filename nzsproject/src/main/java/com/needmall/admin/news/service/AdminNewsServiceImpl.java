package com.needmall.admin.news.service;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.needmall.admin.news.dao.AdminNewsDao;
import com.needmall.common.file.FileUploadUtil;
import com.needmall.common.vo.NewsVO;



@Service
public class AdminNewsServiceImpl implements AdminNewsService {
	
	
	@Autowired
	private AdminNewsDao adminNewsDao;

	@Override
	public List<NewsVO> adminNewsList() {
		List<NewsVO> list = adminNewsDao.adminNewsList();
		return list;
	}

	@Override
	public NewsVO adminNewsDetail(NewsVO nvo) {		
		return adminNewsDao.adminNewsDetail(nvo);
	}

	@Override
	public int adminNewsDelete(NewsVO nvo, HttpServletRequest request) {		
		int result=0;
		String preimg=nvo.getN_file();
		result= adminNewsDao.adminNewsDelete(nvo);
		if(nvo.getN_file()!="" && result ==1) {
			try {
				FileUploadUtil.fileDelete(preimg, request);
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}		
		return result;
	}

	@Override
	public int adminNewsUpdate(NewsVO bvo, HttpServletRequest request) {
		int result = 0;		
		String preimg= bvo.getN_file();
		String fileName="";
		if(!bvo.getFile().isEmpty()) {  // null 로 하면 경우에 따라서 오류!!!
			try {
				fileName = FileUploadUtil.fileUpload(bvo.getFile(), request, "news");
				bvo.setN_file(fileName);				
				result = adminNewsDao.adminNewsUpdate(bvo);
				if(result==1 && preimg!="") { //잘 수행되고 기존 이미지가 있던경우 기존 이미지 삭제
					try {
						FileUploadUtil.fileDelete(preimg, request);						
					} catch (IOException e) {				
						e.printStackTrace();
					}
				}
			} catch (IOException e) {			
				e.printStackTrace();
			}		
		}else {  //첨부파일이 없을 경우(기존에 받았던 n_file값 그대로 가지고옴)
			result = adminNewsDao.adminNewsUpdate(bvo);			
		}
		return result;	
	}

	@Override
	public int adminNewsInsert(NewsVO bvo, HttpServletRequest request) {
		int result = 0;		
		String fileName="";
		if(!bvo.getFile().isEmpty()) {  // null 로 하면 경우에 따라서 오류!!!
			try {
				fileName = FileUploadUtil.fileUpload(bvo.getFile(), request, "news");
				bvo.setN_file(fileName);												
			} catch (IOException e) {			
				e.printStackTrace();
			}		
		}
		result = adminNewsDao.adminNewsInsert(bvo);
		return result;
	}
	
	
}
