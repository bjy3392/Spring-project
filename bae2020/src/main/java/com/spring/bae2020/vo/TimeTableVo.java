package com.spring.bae2020.vo;

public class TimeTableVo {
	private String title;
	private String cnt;
	private String sum1;
	private String sum2;
	private String sum3;
	private String sum4;
	public String getTitle() {
		return title;
	}
	public String getCnt() {
		return cnt;
	}
	public String getSum1() {
		return sum1;
	}
	public String getSum2() {
		return sum2;
	}
	public String getSum3() {
		return sum3;
	}
	public String getSum4() {
		return sum4;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public void setSum1(String sum1) {
		this.sum1 = sum1;
	}
	public void setSum2(String sum2) {
		this.sum2 = sum2;
	}
	public void setSum3(String sum3) {
		this.sum3 = sum3;
	}
	public void setSum4(String sum4) {
		this.sum4 = sum4;
	}
	@Override
	public String toString() {
		return "TimeTableVo [title=" + title + ", cnt=" + cnt + ", sum1=" + sum1 + ", sum2=" + sum2 + ", sum3=" + sum3
				+ ", sum4=" + sum4 + "]";
	}
	
}
