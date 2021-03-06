package com.needmall.client.member.vo;

import java.sql.Timestamp;

public class StoreVO {
		// store
		private int st_num;
		private int s_num;
		private String st_bnum="";
		private String st_name="";
		private String st_address="";
		private String st_email="";
		private String st_hours="";
		private String st_cell="";
		private String st_ceo="";
		private int st_lat;
		private int st_lon;
		private Timestamp st_date;
		private String si_division="";
	
	public StoreVO() {}

	public StoreVO(int st_num, int s_num, String st_bnum, String st_name, String st_address, String st_email,
			String st_hours, String st_cell, String st_ceo, int st_lat, int st_lon, Timestamp st_date,
			String si_division) {
		super();
		this.st_num = st_num;
		this.s_num = s_num;
		this.st_bnum = st_bnum;
		this.st_name = st_name;
		this.st_address = st_address;
		this.st_email = st_email;
		this.st_hours = st_hours;
		this.st_cell = st_cell;
		this.st_ceo = st_ceo;
		this.st_lat = st_lat;
		this.st_lon = st_lon;
		this.st_date = st_date;
		this.si_division = si_division;
	}

	public int getSt_num() {
		return st_num;
	}

	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
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

	@Override
	public String toString() {
		return "StoreVO [st_num=" + st_num + ", s_num=" + s_num + ", st_bnum=" + st_bnum + ", st_name=" + st_name
				+ ", st_address=" + st_address + ", st_email=" + st_email + ", st_hours=" + st_hours + ", st_cell="
				+ st_cell + ", st_ceo=" + st_ceo + ", st_lat=" + st_lat + ", st_lon=" + st_lon + ", st_date=" + st_date
				+ ", si_division=" + si_division + "]";
	}
	
}
