package com.spring.bae2020.vo;

public class PointEventVo {
	private String event_idx;
	private String mid;
	private String order_idx;
	private String way;
	private String amount;
	private String event_dt;
	private String expiry_dt;
	private String detail_idx;
	private String save_detail_idx;
	public String getEvent_idx() {
		return event_idx;
	}
	public String getMid() {
		return mid;
	}
	public String getOrder_idx() {
		return order_idx;
	}
	public String getWay() {
		return way;
	}
	public String getAmount() {
		return amount;
	}
	public String getEvent_dt() {
		return event_dt;
	}
	public String getExpiry_dt() {
		return expiry_dt;
	}
	public String getDetail_idx() {
		return detail_idx;
	}
	public String getSave_detail_idx() {
		return save_detail_idx;
	}
	public void setEvent_idx(String event_idx) {
		this.event_idx = event_idx;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public void setEvent_dt(String event_dt) {
		this.event_dt = event_dt;
	}
	public void setExpiry_dt(String expiry_dt) {
		this.expiry_dt = expiry_dt;
	}
	public void setDetail_idx(String detail_idx) {
		this.detail_idx = detail_idx;
	}
	public void setSave_detail_idx(String save_detail_idx) {
		this.save_detail_idx = save_detail_idx;
	}
	@Override
	public String toString() {
		return "PointEventVo [event_idx=" + event_idx + ", mid=" + mid + ", order_idx=" + order_idx + ", way=" + way
				+ ", amount=" + amount + ", event_dt=" + event_dt + ", expiry_dt=" + expiry_dt + ", detail_idx="
				+ detail_idx + ", save_detail_idx=" + save_detail_idx + "]";
	}
	
	
}
