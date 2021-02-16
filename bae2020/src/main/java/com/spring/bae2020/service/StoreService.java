package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.ReorderVo;
import com.spring.bae2020.vo.StockVo;
import com.spring.bae2020.vo.StoreVo;
import com.spring.bae2020.vo.TimeTableVo;
import com.spring.bae2020.vo.UserVo;

public interface StoreService {

	StoreVo findStoreByMid(String mid);

	void updateOrderByState(String order_idx, String state);

	void updateStoreByOpen(String store_code, String open_yn);

	List<OrdersVo> findOrderByDeliveryState(String store_code);

	void getCalendar();

	List<StockVo> findStockBtStore(String store_code);

	void updateStock(String quantity, String option_code, String store);

	void updateOrderByCancel(String order_idx, String cancel);

	List<TimeTableVo> findOrderGroupByHour(String store);

	List<TimeTableVo> findOrderGroupByCategory(String store);

	List<CategoryVo> findPieChar(String store);

	List<ProductVo> findOrderGroupByProduct(String store, String category);

	List<ReorderVo> findUserByStore(String store);

	List<UserVo> findUserByOrderCnt(String store);

	void updateOrderByDelivery(String order_idx, String mid);


}
