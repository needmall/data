package com.needmall.common.email.vo;

public class EmailVO {
	private String from;
	private String c_mail;
	private String subject;
	private String text;
	
	public String getFrom() {
		return from;
	}
	
	public void setFrom(String from) {
		this.from = from;
	}
	
	public String getC_mail() {
		return c_mail;
	}
	
	public void setC_mail(String c_mail) {
		this.c_mail = c_mail;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "EmailVO [from=" + from + ", c_mail=" + c_mail + ", subject=" + subject + ", text=" + text + "]";
	}
	
	
}
