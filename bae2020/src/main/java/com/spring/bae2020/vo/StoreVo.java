package com.spring.bae2020.vo;

public class StoreVo {
	private String store_code;
	private String store_name;
	private String manager;
	private String manager_name;
	private String manager_tel;
	private String tel;
	private String postcode;
	private String roadAddress;
	private String detailAddress;
	private String coupon;
	private String open_yn;
	private String join_dt;
	public String getStore_code() {
		return store_code;
	}
	public String getStore_name() {
		return store_name;
	}
	public String getManager() {
		return manager;
	}
	public String getManager_name() {
		return manager_name;
	}
	public String getManager_tel() {
		return manager_tel;
	}
	public String getTel() {
		return tel;
	}
	public String getPostcode() {
		return postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public String getCoupon() {
		return coupon;
	}
	public String getOpen_yn() {
		return open_yn;
	}
	public String getJoin_dt() {
		return join_dt;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public void setManager_tel(String manager_tel) {
		this.manager_tel = manager_tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}
	public void setJoin_dt(String join_dt) {
		this.join_dt = join_dt;
	}
	@Override
	public String toString() {
		return "StoreVo [store_code=" + store_code + ", store_name=" + store_name + ", manager=" + manager
				+ ", manager_name=" + manager_name + ", manager_tel=" + manager_tel + ", tel=" + tel + ", postcode="
				+ postcode + ", roadAddress=" + roadAddress + ", detailAddress=" + detailAddress + ", coupon=" + coupon
				+ ", open_yn=" + open_yn + ", join_dt=" + join_dt + "]";
	}
	
	
	
	
	
}
