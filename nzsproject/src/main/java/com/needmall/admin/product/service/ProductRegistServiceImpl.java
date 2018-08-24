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
import com.needmall.common.file.FileUploadUtil;
import com.needmall.common.vo.Category1depVO;
import com.needmall.common.vo.Category2depVO;
import com.needmall.common.vo.ProductVO;

@Service
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
		prvo.setP_content(prvo.getP_content().toString().replaceAll("\n", "<br>")); //엔터 br태그로 바꿔주기		
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
	
	@Override
	public int productDelete(ProductRegistVO prvo, HttpServletRequest request) {
		int imgresult=0;
		int proresult=0;
		int result=0;
		
		//proimage 데이터 삭제
		imgresult = productRegistDao.productImageDelete(prvo.getPi_num());
		//product 데이터 삭제
		proresult = productRegistDao.productDelete(prvo.getP_num());
		if(result == 2) {
			try {
				FileUploadUtil.fileDelete(prvo.getPi_image(), request);
			} catch (IOException e) {				
				e.printStackTrace();
			}
		}
		return result;
	}

		
}
