package com.needmall.common.vo;

import java.sql.Date;

public class ProductVO {
	private int p_num				= 0;
	private int c2__num				= 0;	
	private String p_name			= "";	
	private int p_price				= 0;
	private Date p_date				;
	private Date p_udate			;
	private String p_content		= "";
	private int pi_num			  	= 0;
	private String p_division	    = "";
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getC2__num() {
		return c2__num;
	}
	public void setC2__num(int c2__num) {
		this.c2__num = c2__num;
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
	public Date getP_udate() {
		return p_udate;
	}
	public void setP_udate(Date p_udate) {
		this.p_udate = p_udate;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getPi_num() {
		return pi_num;
	}
	public void setPi_num(int pi_num) {
		this.pi_num = pi_num;
	}
	public String getP_division() {
		return p_division;
	}
	public void setP_division(String p_division) {
		this.p_division = p_division;
	}
	@Override
	public String toString() {
		return "ProductVO [p_num=" + p_num + ", c2__num=" + c2__num + ", p_name=" + p_name + ", p_price=" + p_price
				+ ", p_date=" + p_date + ", p_udate=" + p_udate + ", p_content=" + p_content + ", pi_num=" + pi_num
				+ ", p_division=" + p_division + "]";
	}
	
	
}
