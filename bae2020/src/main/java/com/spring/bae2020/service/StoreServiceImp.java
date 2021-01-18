package com.spring.bae2020.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.StoreDao;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.StoreVo;

@Service
public class StoreServiceImp implements StoreService {
	@Autowired
	StoreDao storeDao;

	@Override
	public StoreVo findStoreByMid(String mid) {
		return storeDao.findStoreByMid(mid);
	}

	@Override
	public void updateOrderByState(String order_idx, String state) {
		storeDao.updateOrderByState(order_idx, state);
	}

	@Override
	public void updateStoreByOpen(String store_code, String open_yn) {
		storeDao.updateStoreByOpen(store_code, open_yn);
	}

	@Override
	public List<OrdersVo> findOrderByDeliveryState(String store_code) {
		return storeDao.findOrderByDeliveryState(store_code);
	}
}
