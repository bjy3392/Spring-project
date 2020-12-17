package com.spring.bae2020.vo;

public class OptionVo {
	private String option_code;
	private String option_name;
	private String category_code;
	private String price;
	private String image;
	private String user_id;
	private String create_dt;
	public String getOption_code() {
		return option_code;
	}
	public void setOption_code(String option_code) {
		this.option_code = option_code;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
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
		return "OptionVo [option_code=" + option_code + ", option_name=" + option_name + ", category_code="
				+ category_code + ", price=" + price + ", image=" + image + ", user_id=" + user_id + ", create_dt="
				+ create_dt + "]";
	}
	
	
	
}
