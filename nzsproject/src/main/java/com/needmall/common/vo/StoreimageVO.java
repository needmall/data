package com.needmall.common.vo;

public class StoreimageVO {
	private String si_division="";
	private String si_image="";
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
	@Override
	public String toString() {
		return "StoreimageVO [si_division=" + si_division + ", si_image=" + si_image + "]";
	}
	
	
}	
