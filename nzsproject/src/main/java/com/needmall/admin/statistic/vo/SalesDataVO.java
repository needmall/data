package com.needmall.admin.statistic.vo;

public class SalesDataVO {
	private int registAmount;
	private int registSum;
	private int sellAmount;
	private int sellSum;
	private Double rate;
	private String months;
	
	public int getRegistAmount() {
		return registAmount;
	}
	public void setRegistAmount(int registAmount) {
		this.registAmount = registAmount;
	}
	public int getRegistSum() {
		return registSum;
	}
	public void setRegistSum(int registSum) {
		this.registSum = registSum;
	}
	public int getSellAmount() {
		return sellAmount;
	}
	public void setSellAmount(int sellAmount) {
		this.sellAmount = sellAmount;
	}
	public int getSellSum() {
		return sellSum;
	}
	public void setSellSum(int sellSum) {
		this.sellSum = sellSum;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	
	
}
