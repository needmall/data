package com.needmall.common.vo;

public class UserCommonVO {
	private int 	s_num		= 0;	// 판매자 번호
	private String  s_id		= "";	// 판매자 아이디
	private String 	si_division = "";	// 편의점 구분
	private String 	keyword		= "";	// 검색 단어
	private int		dealStatus	= 0;	// 판매 상품 구매 확인
	private int		priceStatus	= 0;	// 판매 상품 가격 변경 확인
	
	public UserCommonVO() {}

	public UserCommonVO(int s_num, String s_id, String si_division, String keyword, int dealStatus, int priceStatus) {
		super();
		this.s_num = s_num;
		this.s_id = s_id;
		this.si_division = si_division;
		this.keyword = keyword;
		this.dealStatus = dealStatus;
		this.priceStatus = priceStatus;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getSi_division() {
		return si_division;
	}

	public void setSi_division(String si_division) {
		this.si_division = si_division;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(int dealStatus) {
		this.dealStatus = dealStatus;
	}

	public int getPriceStatus() {
		return priceStatus;
	}

	public void setPriceStatus(int priceStatus) {
		this.priceStatus = priceStatus;
	}
}
