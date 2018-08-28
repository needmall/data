package com.needmall.admin.store.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.needmall.common.vo.StoreVO;

public class StoreRegistVO extends StoreVO {
	private MultipartFile file;
	private String si_division;
	private String si_image;
	private Date expire;
	private int f_num;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getSi_division() {
		return si_division;
	}
	public void setSi_division(String si_division) {
		this.si_division = si_division;
	}
	public String getSi_image() {
		return si_image;
	}
	public void setSi_image(String si_image) {
		this.si_image = si_image;
	}
	
	
	public Date getExpire() {
		return expire;
	}
	public void setExpire(Date expire) {
		this.expire = expire;
	}
	
	
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	@Override
	public String toString() {
		return "StoreRegistVO [file=" + file + ", si_division=" + si_division + ", si_image=" + si_image + "]";
	}
	
	
}
