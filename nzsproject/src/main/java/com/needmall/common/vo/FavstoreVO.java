package com.needmall.common.vo;

import java.sql.Date;

public class FavstoreVO extends StoreVO{

    private int fs_num=0;
    private int c_num=0;
    private int st_num=0;
    private Date fs_date;
    
	public int getFs_num() {
		return fs_num;
	}
	public void setFs_num(int fs_num) {
		this.fs_num = fs_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public Date getFs_date() {
		return fs_date;
	}
	public void setFs_date(Date fs_date) {
		this.fs_date = fs_date;
	}
	@Override
	public String toString() {
		return "FavstoreVO [fs_num=" + fs_num + ", c_num=" + c_num + ", st_num=" + st_num + ", fs_date=" + fs_date
				+ ", getSt_bnum()=" + getSt_bnum() + ", getSt_name()=" + getSt_name() + ", getSt_address()="
				+ getSt_address() + ", getSt_email()=" + getSt_email() + ", getSt_hours()=" + getSt_hours()
				+ ", getSt_cell()=" + getSt_cell() + ", getSt_ceo()=" + getSt_ceo() + ", getSt_lat()=" + getSt_lat()
				+ ", getSt_lon()=" + getSt_lon() + ", getSt_date()=" + getSt_date() + ", getS_num()=" + getS_num()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
    
    
}
