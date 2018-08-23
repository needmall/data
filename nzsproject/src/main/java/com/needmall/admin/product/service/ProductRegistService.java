package com.needmall.admin.product.service;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.product.vo.ProductRegistVO;

public interface ProductRegistService {
	public String category1dep(ObjectMapper mapper);
	public String category2dep(int c1_num, ObjectMapper mapper);
	public String divisionlist();
	public int productInsert(ProductRegistVO prvo, HttpServletRequest request);
}
