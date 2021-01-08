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

	List<ProductVo> findProductAll();

	List<OptionsVo> findOptionAll();

	List<CategoryVo> findCategoryByCode(@Param("classify")String classify);
	
	ProductVo findProductByCode(@Param("product_code") String product_code);
	
	void insertCart(@Param("mid")String mid, @Param("product")String product, @Param("options")String options, @Param("price")String price);

	List<CartVo> findCartByMid(@Param("mid")String mid);

	void updateCart(@Param("mid")String mid, @Param("cart_idx")String cart_idx, @Param("purpose")String purpose);

	void deleteCartByIdx(@Param("mid")String mid, @Param("arrayCartIdx")String[] arrayCartIdx);

	List<CartVo> findCartByIdx(@Param("mid")String mid, @Param("arrayCartIdx")String[] arrayCartIdx);

	CartVo findCartByProduct(@Param("mid")String mid, @Param("product")String product, @Param("options")String options, @Param("price")String price);

	void insertOrders(@Param("vo")OrdersVo vo);

	void insertItem(@Param("order_idx")String order_idx, @Param("arrayCartIdx")String[] addCartIdx);

	List<OrdersVo> findOrdersGroupByIdx(@Param("group")String group, @Param("mid")String mid, @Param("delimiter")String delimiter, @Param("state")String state);

	List<ItemVo> findItemByIdx(@Param("arrayOrderIdx")String[] arrayOrderIdx);

	void deleteOrderByIdx(@Param("mid")String mid, @Param("order_idx")String order_idx);

	void deleteItemByIdx(@Param("order_idx")String order_idx);

	List<ProductVo> findProductByCategory(@Param("category")String category);



}
