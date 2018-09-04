package com.needmall.admin.statistic.vo;

public class StoreDataVO {
	private String months;
	private int storeAmount;
	private int activeStore;
	private int activeRate;
	private int openStore;	
	private int closeStore;
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	public int getStoreAmount() {
		return storeAmount;
	}
	public void setStoreAmount(int storeAmount) {
		this.storeAmount = storeAmount;
	}
	public int getActiveStore() {
		return activeStore;
	}
	public void setActiveStore(int activeStore) {
		this.activeStore = activeStore;
	}
	public int getActiveRate() {
		return activeRate;
	}
	public void setActiveRate(int activeRate) {
		this.activeRate = activeRate;
	}
	public int getOpenStore() {
		return openStore;
	}
	public void setOpenStore(int openStore) {
		this.openStore = openStore;
	}
	public int getCloseStore() {
		return closeStore;
	}
	public void setCloseStore(int closeStore) {
		this.closeStore = closeStore;
	}
	
	
}
