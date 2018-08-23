package com.needmall.admin.product.service;

import com.fasterxml.jackson.databind.ObjectMapper;

public interface ProductRegistService {
	public String category1dep(ObjectMapper mapper);
	public String category2dep(int c1_num, ObjectMapper mapper);
	public String divisionlist();
}
