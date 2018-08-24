package com.needmall.client.productall.vo;

public class ProductallVO {
	private int ps_num				= 0;	// 판매 상품 번호
	private String si_image			= "";	// 편의점 이미지
	private String st_name			= "";	// 편의점 상호명
	private String pi_image			= ""; 	// 상품 이미지 이름
	private String p_name			= "";	// 상품 이름
	private int p_price				= 0; 	// 상품 가격
	private String ps_expiration	= ""; 	// 상품 유통기한
	private int ps_count			= 0; 	// 상품 갯수
	private int ps_price			= 0;	// 상품 판매 가격
	private double c_lat 			= 0.0;	// 위도
	private double c_lon 			= 0.0;	// 경도
	private int prv_count			= 0;	// 댓글
	private double prv_scope 		= 0.0;	// 평점
	private double distance			= 0.0; 	// 거리
	
	public ProductallVO() {}
	public ProductallVO(int ps_num, String si_image, String st_name, String pi_image, String p_name, int p_price,
			String ps_expiration, int ps_count, int ps_price, double c_lat, double c_lon, int prv_count,
			double prv_scope, double distance) {
		super();
		this.ps_num = ps_num;
		this.si_image = si_image;
		this.st_name = st_name;
		this.pi_image = pi_image;
		this.p_name = p_name;
		this.p_price = p_price;
		this.ps_expiration = ps_expiration;
		this.ps_count = ps_count;
		this.ps_price = ps_price;
		this.c_lat = c_lat;
		this.c_lon = c_lon;
		this.prv_count = prv_count;
		this.prv_scope = prv_scope;
		this.distance = distance;
	}
	
	public int getPs_num() {
		return ps_num;
	}
	public void setPs_num(int ps_num) {
		this.ps_num = ps_num;
	}
	public String getSi_image() {
		return si_image;
	}
	public void setSi_image(String si_image) {
		this.si_image = si_image;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getPi_image() {
		return pi_image;
	}
	public void setPi_image(String pi_image) {
		this.pi_image = pi_image;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getPs_expiration() {
		return ps_expiration;
	}
	public void setPs_expiration(String ps_expiration) {
		this.ps_expiration = ps_expiration;
	}
	public int getPs_count() {
		return ps_count;
	}
	public void setPs_count(int ps_count) {
		this.ps_count = ps_count;
	}
	public int getPs_price() {
		return ps_price;
	}
	public void setPs_price(int ps_price) {
		this.ps_price = ps_price;
	}
	public double getC_lat() {
		return c_lat;
	}
	public void setC_lat(double c_lat) {
		this.c_lat = c_lat;
	}
	public double getC_lon() {
		return c_lon;
	}
	public void setC_lon(double c_lon) {
		this.c_lon = c_lon;
	}
	public int getPrv_count() {
		return prv_count;
	}
	public void setPrv_count(int prv_count) {
		this.prv_count = prv_count;
	}
	public double getPrv_scope() {
		return prv_scope;
	}
	public void setPrv_scope(double prv_scope) {
		this.prv_scope = prv_scope;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
}


 


