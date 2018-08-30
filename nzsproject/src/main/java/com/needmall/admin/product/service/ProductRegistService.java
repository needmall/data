package com.needmall.admin.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.needmall.admin.product.vo.ProductRegistVO;
import com.needmall.common.vo.ReqstoreVO;

public interface ProductRegistService {
	public String category1dep(ObjectMapper mapper);
	public String category2dep(int c1_num, ObjectMapper mapper);
	public String divisionlist();  //mapper 서비스단에서 생성
	public int productInsert(ProductRegistVO prvo, HttpServletRequest request);
	public List<ProductRegistVO> productList(ProductRegistVO prvo);
	public ProductRegistVO productDetail(ProductRegistVO prvo);
	public int productUsageCount(int p_num);
	public int productDelete(ProductRegistVO prvo, HttpServletRequest request);
	public int productUpdate(ProductRegistVO prvo, HttpServletRequest request);
	public int stateUpdate(int p_num, int p_state);
	public List<ReqstoreVO> productReqList();
}
