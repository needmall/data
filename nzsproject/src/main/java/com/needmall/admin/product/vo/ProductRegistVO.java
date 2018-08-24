package com.needmall.admin.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.needmall.common.vo.ProductVO;

public class ProductRegistVO extends ProductVO{		
	// 파일 업로드를 위한 필드
	private String pi_image  	="";//실제 서버에 저정한 파일명
	private MultipartFile file; // 첨부 파일
	
	//조건 검색시 사용할 필드
	private String search ="";
	private String keyword="";
	private String start_date="";
	private String end_date="";

	// 추가로 필요한 필드
	private String c1_name="";
	private String c2_name="";
	
	public String getPi_image() {
		return pi_image;
	}
	public void setPi_image(String pi_image) {
		this.pi_image = pi_image;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getC1_name() {
		return c1_name;
	}
	public void setC1_name(String c1_name) {
		this.c1_name = c1_name;
	}
	public String getC2_name() {
		return c2_name;
	}
	public void setC2_name(String c2_name) {
		this.c2_name = c2_name;
	}	
	
}
