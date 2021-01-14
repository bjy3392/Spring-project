package com.spring.bae2020.vo;

public class ItemVo {
	private String item_idx;
	private String order_idx;
	private String product;
	private String product_name;
	private String option_unit;
	private String add_unit;
	private String meat_unit;
	private String price;
	private String price_add;
	private String price_meat;
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
	public String getOption_unit() {
		return option_unit;
	}
	public String getAdd_unit() {
		return add_unit;
	}
	public String getMeat_unit() {
		return meat_unit;
	}
	public String getPrice() {
		return price;
	}
	public String getPrice_add() {
		return price_add;
	}
	public String getPrice_meat() {
		return price_meat;
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
	public void setOption_unit(String option_unit) {
		this.option_unit = option_unit;
	}
	public void setAdd_unit(String add_unit) {
		this.add_unit = add_unit;
	}
	public void setMeat_unit(String meat_unit) {
		this.meat_unit = meat_unit;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setPrice_add(String price_add) {
		this.price_add = price_add;
	}
	public void setPrice_meat(String price_meat) {
		this.price_meat = price_meat;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ItemVo [item_idx=" + item_idx + ", order_idx=" + order_idx + ", product=" + product + ", product_name="
				+ product_name + ", option_unit=" + option_unit + ", add_unit=" + add_unit + ", meat_unit=" + meat_unit
				+ ", price=" + price + ", price_add=" + price_add + ", price_meat=" + price_meat + ", cnt=" + cnt + "]";
	}
	
	
	
	
}
