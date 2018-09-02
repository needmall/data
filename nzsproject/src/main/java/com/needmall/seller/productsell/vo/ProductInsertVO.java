package com.needmall.seller.productsell.vo;

import com.needmall.common.vo.UserCommonVO;

public class ProductInsertVO extends UserCommonVO{
	private int		ps_num			= 0;	// 판매상품 번호
	private int 	p_num 			= 0;	// 상품 번호
	private String  ps_expiration 	= "";	// 유통기한
	private int 	ps_price 		= 0;	// 판매가격
	private int 	ps_count 		= 0;	// 판매수량
	private int 	ps_state		= 0;	// 판매 상태
	
	public ProductInsertVO() {}
	public ProductInsertVO(int ps_num, int p_num, String ps_expiration, int ps_price, int ps_count, int ps_state) {
		super();
		this.ps_num = ps_num;
		this.p_num = p_num;
		this.ps_expiration = ps_expiration;
		this.ps_price = ps_price;
		this.ps_count = ps_count;
		this.ps_state = ps_state;
	}
	
	public int getPs_num() {
		return ps_num;
	}
	public void setPs_num(int ps_num) {
		this.ps_num = ps_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getPs_expiration() {
		return ps_expiration;
	}
	public void setPs_expiration(String ps_expiration) {
		this.ps_expiration = ps_expiration;
	}
	public int getPs_price() {
		return ps_price;
	}
	public void setPs_price(int ps_price) {
		this.ps_price = ps_price;
	}
	public int getPs_count() {
		return ps_count;
	}
	public void setPs_count(int ps_count) {
		this.ps_count = ps_count;
	}
	public int getPs_state() {
		return ps_state;
	}
	public void setPs_state(int ps_state) {
		this.ps_state = ps_state;
	}
}
