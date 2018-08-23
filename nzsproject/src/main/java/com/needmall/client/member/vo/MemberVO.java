package com.needmall.client.member.vo;

import java.sql.Date;
import java.sql.Timestamp;

import com.needmall.client.login.vo.LoginVO;

public class MemberVO extends LoginVO {
	private int c_num;
	private int cs_division;
	private String c_gender;
	private int c_gendernum;
	private Date c_birthday;
	private String c_address;
	private String c_mail;
	private String c_cell;
	private Timestamp c_date;
	private double c_lat;
	private double c_lon;
	private Timestamp c_update;
	
	private int s_num;
	private String s_gender;
	private String s_birthday;
	private String s_address;
	private String s_mail;
	private String s_phone;
	private String s_cell;
	private Timestamp s_date;
	
	// store
	private int st_num;
	private String st_bnum;
	private String st_name;
	private String st_address;
	private String st_email;
	private String st_hours;
	private String st_cell;
	private String st_ceo;
	private int st_lat;
	private int st_lon;
	private Timestamp st_date;
	private String si_division;
	
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
	public String getC_gender() {
		return c_gender;
	}
	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}
	public int getC_gendernum() {
		return c_gendernum;
	}
	public void setC_gendernum(int c_gendernum) {
		this.c_gendernum = c_gendernum;
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
	public Timestamp getC_date() {
		return c_date;
	}
	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
	public double getC_lat() {
		return c_lat;
	}
	public void setC_lat(double c_lat) {
		this.c_lat = c_lat;
	}
	public double getC_lon() {
		return c_lon;
	}
	public void setC_lon(double c_lon) {
		this.c_lon = c_lon;
	}
	public Timestamp getC_update() {
		return c_update;
	}
	public void setC_update(Timestamp c_update) {
		this.c_update = c_update;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
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
	public Timestamp getS_date() {
		return s_date;
	}
	public void setS_date(Timestamp s_date) {
		this.s_date = s_date;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public String getSt_bnum() {
		return st_bnum;
	}
	public void setSt_bnum(String st_bnum) {
		this.st_bnum = st_bnum;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getSt_address() {
		return st_address;
	}
	public void setSt_address(String st_address) {
		this.st_address = st_address;
	}
	public String getSt_email() {
		return st_email;
	}
	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}
	public String getSt_hours() {
		return st_hours;
	}
	public void setSt_hours(String st_hours) {
		this.st_hours = st_hours;
	}
	public String getSt_cell() {
		return st_cell;
	}
	public void setSt_cell(String st_cell) {
		this.st_cell = st_cell;
	}
	public String getSt_ceo() {
		return st_ceo;
	}
	public void setSt_ceo(String st_ceo) {
		this.st_ceo = st_ceo;
	}
	public int getSt_lat() {
		return st_lat;
	}
	public void setSt_lat(int st_lat) {
		this.st_lat = st_lat;
	}
	public int getSt_lon() {
		return st_lon;
	}
	public void setSt_lon(int st_lon) {
		this.st_lon = st_lon;
	}
	public Timestamp getSt_date() {
		return st_date;
	}
	public void setSt_date(Timestamp st_date) {
		this.st_date = st_date;
	}
	public String getSi_division() {
		return si_division;
	}
	public void setSi_division(String si_division) {
		this.si_division = si_division;
	}
	
	
	
}
