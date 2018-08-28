package com.needmall.common.vo;

import java.sql.Date;

public class FeesVO {
	private int f_num;
	private int s_num;
	private Date f_receiptdate;
	private Date f_setdate;
	
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public Date getF_receiptdate() {
		return f_receiptdate;
	}
	public void setF_receiptdate(Date f_receiptdate) {
		this.f_receiptdate = f_receiptdate;
	}
	public Date getF_setdate() {
		return f_setdate;
	}
	public void setF_setdate(Date f_setdate) {
		this.f_setdate = f_setdate;
	}
	
	@Override
	public String toString() {
		return "Fees [f_num=" + f_num + ", s_num=" + s_num + ", f_receiptdate=" + f_receiptdate + ", f_setdate="
				+ f_setdate + "]";
	}
	
	
}
