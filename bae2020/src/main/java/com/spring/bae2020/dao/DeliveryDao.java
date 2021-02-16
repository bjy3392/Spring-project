package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.OrdersVo;

public interface DeliveryDao {

	List<OrdersVo> findOrderByOnlyDelivery(@Param("state")String state, @Param("mid")String mid);

}
