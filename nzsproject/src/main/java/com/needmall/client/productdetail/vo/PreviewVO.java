package com.needmall.client.productdetail.vo;

import java.sql.Date;

public class PreviewVO {
    private int prv_num=0;
    private int c_num=0;
    private int p_num=0;
    private Date prv_date;
    private String prv_image="";
    private String prv_content="";
    private int prv_scope=0;
	public int getPrv_num() {
		return prv_num;
	}
	public void setPrv_num(int prv_num) {
		this.prv_num = prv_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public Date getPrv_date() {
		return prv_date;
	}
	public void setPrv_date(Date prv_date) {
		this.prv_date = prv_date;
	}
	public String getPrv_image() {
		return prv_image;
	}
	public void setPrv_image(String prv_image) {
		this.prv_image = prv_image;
	}
	public String getPrv_content() {
		return prv_content;
	}
	public void setPrv_content(String prv_content) {
		this.prv_content = prv_content;
	}
	public int getPrv_scope() {
		return prv_scope;
	}
	public void setPrv_scope(int prv_scope) {
		this.prv_scope = prv_scope;
	}
	@Override
	public String toString() {
		return "PreviewVO [prv_num=" + prv_num + ", c_num=" + c_num + ", p_num=" + p_num + ", prv_date=" + prv_date
				+ ", prv_image=" + prv_image + ", prv_content=" + prv_content + ", prv_scope=" + prv_scope + "]";
	}
    
    
}
