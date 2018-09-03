package com.needmall.admin.statistic.vo;

public class ProductDataVO {
	private String months;
	private int productAmount;
	private int activeProduct;
	private int activeRate;
	private int openProduct;	
	private int closeProduct;
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public int getActiveProduct() {
		return activeProduct;
	}
	public void setActiveProduct(int activeProduct) {
		this.activeProduct = activeProduct;
	}
	public int getActiveRate() {
		return activeRate;
	}
	public void setActiveRate(int activeRate) {
		this.activeRate = activeRate;
	}
	public int getOpenProduct() {
		return openProduct;
	}
	public void setOpenProduct(int openProduct) {
		this.openProduct = openProduct;
	}
	public int getCloseProduct() {
		return closeProduct;
	}
	public void setCloseProduct(int closeProduct) {
		this.closeProduct = closeProduct;
	}
	
	
}
