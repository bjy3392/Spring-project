package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.OrderDetailVo;
import com.spring.bae2020.vo.OrderVo;
import com.spring.bae2020.vo.ProductVo;

public interface OrderDao {

	List<ProductVo> findProductAll();

	List<OptionVo> findOptionAll();

	OrderVo findOrderByIdandState(@Param("mid")String mid, @Param("state")String state);

	void insertOrder(@Param("mid")String mid, @Param("price")String price, @Param("state")String state);

	void insertOrderDetail(@Param("orderId")String orderId, @Param("product_code")String product_code, @Param("price")String price, @Param("options")String options);

	void updateOrder(@Param("orderId")String orderId, @Param("mid")String mid, @Param("price")String price,  @Param("state")String state);

	List<OrderDetailVo> findOrderDetailByOrderId(@Param("orderId")String orderId);

	ProductVo findProductByCode(@Param("product_code") String product_code);

	int findOrderDetailForMaxidx(@Param("orderId")String orderId, @Param("product_code")String product_code, @Param("options")String options);

	void deleteOrderDetail(@Param("maxIdx")int maxIdx);


}
