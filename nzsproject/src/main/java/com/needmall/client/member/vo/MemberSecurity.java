package com.needmall.client.member.vo;

public class MemberSecurity {
	private String c_id;
	private String s_id;
	private String salt;
	
	public MemberSecurity() {}

	public MemberSecurity(String c_id, String s_id, String salt) {
		super();
		this.c_id = c_id;
		this.s_id = s_id;
		this.salt = salt;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	
	
}
