package com.spring.bae2020.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.StockVo;
import com.spring.bae2020.vo.StoreVo;

public interface StoreDao {

	StoreVo findStoreByMid(@Param("mid")String mid);

	void updateOrderByState(@Param("order_idx")String order_idx, @Param("state")String state);

	void updateStoreByOpen(@Param("store_code")String store_code, @Param("open_yn")String open_yn);

	List<OrdersVo> findOrderByDeliveryState(@Param("store_code")String store_code);

	List<ItemVo> findItemGroupByProduct(@Param("mid")String mid, @Param("ymd")String ymd);

	List<StockVo> findStockBtStore(@Param("store_code")String store_code);

	void updateStock(@Param("quantity")String quantity, @Param("option_code")String option_code, @Param("store")String store);

	void updateOrderByCancel(@Param("order_idx")String order_idx, @Param("cancel")String cancel);

	List<Map<String, String>> findOrderOptionGroupByCode(@Param("order_idx")String order_idx);

	void updateStockByOption(@Param("cnt")String cnt, @Param("option_code")String option_code, @Param("store")String store);
}
