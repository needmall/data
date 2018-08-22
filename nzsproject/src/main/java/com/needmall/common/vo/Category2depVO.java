package com.needmall.common.vo;

public class Category2depVO {
	private int c2_num;
	private String c2_name;
	private int c1_num;
	public int getC2_num() {
		return c2_num;
	}
	public void setC2_num(int c2_num) {
		this.c2_num = c2_num;
	}
	public String getC2_name() {
		return c2_name;
	}
	public void setC2_name(String c2_name) {
		this.c2_name = c2_name;
	}
	public int getC1_num() {
		return c1_num;
	}
	public void setC1_num(int c1_num) {
		this.c1_num = c1_num;
	}
	@Override
	public String toString() {
		return "Category2depVO [c2_num=" + c2_num + ", c2_name=" + c2_name + ", c1_num=" + c1_num + "]";
	}
	
	
}
