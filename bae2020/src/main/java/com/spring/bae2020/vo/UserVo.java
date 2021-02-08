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
	private String use_yn;
	private String level_name;
	private String cnt;
	public String getMid() {
		return mid;
	}
	public String getPwd() {
		return pwd;
	}
	public String getName() {
		return name;
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
	public String getJoin_dt() {
		return join_dt;
	}
	public String getLevel() {
		return level;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public String getLevel_name() {
		return level_name;
	}
	public String getCnt() {
		return cnt;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setName(String name) {
		this.name = name;
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
	public void setJoin_dt(String join_dt) {
		this.join_dt = join_dt;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public void setLevel_name(String level_name) {
		this.level_name = level_name;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "UserVo [mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", postcode=" + postcode
				+ ", roadAddress=" + roadAddress + ", detailAddress=" + detailAddress + ", join_dt=" + join_dt
				+ ", level=" + level + ", use_yn=" + use_yn + ", level_name=" + level_name + ", cnt=" + cnt + "]";
	}
	

}
