package com.needmall.admin.product.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.product.dao.ProductRegistDao;
import com.needmall.admin.product.vo.ProductRegistVO;
import com.needmall.admin.product.vo.ReqproductRegistVO;
import com.needmall.common.file.FileUploadUtil;
import com.needmall.common.vo.Category1depVO;
import com.needmall.common.vo.Category2depVO;
import com.needmall.common.vo.ProductVO;
import com.needmall.common.vo.ReqstoreVO;

@Service("productRegistService")
public class ProductRegistServiceImpl implements ProductRegistService{

	
	@Autowired
	private ProductRegistDao productRegistDao;
	
	
	/**
	 * category1dep: 카테고리 1부르기
	 */
	@Override
	public String category1dep(ObjectMapper mapper) {
		List<Category1depVO> list = productRegistDao.category1dep();
		String catedep1="";
		try {
			catedep1=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		}		
		return catedep1;
	}

	/**
	 * category2dep: 카테고리 2부르기
	 */
	@Override
	public String category2dep(int c1_num, ObjectMapper mapper) {
		List<Category2depVO> list = productRegistDao.category2dep(c1_num);
		String catedep2="";
		try {
			catedep2=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		}		
		return catedep2;
	}
	
	
	/**
	 * divisionlist: 상품구분 부르기
	 */
	@Override
	public String divisionlist() {
		ObjectMapper mapper = new ObjectMapper();
		List<ProductVO> list = productRegistDao.divisionlist();
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
	public int productInsert(ProductRegistVO prvo, HttpServletRequest request) {
		int result = 0;
		String fileName="";
		try {
			fileName = FileUploadUtil.fileUpload(prvo.getFile(), request, "product");
		} catch (IOException e) {			
			e.printStackTrace();
		}		
		prvo.setPi_image(fileName);
		int result1 = productRegistDao.proimageInsert(prvo);
		int result2 = productRegistDao.productInsert(prvo);		
		result=result1+result2;
		return result;
	}
	
	/**
	 * productList : 상품 리스트 출력
	 */
	@Override
	public List<ProductRegistVO> productList(ProductRegistVO prvo) {
		List<ProductRegistVO> list = null;
		if (prvo.getSearch()=="") {
		list = productRegistDao.productListAll();
		}
		return list;
	}

	/**
	 * productDetail : 상품 상세보기
	 */
	@Override
	public ProductRegistVO productDetail(ProductRegistVO prvo) {
		prvo = productRegistDao.productDetail(prvo);			
		return prvo;
	}
	
	/**
	 * productUsageCount : 상품 사용량 확인
	 */
	@Override
	public int productUsageCount(int p_num) {
		int result=0; 
		result = productRegistDao.productUsageCount(p_num);
		return result;
	}
	
	/**
	 * productDelete: 등록상품 삭제
	 */
	@Override
	public int productDelete(ProductRegistVO prvo, HttpServletRequest request) {
		int imgResult=0;
		int proResult=0;
		int result=0;
		String preimagename=prvo.getPi_image();
		//proimage 데이터 삭제
		imgResult = productRegistDao.productImageDelete(prvo.getPi_num());
		//product 데이터 삭제
		proResult = productRegistDao.productDelete(prvo.getP_num());
		result=imgResult+proResult;
		if(result == 2) {
			try {
				FileUploadUtil.fileDelete(preimagename, request);
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * productUpdate : 등록상품 수정
	 */
	@Override
	public int productUpdate(ProductRegistVO prvo, HttpServletRequest request) {
		int result = 0;
		int result1=0;
		int result2=0;
		String preimg= prvo.getPi_image();
		String fileName="";
		if(!prvo.getFile().isEmpty()) {  // null 로 하면 경우에 따라서 오류!!!
			try {
				fileName = FileUploadUtil.fileUpload(prvo.getFile(), request, "product");
				prvo.setPi_image(fileName);				
				result1 = productRegistDao.proimageUpdate(prvo);
			} catch (IOException e) {			
				e.printStackTrace();
			}		
		}
		
		result2 = productRegistDao.productUpdate(prvo);		
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
	/**
	 * productUpdate : 상태 토글하기
	 */
	@Override
	public int stateUpdate(int p_num, int p_state) {
		int result =0;
		if(p_state==0) {
			result = productRegistDao.p_stateX(p_num);
		}else if(p_state==1){
			result = productRegistDao.p_stateO(p_num);
		}
		return result;
	}

	@Override
	public List<ReqproductRegistVO> productReqList() {
		List<ReqproductRegistVO> list = productRegistDao.productReqList();
		return list;
	}

	
	/**
	 * checkExpiration: quartz로 구동후 1분후 주기적으로 5분마다 실행 ( root-context 확인)
	 */
	@Override
	public void checkExpiration() {
		productRegistDao.checkExpiration();
	}

	
		
}
