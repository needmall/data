package com.needmall.client.login.vo;

import java.sql.Timestamp;

/* 로그인 횟수에 따른 처리 나중에 고민 */

public class LoginCheck {
	private int lc_num;
	private int c_num;
	private int s_num;
	private int lc_success;
	private int lc_fail;
	private int lc_check;
	private Timestamp lc_date;
	private String lc_ip;
	
	public LoginCheck() {}

	
	
	public LoginCheck(int lc_num, int c_num, int s_num, int lc_success, int lc_fail, int lc_check, Timestamp lc_date,
			String lc_ip) {
		super();
		this.lc_num = lc_num;
		this.c_num = c_num;
		this.s_num = s_num;
		this.lc_success = lc_success;
		this.lc_fail = lc_fail;
		this.lc_check = lc_check;
		this.lc_date = lc_date;
		this.lc_ip = lc_ip;
	}



	public int getLc_num() {
		return lc_num;
	}

	public void setLc_num(int lc_num) {
		this.lc_num = lc_num;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public int getLc_success() {
		return lc_success;
	}

	public void setLc_success(int lc_success) {
		this.lc_success = lc_success;
	}

	public int getLc_fail() {
		return lc_fail;
	}

	public void setLc_fail(int lc_fail) {
		this.lc_fail = lc_fail;
	}

	public int getLc_check() {
		return lc_check;
	}

	public void setLc_check(int lc_check) {
		this.lc_check = lc_check;
	}

	public Timestamp getLc_date() {
		return lc_date;
	}

	public void setLc_date(Timestamp lc_date) {
		this.lc_date = lc_date;
	}

	public String getLc_ip() {
		return lc_ip;
	}

	public void setLc_ip(String lc_ip) {
		this.lc_ip = lc_ip;
	}
	
}
