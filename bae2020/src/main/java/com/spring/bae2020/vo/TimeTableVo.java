package com.spring.bae2020.vo;

public class TimeTableVo {
	private String title;
	private String cnt;
	public String getTitle() {
		return title;
	}
	public String getCnt() {
		return cnt;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "TimeTable [title=" + title + ", cnt=" + cnt + "]";
	}
	
}
