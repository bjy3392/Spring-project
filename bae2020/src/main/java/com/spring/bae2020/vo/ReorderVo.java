package com.spring.bae2020.vo;

public class ReorderVo {
	private String user_group;
	private String cnt;
	public String getUser_group() {
		return user_group;
	}
	public String getCnt() {
		return cnt;
	}
	public void setUser_group(String user_group) {
		this.user_group = user_group;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "ReorderVo [user_group=" + user_group + ", cnt=" + cnt + "]";
	}
	
	
}
