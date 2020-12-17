package com.spring.bae2020.vo;

public class ProductVo {
	private String product_code;
	private String product_name;
	private String category_code;
	private String price;
	private String image;
	private String user_id;
	private String create_dt;
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
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	@Override
	public String toString() {
		return "ProductVo [product_code=" + product_code + ", product_name=" + product_name + ", category_code="
				+ category_code + ", price=" + price + ", image=" + image + ", user_id=" + user_id + ", create_dt="
				+ create_dt + "]";
	}
	
	
}
