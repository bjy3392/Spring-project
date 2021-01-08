package com.spring.bae2020.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.OrderDao;
import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;

@Service
public class OrderServiceImp implements OrderService {
	@Autowired
	OrderDao orderDao;

	@Override
	public List<ProductVo> findProductAll() {
		return orderDao.findProductAll();
	}

//	@Override
//	public List<ProductVo> findProductByCategory(List<ProductVo> vos, String category) {
//		List<ProductVo> product = new ArrayList<ProductVo>();
//		
//		for(int i=0; i<vos.size(); i++) {
//			ProductVo vo =vos.get(i);
//			if(vo.getCategory_code().equals(category)) {
//				product.add(vo);
//			}
//		}
//		return product;
//	}
	@Override
	public List<CategoryVo> findCategoryByCode(String classify) {
		return orderDao.findCategoryByCode(classify);
	}
	
	@Override
	public List<ProductVo> findProductByCategory(String category) {
		return orderDao.findProductByCategory(category);
	}
	
	@Override
	public List<OptionsVo> findOptionAll() {
		return orderDao.findOptionAll();
	}

	@Override
	public List<OptionsVo> findOptionByCategory(List<OptionsVo> vos, String category) {
		List<OptionsVo> option = new ArrayList<OptionsVo>();
		
//		for(int i=0; i<vos.size(); i++) {
//			OptionsVo vo =vos.get(i);
//			if(vo.getCategory_code().equals(category)) {
//				option.add(vo);
//			}
//		}
		
		return option;
	}

	@Override
	public ProductVo findProductByCode(String product_code) {
		return orderDao.findProductByCode(product_code);
	}
	
	@Override
	public void insertCart(String mid, String product, String options, String price) {
		orderDao.insertCart(mid, product, options, price);
	}

	@Override
	public List<CartVo> findCartByMid(String mid) {
		return orderDao.findCartByMid(mid);
	}

	@Override
	public void updateCart(String mid, String cart_idx, String purpose) {
		orderDao.updateCart(mid,cart_idx, purpose);		
	}

	@Override
	public void deleteCartByIdx(String mid, String[] arrayCartIdx) {
		orderDao.deleteCartByIdx(mid, arrayCartIdx);
	}

	@Override
	public List<CartVo> findCartByIdx(String mid, String[] arrayCartIdx) {
		return orderDao.findCartByIdx(mid, arrayCartIdx);
	}

	@Override
	public CartVo findCartByProduct(String mid, String product, String options, String price) {
		return orderDao.findCartByProduct(mid, product, options, price);
	}

	@Override
	public void insertOrders(OrdersVo vo) {
		orderDao.insertOrders(vo);
	}

	@Override
	public void insertItem(String order_idx, String[] addCartIdx) {
		orderDao.insertItem(order_idx,addCartIdx);
	}

	@Override
	public List<OrdersVo> findOrdersGroupByIdx(String group, String mid, String delimiter, String state) {
		return orderDao.findOrdersGroupByIdx(group,mid,delimiter,state);
	}

	@Override
	public List<ItemVo> findItemByIdx(String[] arrayOrderIdx) {
		return orderDao.findItemByIdx(arrayOrderIdx);
	}

	@Override
	public void deleteOrderByIdx(String mid, String order_idx) {
		orderDao.deleteOrderByIdx(mid,order_idx);
	}

	@Override
	public void deleteItemByIdx(String order_idx) {
		orderDao.deleteItemByIdx(order_idx);		
	}

	

	
}
