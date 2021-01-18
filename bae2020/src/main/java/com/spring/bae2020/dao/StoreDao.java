package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.StoreVo;

public interface StoreDao {

	StoreVo findStoreByMid(@Param("mid")String mid);

	void updateOrderByState(@Param("order_idx")String order_idx, @Param("state")String state);

	void updateStoreByOpen(@Param("store_code")String store_code, @Param("open_yn")String open_yn);

	List<OrdersVo> findOrderByDeliveryState(@Param("store_code")String store_code);
}
