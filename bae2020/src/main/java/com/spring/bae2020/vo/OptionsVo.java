package com.spring.bae2020.vo;

public class OptionsVo {
	private String option_code;
	private String option_name;
	private String subcategory_code;
	private String price;
	private String image;
	private String user_id;
	private String use_yn;
	private String create_dt;
	private String fileEx; //파일 존재 유무
	private String quantity;
	public String getOption_code() {
		return option_code;
	}
	public String getOption_name() {
		return option_name;
	}
	public String getSubcategory_code() {
		return subcategory_code;
	}
	public String getPrice() {
		return price;
	}
	public String getImage() {
		return image;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public String getFileEx() {
		return fileEx;
	}
	public String getQuantity() {
		return quantity;
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
	public void setPrice(String price) {
		this.price = price;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public void setFileEx(String fileEx) {
		this.fileEx = fileEx;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "OptionsVo [option_code=" + option_code + ", option_name=" + option_name + ", subcategory_code="
				+ subcategory_code + ", price=" + price + ", image=" + image + ", user_id=" + user_id + ", use_yn="
				+ use_yn + ", create_dt=" + create_dt + ", fileEx=" + fileEx + ", quantity=" + quantity + "]";
	}
	
	
}
