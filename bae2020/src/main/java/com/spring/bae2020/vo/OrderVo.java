package com.spring.bae2020.vo;

public class OrderVo {
	private String order_id;
	private String mid;
	private String total;
	private String create_dt;
	private String update_dt;
	private String state_code;
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public String getUpdate_dt() {
		return update_dt;
	}
	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}
	public String getState_code() {
		return state_code;
	}
	public void setState_code(String state_code) {
		this.state_code = state_code;
	}
	@Override
	public String toString() {
		return "OrderVo [order_id=" + order_id + ", mid=" + mid + ", total=" + total + ", create_dt=" + create_dt
				+ ", update_dt=" + update_dt + ", state_code=" + state_code + "]";
	}
	
	
}
