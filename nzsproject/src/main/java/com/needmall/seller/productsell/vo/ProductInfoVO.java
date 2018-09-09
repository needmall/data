package com.needmall.seller.productsell.vo;

import com.needmall.common.vo.UserCommonVO;

public class ProductInfoVO extends UserCommonVO{
	
	private int 	p_num 		= 0;	// 상품 번호
	private String 	pi_image 	= "";	// 상품 이미지
	private String 	p_name 		= "";	// 상품 이름
	private int 	p_price 	= 0;	// 상품 판매가
	private String 	p_content 	= "";	// 상품 설명
	private int 	c2_num		= 0;	// 카테고리 소 분류
	public ProductInfoVO() {}
	public ProductInfoVO(int p_num, String pi_image, String p_name, int p_price, String p_content, int c2_num) {
		super();
		this.p_num = p_num;
		this.pi_image = pi_image;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_content = p_content;
		this.c2_num = c2_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getPi_image() {
		return pi_image;
	}
	public void setPi_image(String pi_image) {
		this.pi_image = pi_image;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getC2_num() {
		return c2_num;
	}
	public void setC2_num(int c2_num) {
		this.c2_num = c2_num;
	}
	 
}
