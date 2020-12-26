package com.spring.bae2020.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.OrderDao;
import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.OrderDetailVo;
import com.spring.bae2020.vo.OrderVo;
import com.spring.bae2020.vo.ProductVo;

@Service
public class OrderServiceImp implements OrderService {
	@Autowired
	OrderDao orderDao;

	@Override
	public List<ProductVo> findProductAll() {
		return orderDao.findProductAll();
	}

	@Override
	public List<ProductVo> findProductByCategory(List<ProductVo> vos, String category) {
		List<ProductVo> product = new ArrayList<ProductVo>();
		
		for(int i=0; i<vos.size(); i++) {
			ProductVo vo =vos.get(i);
			if(vo.getCategory_code().equals(category)) {
				product.add(vo);
			}
		}
		return product;
	}

	@Override
	public List<OptionVo> findOptionAll() {
		return orderDao.findOptionAll();
	}

	@Override
	public List<OptionVo> findOptionByCategory(List<OptionVo> vos, String category) {
		List<OptionVo> option = new ArrayList<OptionVo>();
		
		for(int i=0; i<vos.size(); i++) {
			OptionVo vo =vos.get(i);
			if(vo.getCategory_code().equals(category)) {
				option.add(vo);
			}
		}
		return option;
	}

	@Override
	public OrderVo findOrderByIdandState(String mid, String state) {
		return orderDao.findOrderByIdandState(mid, state);
	}

	@Override
	public void insertOrder(String mid, String price, String state) {
		orderDao.insertOrder(mid, price, state);
	}

	@Override
	public void insertOrderDetail(String orderId, String product_code, String price, String options) {
		orderDao.insertOrderDetail(orderId, product_code, price, options);
	}

	@Override
	public void updateOrder(String orderId, String mid, String price, String state) {
		orderDao.updateOrder(orderId, mid, price, state);
	}

	@Override
	public List<OrderDetailVo> findOrderDetailByOrderId(String orderId) {
		return orderDao.findOrderDetailByOrderId(orderId);
	}

	@Override
	public ProductVo findProductByCode(String product_code) {
		return orderDao.findProductByCode(product_code);
	}

	@Override
	public void deleteOrderDetail(String orderId, String product_code, String options) {
		int maxIdx = orderDao.findOrderDetailForMaxidx(orderId,product_code,options);
		orderDao.deleteOrderDetail(maxIdx);
	}

	
}
