package com.spring.bae2020.vo;

public class CategoryVo {
	private String category_code;
	private String category_name;
	private String first_code;
	private String user_id;
	private String create_dt;
	private String cnt;
	public String getCategory_code() {
		return category_code;
	}
	public String getCategory_name() {
		return category_name;
	}
	public String getFirst_code() {
		return first_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public void setFirst_code(String first_code) {
		this.first_code = first_code;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "CategoryVo [category_code=" + category_code + ", category_name=" + category_name + ", first_code="
				+ first_code + ", user_id=" + user_id + ", create_dt=" + create_dt + ", cnt=" + cnt + "]";
	}
	
	
	
}
