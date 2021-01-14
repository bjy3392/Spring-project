package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;

public interface OrderDao {

	void insertCart(@Param("vo")CartVo vo);

	List<CartVo> findCartByMid(@Param("mid")String mid);

	void updateCart(@Param("mid")String mid, @Param("cart_idx")String cart_idx, @Param("purpose")String purpose);

	void deleteCartByIdx(@Param("mid")String mid, @Param("arrayCartIdx")String[] arrayCartIdx);

	List<ItemVo> findCartByIdx(@Param("arrayIdx")String[] arrayIdx);

	CartVo findCartByProduct(@Param("vo")CartVo vo);

	void insertOrders(@Param("vo")OrdersVo vo);

	void insertItemFromCart(@Param("order_idx")String order_idx, @Param("arrayIdx")String[] arrayIdx);

	List<OrdersVo> findOrdersGroupByIdx(@Param("group")String group, @Param("mid")String mid, @Param("delimiter")String delimiter, @Param("state")String state);

	List<ItemVo> findItemByOrderIdx(@Param("arrayOrderIdx")String[] arrayOrderIdx);

	void deleteOrderByIdx(@Param("mid")String mid, @Param("order_idx")String order_idx);

	void deleteItemByIdx(@Param("order_idx")String order_idx);

	List<ProductVo> findProductByCategory(@Param("category")String category);

	List<ItemVo> findItemByIdx(@Param("mid")String mid, @Param("arrayIdx")String[] arrayIdx);

	void insertItemFromItem(@Param("order_idx")String order_idx, @Param("arrayIdx")String[] arrayIdx);



}
