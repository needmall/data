package com.needmall.common.vo;

import java.sql.Date;

public class FavproductVO extends ProductVO {
    private int fp_num=0;
    private int c_num=0;
    private int p_num=0;
    private Date fp_date;
    
	public int getFp_num() {
		return fp_num;
	}
	public void setFp_num(int fp_num) {
		this.fp_num = fp_num;
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
	public Date getFp_date() {
		return fp_date;
	}
	public void setFp_date(Date fp_date) {
		this.fp_date = fp_date;
	}
	
	@Override
	public String toString() {
		return "FavproductVO [fp_num=" + fp_num + ", c_num=" + c_num + ", p_num=" + p_num + ", fp_date=" + fp_date
				+ ", getC2_num()=" + getC2_num() + ", getP_name()=" + getP_name() + ", getP_price()=" + getP_price()
				+ ", getP_date()=" + getP_date() + ", getP_udate()=" + getP_udate() + ", getP_content()="
				+ getP_content() + ", getPi_num()=" + getPi_num() + ", getP_division()=" + getP_division()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
    
    
    
}
