package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.OrdersVo;

public interface StoreService {

	List<OrdersVo> findOrderByMid(String mid);

	void updateOrderByState(String order_idx, String state);

}
