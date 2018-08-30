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
    private int price_value=0;
    
    
    //구매 
    private int b1_num =0;
    private Date b1_date;
    private int b2_num=0;
    private int b_count=0;
    private int b_confirm=0;
    
    //기타
    private int multiply_count=0;
    private int original_multiply_count=0;
    private int update_count=0;
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
	public int getPrice_value() {
		return price_value;
	}
	public void setPrice_value(int price_value) {
		this.price_value = price_value;
	}
	public int getB1_num() {
		return b1_num;
	}
	public void setB1_num(int b1_num) {
		this.b1_num = b1_num;
	}
	public Date getB1_date() {
		return b1_date;
	}
	public void setB1_date(Date b1_date) {
		this.b1_date = b1_date;
	}
	public int getB2_num() {
		return b2_num;
	}
	public void setB2_num(int b2_num) {
		this.b2_num = b2_num;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public int getB_confirm() {
		return b_confirm;
	}
	public void setB_confirm(int b_confirm) {
		this.b_confirm = b_confirm;
	}
	public int getMultiply_count() {
		return multiply_count;
	}
	public void setMultiply_count(int multiply_count) {
		this.multiply_count = multiply_count;
	}
	public int getOriginal_multiply_count() {
		return original_multiply_count;
	}
	public void setOriginal_multiply_count(int original_multiply_count) {
		this.original_multiply_count = original_multiply_count;
	}
	public int getUpdate_count() {
		return update_count;
	}
	public void setUpdate_count(int update_count) {
		this.update_count = update_count;
	}
	@Override
	public String toString() {
		return "MycartVO [cart2_num=" + cart2_num + ", cart1_num=" + cart1_num + ", ps_num=" + ps_num + ", cart2_count="
				+ cart2_count + ", cart1_date=" + cart1_date + ", c_num=" + c_num + ", price_value=" + price_value
				+ ", b1_num=" + b1_num + ", b1_date=" + b1_date + ", b2_num=" + b2_num + ", b_count=" + b_count
				+ ", b_confirm=" + b_confirm + ", multiply_count=" + multiply_count + ", original_multiply_count="
				+ original_multiply_count + ", update_count=" + update_count + ", getPi_num()=" + getPi_num()
				+ ", getPi_image()=" + getPi_image() + ", getP_num()=" + getP_num() + ", getP_name()=" + getP_name()
				+ ", getP_price()=" + getP_price() + ", getP_date()=" + getP_date() + ", getP_update()=" + getP_update()
				+ ", getP_content()=" + getP_content() + ", getP_division()=" + getP_division() + ", getDiscount()="
				+ getDiscount() + ", getSt_num()=" + getSt_num() + ", getC1_num()=" + getC1_num() + ", getC1_name()="
				+ getC1_name() + ", getC2_num()=" + getC2_num() + ", getC2_name()=" + getC2_name()
				+ ", getPs_regdate()=" + getPs_regdate() + ", getPs_expiration()=" + getPs_expiration()
				+ ", getPs_count()=" + getPs_count() + ", getPs_price()=" + getPs_price() + ", getS_num()=" + getS_num()
				+ ", getPs_state()=" + getPs_state() + ", getPs_udate()=" + getPs_udate() + ", getState()=" + getState()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
    
    
	
    
	
    
}
