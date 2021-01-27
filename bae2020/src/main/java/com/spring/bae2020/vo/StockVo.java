package com.spring.bae2020.vo;

public class StockVo {
	private String option_code;
	private String option_name;
	private String subcategory_code;
	private String store;
	private String quantity;
	private String use_yn;
	private String create_dt;
	private String cnt;
	private String order_idx;
	public String getOption_code() {
		return option_code;
	}
	public String getOption_name() {
		return option_name;
	}
	public String getSubcategory_code() {
		return subcategory_code;
	}
	public String getStore() {
		return store;
	}
	public String getQuantity() {
		return quantity;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public String getCnt() {
		return cnt;
	}
	public String getOrder_idx() {
		return order_idx;
	}
	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public void setSubcategory_code(String subcategory_code) {
		this.subcategory_code = subcategory_code;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}
	@Override
	public String toString() {
		return "StockVo [option_code=" + option_code + ", option_name=" + option_name + ", subcategory_code="
				+ subcategory_code + ", store=" + store + ", quantity=" + quantity + ", use_yn=" + use_yn
				+ ", create_dt=" + create_dt + ", cnt=" + cnt + ", order_idx=" + order_idx + "]";
	}
	
	
}
