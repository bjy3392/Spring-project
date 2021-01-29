package com.spring.bae2020.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.PointEventVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.StockVo;

public interface OrderDao {

	void insertCart(@Param("vo")CartVo vo);

	List<CartVo> findCartByMid(@Param("mid")String mid);

	void updateCart(@Param("mid")String mid, @Param("cart_idx")String cart_idx, @Param("purpose")String purpose);

	void deleteCartByIdx(@Param("mid")String mid, @Param("arrayCartIdx")String[] arrayCartIdx);

	List<ItemVo> findCartByIdx(@Param("arrayIdx")String[] arrayIdx, @Param("store_code")String store);

	CartVo findCartByProduct(@Param("vo")CartVo vo);

	void insertOrders(@Param("vo")OrdersVo vo);

	void insertItemFromCart(@Param("order_idx")String order_idx, @Param("arrayIdx")String[] arrayIdx);

	List<OrdersVo> findOrdersGroupByIdx(@Param("group")String group, @Param("mid")String mid, @Param("delimiter")String delimiter, @Param("state")String state);

	List<ItemVo> findItemByOrderIdx(@Param("arrayOrderIdx")String[] arrayOrderIdx, @Param("store_code")String store_code);

	void deleteOrderByIdx(@Param("mid")String mid, @Param("order_idx")String order_idx);

	void deleteItemByIdx(@Param("order_idx")String order_idx);

	List<ProductVo> findProductByCategory(@Param("category")String category);

	List<ItemVo> findItemByIdx(@Param("mid")String mid, @Param("arrayIdx")String[] arrayIdx);

	void insertItemFromItem(@Param("order_idx")String order_idx, @Param("arrayIdx")String[] arrayIdx);

	void deleteCartByMid(@Param("mid")String mid);

	List<OrdersVo> findOrderEndByMid(@Param("mid")String mid, @Param("month")String month);

	void insertItem(@Param("order_idx")String order_idx, @Param("itemVo")ItemVo itemVo);

	OrdersVo findOrderByIdx(@Param("order_idx")String order_idx);

	String checkStockByName(@Param("bread")String bread, @Param("store")String store);

	String findCartOptionByIdx(@Param("idx")String idx);

	List<StockVo> findItemStockByOption(@Param("arrayOrderIdx")String[] arrayOrderIdx, @Param("store")String store);

	List<StockVo> findCartStockByOption(@Param("arrayIdx")String[] arrayIdx, @Param("store")String store);

	void insertPoint(@Param("voP")PointEventVo voP);

	void insertPointDetail(@Param("voP")PointEventVo voP);
	
	void updatePointDetail(@Param("voP")PointEventVo voP);
	
	String findPointByMid(@Param("mid")String mid);

	List<PointEventVo> findPointGroupBySaveIdx(@Param("mid")String mid);

	void insertMinusPoint(@Param("voP")PointEventVo voP);

	void insertMinusPointDetail(@Param("voP")PointEventVo voP);

	String findSumPointByExpiry(@Param("mid")String mid);

	List<PointEventVo> findPointByExpiry(@Param("mid")String mid);

	List<PointEventVo> findPointByMonth(@Param("mid")String mid, @Param("month")String month);

	PointEventVo findPointDetailByExpiry(@Param("mid")String mid);

	List<PointEventVo> findPointDetailByOrderIdx(@Param("order_idx")String order_idx);





	



}
