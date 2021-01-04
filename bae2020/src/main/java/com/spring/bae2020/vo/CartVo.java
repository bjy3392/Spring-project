package com.spring.bae2020.vo;

public class CartVo {
	private String cart_idx;
	private String mid;
	private String product;
	private String product_name;
	private String options;
	private String price;
	private String cnt;
	private String create_dt;
	private String update_dt;
	private String image;
	
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
	public String getOptions() {
		return options;
	}
	public String getPrice() {
		return price;
	}
	public String getCnt() {
		return cnt;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public String getUpdate_dt() {
		return update_dt;
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
	public void setOptions(String options) {
		this.options = options;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "CartVo [cart_idx=" + cart_idx + ", mid=" + mid + ", product=" + product + ", product_name="
				+ product_name + ", options=" + options + ", price=" + price + ", cnt=" + cnt + ", create_dt="
				+ create_dt + ", update_dt=" + update_dt + ", image=" + image + "]";
	}
	
	
}
	