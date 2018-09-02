package com.needmall.common.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NewsVO {
	private int n_num=0;
	private String n_title="";
	private String n_content="";
	private Date n_date;
	private Date n_udate;
	private String n_file="";
	private MultipartFile file; // 첨부 파일
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public Date getN_udate() {
		return n_udate;
	}
	public void setN_udate(Date n_udate) {
		this.n_udate = n_udate;
	}
	public String getN_file() {
		return n_file;
	}
	public void setN_file(String n_file) {
		this.n_file = n_file;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "NewsVO [n_num=" + n_num + ", n_title=" + n_title + ", n_content=" + n_content + ", n_date=" + n_date
				+ ", n_udate=" + n_udate + ", n_file=" + n_file + "]";
	}
	
	
	
}
