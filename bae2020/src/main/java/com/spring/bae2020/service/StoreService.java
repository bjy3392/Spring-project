package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.StockVo;
import com.spring.bae2020.vo.StoreVo;

public interface StoreService {

	StoreVo findStoreByMid(String mid);

	void updateOrderByState(String order_idx, String state);

	void updateStoreByOpen(String store_code, String open_yn);

	List<OrdersVo> findOrderByDeliveryState(String store_code);

	void getCalendar();

	List<StockVo> findStockBtStore(String store_code);

	void updateStock(String quantity, String option_code, String store);

	void updateOrderByCancel(String order_idx, String cancel);


}
