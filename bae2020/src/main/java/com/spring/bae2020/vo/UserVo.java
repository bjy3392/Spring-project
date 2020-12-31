package com.spring.bae2020.vo;

public class UserVo {
	private String mid;
	private String pwd;
	private String name;
	private String tel;
	private String postcode;
	private String roadAddress;
	private String detailAddress;
	private String join_dt;
	private String level;
	private String groups;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getdetailAddress() {
		return detailAddress;
	}
	public void setdetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getJoin_dt() {
		return join_dt;
	}
	public void setJoin_dt(String join_dt) {
		this.join_dt = join_dt;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getGroups() {
		return groups;
	}
	public void setGroups(String groups) {
		this.groups = groups;
	}
	@Override
	public String toString() {
		return "UserVo [mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", postcode=" + postcode
				+ ", roadAddress=" + roadAddress + ", detailAddress=" + detailAddress + ", join_dt=" + join_dt
				+ ", level=" + level + ", groups=" + groups + "]";
	}
	
	

}
