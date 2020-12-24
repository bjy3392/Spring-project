package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.OrderDetailVo;
import com.spring.bae2020.vo.OrderVo;
import com.spring.bae2020.vo.ProductVo;

public interface OrderService {

	List<ProductVo> findProductAll();

	List<ProductVo> findProductByCategory(List<ProductVo> vos, String category);

	List<OptionVo> findOptionAll();

	List<OptionVo> findOptionByCategory(List<OptionVo> vos, String category);

	OrderVo findOrderByIdandState(String mid, String state);

	void insertOrder(String mid, String price, String state);

	void insertOrderDetail(String orderId, String product_code, String price, String options);

	void updateOrder(String orderId, String mid, String price, String state);

	List<OrderDetailVo> findOrderDetailByOrderId(String orderId);

	ProductVo findProductByCode(String product_code);

	void deleteOrderDetail(String orderId, String product_code, String options);


}
