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

	

	
    
}
