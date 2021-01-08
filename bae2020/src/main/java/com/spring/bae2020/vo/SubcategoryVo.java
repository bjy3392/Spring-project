package com.spring.bae2020.vo;

public class SubcategoryVo {
	private String subcategory_code;
	private String subcategory_name;
	private String category_code;
	private String first_code;
	private String user_id;
	private String create_dt;
	public String getSubcategory_code() {
		return subcategory_code;
	}
	public String getSubcategory_name() {
		return subcategory_name;
	}
	public String getCategory_code() {
		return category_code;
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
	public void setSubcategory_code(String subcategory_code) {
		this.subcategory_code = subcategory_code;
	}
	public void setSubcategory_name(String subcategory_name) {
		this.subcategory_name = subcategory_name;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
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
	@Override
	public String toString() {
		return "SubcategoryVo [subcategory_code=" + subcategory_code + ", subcategory_name=" + subcategory_name
				+ ", category_code=" + category_code + ", first_code=" + first_code + ", user_id=" + user_id
				+ ", create_dt=" + create_dt + "]";
	}
	
}
