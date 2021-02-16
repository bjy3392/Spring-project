package com.spring.bae2020.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.DeliveryDao;
import com.spring.bae2020.vo.OrdersVo;

@Service
public class DeliveryServiceImp implements DeliveryService {

	@Autowired
	DeliveryDao deliveryDao;

	@Override
	public List<OrdersVo> findOrderByOnlyDelivery(String state, String mid) {
		return deliveryDao.findOrderByOnlyDelivery(state, mid);
	}

}
