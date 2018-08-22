package com.needmall.admin.product.service;

import com.fasterxml.jackson.databind.ObjectMapper;

public interface ProductRegistService {
	public String Category1dep(ObjectMapper mapper);
	public String Category2dep(int c1_num, ObjectMapper mapper);
}
