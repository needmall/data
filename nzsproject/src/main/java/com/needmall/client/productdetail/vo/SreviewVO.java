package com.needmall.client.productdetail.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class SreviewVO {
    private int srv_num=0;
    private int c_num=0;
    private int s_num=0;
    private Date srv_date;
    private String srv_image="";
    private String srv_content="";
    private int srv_scope=0;
    private String c_id="";
    private MultipartFile file;
	public int getSrv_num() {
		return srv_num;
	}
	public void setSrv_num(int srv_num) {
		this.srv_num = srv_num;
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
	public Date getSrv_date() {
		return srv_date;
	}
	public void setSrv_date(Date srv_date) {
		this.srv_date = srv_date;
	}
	public String getSrv_image() {
		return srv_image;
	}
	public void setSrv_image(String srv_image) {
		this.srv_image = srv_image;
	}
	public String getSrv_content() {
		return srv_content;
	}
	public void setSrv_content(String srv_content) {
		this.srv_content = srv_content;
	}
	public int getSrv_scope() {
		return srv_scope;
	}
	public void setSrv_scope(int srv_scope) {
		this.srv_scope = srv_scope;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "SreviewVO [srv_num=" + srv_num + ", c_num=" + c_num + ", s_num=" + s_num + ", srv_date=" + srv_date
				+ ", srv_image=" + srv_image + ", srv_content=" + srv_content + ", srv_scope=" + srv_scope + ", c_id="
				+ c_id + ", file=" + file + "]";
	}


    
}