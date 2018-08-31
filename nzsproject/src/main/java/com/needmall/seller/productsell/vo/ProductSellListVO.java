package com.needmall.seller.productsell.vo;

import com.needmall.client.productall.vo.ProductallVO;

public class ProductSellListVO extends ProductallVO{
	private String p_content = "";	// 상품 설명
	private String ps_udate  = "";	// 수정 날짜
	
	public ProductSellListVO() {}
	public ProductSellListVO(String p_content, String ps_udate) {
		super();
		this.p_content = p_content;
		this.ps_udate = ps_udate;
	}
	
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getPs_udate() {
		return ps_udate;
	}
	public void setPs_udate(String ps_udate) {
		this.ps_udate = ps_udate;
	}
	
}
