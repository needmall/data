package com.needmall.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.product.dao.ProductRegistDao;
import com.needmall.common.vo.Category1depVO;
import com.needmall.common.vo.Category2depVO;

@Service
public class ProductRegistServiceImpl implements ProductRegistService{

	@Autowired
	private ProductRegistDao productRegistDao;
	
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

	@Override
	public String divisionlist() {
		ObjectMapper mapper = new ObjectMapper();
		List<Category2depVO> list = productRegistDao.category2dep(c1_num);
		String catedep2="";
		try {
			catedep2=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		}		
		return catedep2;
	}

		
}
