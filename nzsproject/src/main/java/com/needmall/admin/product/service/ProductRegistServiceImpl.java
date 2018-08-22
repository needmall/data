package com.needmall.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.product.dao.ProductRegistDao;
import com.needmall.common.vo.Category1depVO;

@Service
public class ProductRegistServiceImpl implements ProductRegistService{

	@Autowired
	private ProductRegistDao productRegistDao;
	
	@Override
	public String Category1dep(ObjectMapper mapper) {
		List<Category1depVO> list = productRegistDao.category1dep();
		String catedep1="";
		try {
			catedep1=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {			
			e.printStackTrace();
		}		
		return catedep1;
	}

	
	
}
