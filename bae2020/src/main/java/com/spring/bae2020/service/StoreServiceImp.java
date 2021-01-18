package com.spring.bae2020.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.StoreDao;
import com.spring.bae2020.vo.OrdersVo;

@Service
public class StoreServiceImp implements StoreService {
	@Autowired
	StoreDao storeDao;

	@Override
	public List<OrdersVo> findOrderByMid(String mid) {
		return storeDao.findOrderByMid(mid);
	}

	@Override
	public void updateOrderByState(String order_idx, String state) {
		
		
	}


}
