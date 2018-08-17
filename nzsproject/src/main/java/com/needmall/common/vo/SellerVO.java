package com.needmall.common.vo;

import java.sql.Date;

public class SellerVO {
	private int s_num=0;
	private int cs_division=0;
	private String s_id="";
	private String s_pwd="";
	private String s_name="";
	private String s_gender="";
	private String s_birthday="";
	private String s_address=""; 
	private String s_mail="";
	private String s_phone="";
	private String s_cell="";
	private Date s_date;
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getCs_division() {
		return cs_division;
	}
	public void setCs_division(int cs_division) {
		this.cs_division = cs_division;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_pwd() {
		return s_pwd;
	}
	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_gender() {
		return s_gender;
	}
	public void setS_gender(String s_gender) {
		this.s_gender = s_gender;
	}
	public String getS_birthday() {
		return s_birthday;
	}
	public void setS_birthday(String s_birthday) {
		this.s_birthday = s_birthday;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_mail() {
		return s_mail;
	}
	public void setS_mail(String s_mail) {
		this.s_mail = s_mail;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getS_cell() {
		return s_cell;
	}
	public void setS_cell(String s_cell) {
		this.s_cell = s_cell;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	@Override
	public String toString() {
		return "SellerVO [s_num=" + s_num + ", cs_division=" + cs_division + ", s_id=" + s_id + ", s_pwd=" + s_pwd
				+ ", s_name=" + s_name + ", s_gender=" + s_gender + ", s_birthday=" + s_birthday + ", s_address="
				+ s_address + ", s_mail=" + s_mail + ", s_phone=" + s_phone + ", s_cell=" + s_cell + ", s_date="
				+ s_date + "]";
	}
	
	
	
}
