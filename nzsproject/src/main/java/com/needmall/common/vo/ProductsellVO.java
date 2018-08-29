package com.needmall.common.vo;

import java.sql.Date;

public class ProductsellVO {
   private int ps_num=0;	//번호
   private int p_num=0;		//등록 상품 번호
   private Date ps_regdate;	// 등록시간
   private Date ps_expiration;	//유통기한
   private int ps_count=0;	//개수
   private int ps_price=0;	//판매가격
   private int s_num=0;		// 판매자 번호
   private int ps_state=0;	// 상태번호
   private Date ps_udate;	// 수정 날짜
   private int state=0;
   
   
	public int getState() {
	return state;
	}
	public void setState(int state) {
		this.state = state;
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
	public Date getPs_regdate() {
		return ps_regdate;
	}
	public void setPs_regdate(Date ps_regdate) {
		this.ps_regdate = ps_regdate;
	}
	public Date getPs_expiration() {
		return ps_expiration;
	}
	public void setPs_expiration(Date ps_expiration) {
		this.ps_expiration = ps_expiration;
		
	}
	public int getPs_count() {
		return ps_count;
	}
	public void setPs_count(int ps_count) {
		this.ps_count = ps_count;
	}
	public int getPs_price() {
		return ps_price;
	}
	public void setPs_price(int ps_price) {
		this.ps_price = ps_price;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getPs_state() {
		return ps_state;
	}
	public void setPs_state(int ps_state) {
		this.ps_state = ps_state;
	}
	public Date getPs_udate() {
		return ps_udate;
	}
	public void setPs_udate(Date ps_udate) {
		this.ps_udate = ps_udate;
	}


   
   
}
