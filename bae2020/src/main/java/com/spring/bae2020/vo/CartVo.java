package com.spring.bae2020.vo;

public class CartVo {
	private String cart_idx;
	private String mid;
	private String product;
	private String product_name;
	private String option_unit;
	private String add_unit;
	private String meat_unit;
	private String price;
	private String price_add;
	private String price_meat;
	private String cnt;
	private String store;
	private String store_name;
	private String create_dt;
	private String update_dt;
	private String image;
	private String category_code;
	public String getCart_idx() {
		return cart_idx;
	}
	public String getMid() {
		return mid;
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
	public String getStore() {
		return store;
	}
	public String getStore_name() {
		return store_name;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public String getUpdate_dt() {
		return update_dt;
	}
	public String getImage() {
		return image;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCart_idx(String cart_idx) {
		this.cart_idx = cart_idx;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public void setStore(String store) {
		this.store = store;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	@Override
	public String toString() {
		return "CartVo [cart_idx=" + cart_idx + ", mid=" + mid + ", product=" + product + ", product_name="
				+ product_name + ", option_unit=" + option_unit + ", add_unit=" + add_unit + ", meat_unit=" + meat_unit
				+ ", price=" + price + ", price_add=" + price_add + ", price_meat=" + price_meat + ", cnt=" + cnt
				+ ", store=" + store + ", store_name=" + store_name + ", create_dt=" + create_dt + ", update_dt="
				+ update_dt + ", image=" + image + ", category_code=" + category_code + "]";
	}
	
	
}
	