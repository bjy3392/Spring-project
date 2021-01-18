package com.spring.bae2020.vo;

public class AskManagerVo {
	private String ask_idx;
	private String mid;
	private String name;
	private String tel;
	private String message;
	private String pass_yn;
	private String ask_dt;
	public String getAsk_idx() {
		return ask_idx;
	}
	public String getMid() {
		return mid;
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public String getMessage() {
		return message;
	}
	public String getPass_yn() {
		return pass_yn;
	}
	public String getask_dt() {
		return ask_dt;
	}
	public void setAsk_idx(String ask_idx) {
		this.ask_idx = ask_idx;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setPass_yn(String pass_yn) {
		this.pass_yn = pass_yn;
	}
	public void setask_dt(String ask_dt) {
		this.ask_dt = ask_dt;
	}
	@Override
	public String toString() {
		return "AskManagerVo [ask_idx=" + ask_idx + ", mid=" + mid + ", name=" + name + ", tel=" + tel + ", message="
				+ message + ", pass_yn=" + pass_yn + ", ask_dt=" + ask_dt + "]";
	}
	
	
}
