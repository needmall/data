package com.needmall.admin.store.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.store.dao.StoreRegistDao;
import com.needmall.admin.store.vo.StoreRegistVO;
import com.needmall.common.file.FileUploadUtil;
import com.needmall.common.vo.FeesVO;
import com.needmall.common.vo.ReqstoreVO;
import com.needmall.common.vo.StoreimageVO;

@Service
public class StoreRegistServiceImpl implements StoreRegistService{

	
	@Autowired
	private StoreRegistDao storeRegistDao;
	
	/**
	 * storeReqList : 리스트
	 */
	@Override
	public List<ReqstoreVO> storeReqList() {
		List<ReqstoreVO> list = storeRegistDao.storeReqList();
		return list;
	}

	@Override
	public String divisionlist() {
		ObjectMapper mapper = new ObjectMapper();
		List<StoreimageVO> list = storeRegistDao.divisionlist();
		String divisionlist="";
		try {
			divisionlist=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		}		
		return divisionlist;
	}


	/**
	 * productInsert: 상품등록 하기
	 */
	@Override
	public int storeInsert(StoreRegistVO srvo, HttpServletRequest request) {
		int result = 0;
		String fileName="";
		int result1 =0;
		if(!srvo.getFile().isEmpty()) {
			try {
				fileName = FileUploadUtil.fileUpload(srvo.getFile(), request, "store");
			} catch (IOException e) {			
				e.printStackTrace();
			}		
			srvo.setSi_image(fileName);
			result1 = storeRegistDao.storeimageInsert(srvo);
		}
		int result2 = storeRegistDao.storeInsert(srvo);		
		result=result1+result2;
		return result;
	}

	@Override
	public List<StoreRegistVO> storeList() {
		List<StoreRegistVO> list = storeRegistDao.storeList();
		return list;
	}

	@Override
	public int storeFeeInsert(FeesVO fvo) {
		int result = 0;
		result = storeRegistDao.storeFeeInsert(fvo);	
		return result;
	}

	@Override
	public int storeFeeDelete(FeesVO fvo) {
		int result = 0;
		result = storeRegistDao.storeFeeDelete(fvo);	
		return result;
	}

	/**
	 * productDetail : 상품 상세보기
	 */
	@Override
	public StoreRegistVO storeDetail(StoreRegistVO srvo) {
		srvo = storeRegistDao.storeDetail(srvo);			
		return srvo;
	}

	@Override
	public int storeUpdate(StoreRegistVO srvo, HttpServletRequest request) {
		int result = 0;
		int result1=0;
		int result2=0;
		String preimg= srvo.getSi_image();
		String fileName="";
		if(!srvo.getFile().isEmpty()) {  // null 로 하면 경우에 따라서 오류!!!
			try {
				fileName = FileUploadUtil.fileUpload(srvo.getFile(), request, "store");
				srvo.setSi_image(fileName);	
				
				result1 = storeRegistDao.storeimageInsert(srvo);
			} catch (IOException e) {			
				e.printStackTrace();
			}		
		}
		
		result2 = storeRegistDao.storeUpdate(srvo);		
		result=result1+result2;
		
		if(result == 2) { //첨부파일의 변화가 없을 경우 이미지 업데이트 안함으로 1이되기때문에 파일 삭제가 안된다.
			try {
				FileUploadUtil.fileDelete(preimg, request);
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
