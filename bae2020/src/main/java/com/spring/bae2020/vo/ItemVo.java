package com.spring.bae2020.vo;

public class ItemVo {
	private String item_idx;
	private String order_idx;
	private String product;
	private String product_name;
	private String options;
	private String price;
	private String cnt;
	public String getItem_idx() {
		return item_idx;
	}
	public String getOrder_idx() {
		return order_idx;
	}
	public String getProduct() {
		return product;
	}
	public String getProduct_name() {
		return product_name;
	}
	public String getOptions() {
		return options;
	}
	public String getPrice() {
		return price;
	}
	public String getCnt() {
		return cnt;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ItemVo [item_idx=" + item_idx + ", order_idx=" + order_idx + ", product=" + product + ", product_name="
				+ product_name + ", options=" + options + ", price=" + price + ", cnt=" + cnt + "]";
	}
	
	
	
	
}
