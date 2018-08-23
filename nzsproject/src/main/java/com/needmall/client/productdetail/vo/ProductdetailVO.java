package com.needmall.client.productdetail.vo;

import java.sql.Date;

import com.needmall.common.vo.ProductsellVO;

public class ProductdetailVO extends ProductsellVO {

	//PROIMAGE
	private int pi_num=0;		//번호
	private String pi_image="";	//이미지 번호
	//PRODUCT
	private int p_num=0;		//상품번호
	private String p_name="";	//상품 이름
	private int p_price=0;		// 상품 가격
	private Date p_date;		//상품 등록일
	private Date p_update;		// 상품 수정일
	private String p_content="";// 상품 내용
	private String p_division="";// 상품 판매점 구분
	private double discount=0;
	
	//CATEGORY1DEP
	private int c1_num=0;		//카테고리 대분류 번호
	private String c1_name="";	//카테고리 대분류 이름
	
	//CATEGORY1DEP
	private int c2_num=0;		//카테고리 소분류 번호
	private String c2_name="";		//카테고리 소분류 이름
	
	public int getPi_num() {
		return pi_num;
	}
	public void setPi_num(int pi_num) {
		this.pi_num = pi_num;
	}
	public String getPi_image() {
		return pi_image;
	}
	public void setPi_image(String pi_image) {
		this.pi_image = pi_image;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
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
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public Date getP_update() {
		return p_update;
	}
	public void setP_update(Date p_update) {
		this.p_update = p_update;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_division() {
		return p_division;
	}
	public void setP_division(String p_division) {
		this.p_division = p_division;
	}
	public int getC1_num() {
		return c1_num;
	}
	public void setC1_num(int c1_num) {
		this.c1_num = c1_num;
	}
	public String getC1_name() {
		return c1_name;
	}
	public void setC1_name(String c1_name) {
		this.c1_name = c1_name;
	}
	public int getC2_num() {
		return c2_num;
	}
	public void setC2_num(int c2_num) {
		this.c2_num = c2_num;
	}
	public String getC2_name() {
		return c2_name;
	}
	public void setC2_name(String c2_name) {
		this.c2_name = c2_name;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	@Override
	public String toString() {
		return "ProductdetailVO [pi_num=" + pi_num + ", pi_image=" + pi_image + ", p_num=" + p_num + ", p_name="
				+ p_name + ", p_price=" + p_price + ", p_date=" + p_date + ", p_update=" + p_update + ", p_content="
				+ p_content + ", p_division=" + p_division + ", discount=" + discount + ", c1_num=" + c1_num
				+ ", c1_name=" + c1_name + ", c2_num=" + c2_num + ", c2_name=" + c2_name + ", getPs_num()="
				+ getPs_num() + ", getPs_regdate()=" + getPs_regdate() + ", getPs_expiration()=" + getPs_expiration()
				+ ", getPs_count()=" + getPs_count() + ", getPs_price()=" + getPs_price() + ", getS_num()=" + getS_num()
				+ ", getPs_state()=" + getPs_state() + ", getPs_update()=" + getPs_update()
				+ ", getPs_expirationChange()=" + getPs_expirationChange() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	

	
	
}
