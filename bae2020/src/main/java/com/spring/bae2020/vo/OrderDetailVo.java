package com.spring.bae2020.vo;

public class OrderDetailVo {
	private String order_detail_id;
	private String order_id;
	private String product_code;
	private String product_name;
	private String price;
	private String options;
	private String cnt;
	public String getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(String order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "OrderDetailVo [order_detail_id=" + order_detail_id + ", order_id=" + order_id + ", product_code="
				+ product_code + ", product_name=" + product_name + ", price=" + price + ", options=" + options
				+ ", cnt=" + cnt + "]";
	}
	
	
	

	
}
