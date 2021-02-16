package com.spring.bae2020.vo;

public class BoardVo {
	private String idx;
	private String mid;
	private String product;
	private String product_name;
	private String option_unit;
	private String add_unit;
	private String meat_unit;
	private String price;
	private String price_add;
	private String price_meat;
	private String create_dt;
	private String good;
	private String category_code;
	private String image;
	private String options;
	public String getIdx() {
		return idx;
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
	public String getCreate_dt() {
		return create_dt;
	}
	public String getGood() {
		return good;
	}
	public String getCategory_code() {
		return category_code;
	}
	public String getImage() {
		return image;
	}
	public void setIdx(String idx) {
		this.idx = idx;
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
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	@Override
	public String toString() {
		return "BoardVo [idx=" + idx + ", mid=" + mid + ", product=" + product + ", product_name=" + product_name
				+ ", option_unit=" + option_unit + ", add_unit=" + add_unit + ", meat_unit=" + meat_unit + ", price="
				+ price + ", price_add=" + price_add + ", price_meat=" + price_meat + ", create_dt=" + create_dt
				+ ", good=" + good + ", category_code=" + category_code + ", image=" + image + ", options=" + options
				+ "]";
	}
	
	
	
}
