package com.needmall.client.login.vo;

public class LoginVO extends LoginCheck {
	private String s_id="";
	private String s_pwd="";
	private String s_name="";
	private int s_num;
	
	private String c_id="";
	private String c_pwd="";
	private int c_num;
	private String c_name="";
	
	public LoginVO() {}

	public LoginVO(String s_id, String s_pwd, String s_name, int s_num, String c_id, String c_pwd, int c_num,
			String c_name) {
		super();
		this.s_id = s_id;
		this.s_pwd = s_pwd;
		this.s_name = s_name;
		this.s_num = s_num;
		this.c_id = c_id;
		this.c_pwd = c_pwd;
		this.c_num = c_num;
		this.c_name = c_name;
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

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
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

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	@Override
	public String toString() {
		return "LoginVO [s_id=" + s_id + ", s_pwd=" + s_pwd + ", s_name=" + s_name + ", s_num=" + s_num + ", c_id="
				+ c_id + ", c_pwd=" + c_pwd + ", c_num=" + c_num + ", c_name=" + c_name + "]";
	}

	
}
