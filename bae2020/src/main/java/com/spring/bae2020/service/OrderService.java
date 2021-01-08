package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;

public interface OrderService {

	List<ProductVo> findProductAll();

	List<CategoryVo> findCategoryByCode(String classify);
	
	List<ProductVo> findProductByCategory(String category);

	List<OptionsVo> findOptionAll();

	List<OptionsVo> findOptionByCategory(List<OptionsVo> vos, String category);

	ProductVo findProductByCode(String product_code);

	void insertCart(String mid, String product, String options, String price);

	List<CartVo> findCartByMid(String mid);

	void updateCart(String mid, String cart_idx, String purpose);

	void deleteCartByIdx(String mid, String[] arrayCartIdx);

	List<CartVo> findCartByIdx(String mid, String[] arrayCartIdx);

	CartVo findCartByProduct(String mid, String product, String options, String price);

	void insertOrders(OrdersVo vo);

	void insertItem(String order_idx, String[] addCartIdx);

	List<OrdersVo> findOrdersGroupByIdx(String group, String mid, String delimiter, String state);

	List<ItemVo> findItemByIdx(String[] arrayOrderIdx);

	void deleteOrderByIdx(String mid, String order_idx);

	void deleteItemByIdx(String order_idx);


}
