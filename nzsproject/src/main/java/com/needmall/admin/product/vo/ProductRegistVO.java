package com.needmall.admin.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.needmall.common.vo.ProductVO;

public class ProductRegistVO extends ProductVO{		
	// 파일 업로드를 위한 필드
	private String pi_image  	="";//실제 서버에 저정한 파일명
	private MultipartFile file; // 첨부 파일
	
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
	
	
}
