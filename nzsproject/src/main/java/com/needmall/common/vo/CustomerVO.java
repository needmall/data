package com.needmall.common.vo;

import java.sql.Date;

public class CustomerVO {
	private int c_num=0; 
	private int cs_division=0;
	private String c_id="";
	private String c_pwd="";
	private String c_name="";
	private String c_gender="";
	private Date c_birthday;
	private String c_address="";
	private String c_mail="";
	private String c_cell="";
	private Date c_date;
	private Double c_lat=0.0;
	private Double c_lon=0.0;
	private Date c_udate;
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getCs_division() {
		return cs_division;
	}
	public void setCs_division(int cs_division) {
		this.cs_division = cs_division;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pwd() {
		return c_pwd;
	}
	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_gender() {
		return c_gender;
	}
	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}
	public Date getC_birthday() {
		return c_birthday;
	}
	public void setC_birthday(Date c_birthday) {
		this.c_birthday = c_birthday;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_mail() {
		return c_mail;
	}
	public void setC_mail(String c_mail) {
		this.c_mail = c_mail;
	}
	public String getC_cell() {
		return c_cell;
	}
	public void setC_cell(String c_cell) {
		this.c_cell = c_cell;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public Double getC_lat() {
		return c_lat;
	}
	public void setC_lat(Double c_lat) {
		this.c_lat = c_lat;
	}
	public Double getC_lon() {
		return c_lon;
	}
	public void setC_lon(Double c_lon) {
		this.c_lon = c_lon;
	}
	public Date getC_update() {
		return c_udate;
	}
	public void setC_update(Date c_update) {
		this.c_udate = c_update;
	}
	@Override
	public String toString() {
		return "CustomerVO [c_num=" + c_num + ", cs_division=" + cs_division + ", c_id=" + c_id + ", c_pwd=" + c_pwd
				+ ", c_name=" + c_name + ", c_gender=" + c_gender + ", c_birthday=" + c_birthday + ", c_address="
				+ c_address + ", c_mail=" + c_mail + ", c_cell=" + c_cell + ", c_date=" + c_date + ", c_lat=" + c_lat
				+ ", c_lon=" + c_lon + ", c_udate=" + c_udate + "]";
	}
	
	
}
