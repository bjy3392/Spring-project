package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;

public interface OrderService {

	void insertCart(CartVo vo);

	List<CartVo> findCartByMid(String mid);

	void updateCart(String mid, String cart_idx, String purpose);

	void deleteCartByIdx(String mid, String[] arrayCartIdx);

	List<ItemVo> findCartByIdx(String mid, String[] arrayIdx);

	CartVo findCartByProduct(CartVo vo);

	void insertOrders(OrdersVo vo);

	void insertItemFromCart(String order_idx, String[] arrayIdx);

	List<OrdersVo> findOrdersGroupByIdx(String group, String mid, String delimiter, String state);

	List<ItemVo> findItemByOrderIdx(String[] arrayOrderIdx);

	void deleteOrderByIdx(String mid, String order_idx);

	void deleteItemByIdx(String order_idx);

	List<ItemVo> findItemByIdx(String mid, String[] arrayIdx);

	void insertItemFromItem(String order_idx, String[] arrayIdx);

	List<ItemVo> findItem(String route, String[] arrayIdx, String order_idx, ItemVo itemVo);

	void deleteCartByMid(String mid);

	List<OrdersVo> findOrderEndByMid(String mid, int month);

	void insertItem(String route, String order_idx, String[] arrayIdx, ItemVo itemVo);

	OrdersVo findOrderByIdx(String order_idx);



}
