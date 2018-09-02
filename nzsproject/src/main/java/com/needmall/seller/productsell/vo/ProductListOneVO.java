package com.needmall.seller.productsell.vo;

public class ProductListOneVO extends ProductInsertVO{
	
	private String 	pi_image 	= "";	// 상품 이미지
	private String 	p_name 		= "";	// 상품 이름
	private int 	p_price 	= 0;	// 상품 판매가
	private String 	p_content 	= "";	// 상품 설명
	private String	ps_regdate 	= "";	// 수정 날짜
	
	public ProductListOneVO() {}
	public ProductListOneVO(String pi_image, String p_name, int p_price, String p_content, String ps_regdate) {
		super();
		this.pi_image = pi_image;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_content = p_content;
		this.ps_regdate = ps_regdate;
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
	public String getPs_regdate() {
		return ps_regdate;
	}
	public void setPs_regdate(String ps_regdate) {
		this.ps_regdate = ps_regdate;
	}	
}
