package com.spring.bae2020.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.AdminDao;
import com.spring.bae2020.dao.OrderDao;
import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;

@Service
public class OrderServiceImp implements OrderService {
	@Autowired
	OrderDao orderDao;	
	
	@Autowired
	AdminDao adminDao;
	
	@Override
	public void insertCart(CartVo vo) {
		orderDao.insertCart(vo);
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
	public List<ItemVo> findCartByIdx(String mid, String[] arrayIdx) {
		return orderDao.findCartByIdx(arrayIdx);
	}

	@Override
	public CartVo findCartByProduct(CartVo vo) {
		return orderDao.findCartByProduct(vo);
	}

	@Override
	public void insertOrders(OrdersVo vo) {
		orderDao.insertOrders(vo);
	}

	@Override
	public void insertItemFromCart(String order_idx, String[] arrayIdx) {
		orderDao.insertItemFromCart(order_idx,arrayIdx);
	}

	@Override
	public List<OrdersVo> findOrdersGroupByIdx(String group, String mid, String delimiter, String state) {
		return orderDao.findOrdersGroupByIdx(group,mid,delimiter,state);
	}

	@Override
	public List<ItemVo> findItemByOrderIdx(String[] arrayOrderIdx) {
		return orderDao.findItemByOrderIdx(arrayOrderIdx);
	}

	@Override
	public void deleteOrderByIdx(String mid, String order_idx) {
		orderDao.deleteOrderByIdx(mid,order_idx);
	}

	@Override
	public void deleteItemByIdx(String order_idx) {
		orderDao.deleteItemByIdx(order_idx);		
	}

	@Override
	public List<ItemVo> findItemByIdx(String mid, String[] arrayIdx) {
		return orderDao.findItemByIdx(mid, arrayIdx);
	}

	@Override
	public void insertItemFromItem(String order_idx, String[] arrayIdx) {
		orderDao.insertItemFromItem(order_idx,arrayIdx);
	}

	@Override
	public List<ItemVo> findItem(String route, String[] arrayIdx, String order_idx,ItemVo itemVo) {
		List<ItemVo> vos = new ArrayList<ItemVo>();
		
		if(route.equals("cart")) {
			vos = orderDao.findCartByIdx(arrayIdx);
		}
		else if(route.equals("order")) {
			vos = orderDao.findItemByOrderIdx(new String[] {order_idx});
		}
		else {
			ProductVo product = adminDao.findProductByCode(itemVo.getProduct());
			itemVo.setProduct_name(product.getProduct_name());
			itemVo.setCnt("1");
			vos.add(itemVo);
		}
		
		return vos;
	}

	@Override
	public void deleteCartByMid(String mid) {
		orderDao.deleteCartByMid(mid);
	}

	@Override
	public List<OrdersVo> findOrderEndByMid(String mid, int month) {
		return orderDao.findOrderEndByMid(mid,month);
	}

	@Override
	public void insertItem(String route, String order_idx, String[] arrayIdx, ItemVo itemVo) {

		if(route.equals("cart")) {
			orderDao.insertItemFromCart(order_idx, arrayIdx);
		}
		else if(route.equals("order")) {
			orderDao.insertItemFromItem(order_idx, arrayIdx);
		}
		else {
			itemVo.setCnt("1");
			orderDao.insertItem(order_idx, itemVo);
		}
		
	}

	@Override
	public OrdersVo findOrderByIdx(String order_idx) {
		return orderDao.findOrderByIdx(order_idx);
	}

	

	
}
