package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.OrdersVo;

public interface DeliveryService {

	List<OrdersVo> findOrderByOnlyDelivery(String state, String mid);

}
