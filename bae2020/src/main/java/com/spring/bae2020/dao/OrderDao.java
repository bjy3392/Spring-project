package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;

public interface OrderDao {

	List<ProductVo> findProductAll();

	List<OptionVo> findOptionAll();

	ProductVo findProductByCode(@Param("product_code") String product_code);
	
	void insertCart(@Param("mid")String mid, @Param("product")String product, @Param("options")String options, @Param("price")String price);

	List<CartVo> findCartByMid(@Param("mid")String mid);

	void updateCart(@Param("mid")String mid, @Param("cart_idx")String cart_idx, @Param("purpose")String purpose);

	void deleteCartByIdx(@Param("mid")String mid, @Param("arrayCartIdx")String[] arrayCartIdx);

	List<CartVo> findCartByIdx(@Param("mid")String mid, @Param("arrayCartIdx")String[] arrayCartIdx);

	CartVo findCartByProduct(@Param("mid")String mid, @Param("product")String product, @Param("options")String options, @Param("price")String price);

	void insertOrders(@Param("vo")OrdersVo vo);

	void insertItem(@Param("order_idx")String order_idx, @Param("arrayCartIdx")String[] addCartIdx);

	List<ItemVo> findItemGroupByIdx(@Param("mid")String mid);

	List<ItemVo> findItemByMid(@Param("mid")String mid);

	void deleteOrderByIdx(@Param("mid")String mid, @Param("order_idx")String order_idx);

	void deleteItemByIdx(@Param("order_idx")String order_idx);


}
