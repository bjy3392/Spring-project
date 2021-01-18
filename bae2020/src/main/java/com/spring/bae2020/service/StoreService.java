package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.StoreVo;

public interface StoreService {

	StoreVo findStoreByMid(String mid);

	void updateOrderByState(String order_idx, String state);

	void updateStoreByOpen(String store_code, String open_yn);

	List<OrdersVo> findOrderByDeliveryState(String store_code);


}
