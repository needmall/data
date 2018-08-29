package com.needmall.common.vo;

import java.sql.Date;

public class ReqproductVO {
	private int reqp_num;
    private int c2_num;
    private String p_name;
    private int p_price;
    private Date p_date;
    private String p_content;
    private int p_num;
    private int s_num;
	public int getReqp_num() {
		return reqp_num;
	}
	public void setReqp_num(int reqp_num) {
		this.reqp_num = reqp_num;
	}
	public int getC2_num() {
		return c2_num;
	}
	public void setC2_num(int c2_num) {
		this.c2_num = c2_num;
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
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	@Override
	public String toString() {
		return "ReqproductVO [reqp_num=" + reqp_num + ", c2_num=" + c2_num + ", p_name=" + p_name + ", p_price="
				+ p_price + ", p_date=" + p_date + ", p_content=" + p_content + ", p_num=" + p_num + ", s_num=" + s_num
				+ "]";
	}
    
    

}
