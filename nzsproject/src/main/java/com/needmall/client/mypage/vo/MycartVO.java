package com.needmall.client.mypage.vo;


import java.sql.Date;

import com.needmall.client.productdetail.vo.ProductdetailVO;

public class MycartVO extends ProductdetailVO {

    private int cart2_num=0;
    private int cart1_num=0;
    private int ps_num=0;
    private int cart2_count=0;
    private Date cart1_date;
    private int c_num =0 ;
	public int getCart2_num() {
		return cart2_num;
	}
	public void setCart2_num(int cart2_num) {
		this.cart2_num = cart2_num;
	}
	public int getCart1_num() {
		return cart1_num;
	}
	public void setCart1_num(int cart1_num) {
		this.cart1_num = cart1_num;
	}
	public int getPs_num() {
		return ps_num;
	}
	public void setPs_num(int ps_num) {
		this.ps_num = ps_num;
	}
	public int getCart2_count() {
		return cart2_count;
	}
	public void setCart2_count(int cart2_count) {
		this.cart2_count = cart2_count;
	}
	public Date getCart1_date() {
		return cart1_date;
	}
	public void setCart1_date(Date cart1_date) {
		this.cart1_date = cart1_date;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	@Override
	public String toString() {
		return "MycartVO [cart2_num=" + cart2_num + ", cart1_num=" + cart1_num + ", ps_num=" + ps_num + ", cart2_count="
				+ cart2_count + ", cart1_date=" + cart1_date + ", c_num=" + c_num + ", getSt_num()=" + getSt_num()
				+ ", getPi_num()=" + getPi_num() + ", getPi_image()=" + getPi_image() + ", getP_num()=" + getP_num()
				+ ", getP_name()=" + getP_name() + ", getP_price()=" + getP_price() + ", getP_date()=" + getP_date()
				+ ", getP_update()=" + getP_update() + ", getP_content()=" + getP_content() + ", getP_division()="
				+ getP_division() + ", getDiscount()=" + getDiscount() + ", getC1_num()=" + getC1_num()
				+ ", getC1_name()=" + getC1_name() + ", getC2_num()=" + getC2_num() + ", getC2_name()=" + getC2_name()
				+ ", toString()=" + super.toString() + ", getState()=" + getState() + ", getPs_regdate()="
				+ getPs_regdate() + ", getPs_expiration()=" + getPs_expiration() + ", getPs_count()=" + getPs_count()
				+ ", getPs_price()=" + getPs_price() + ", getS_num()=" + getS_num() + ", getPs_state()=" + getPs_state()
				+ ", getPs_update()=" + getPs_update() + ", getPs_expirationChange()=" + getPs_expirationChange()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	} 
    

  

    
}
