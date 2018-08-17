package com.needmall.client.storeall.vo;

import com.needmall.common.vo.StoreVO;

public class StoreallVO extends StoreVO{
	private String si_division="";
	private String si_image="";
	private int distance=0;
	
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
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	


}
