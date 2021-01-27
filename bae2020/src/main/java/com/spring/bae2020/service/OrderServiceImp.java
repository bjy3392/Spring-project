package com.spring.bae2020.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.AdminDao;
import com.spring.bae2020.dao.OrderDao;
import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.PointEventVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.StockVo;

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

//	@Override
//	public List<ItemVo> findCartByIdx(String mid, String[] arrayIdx) {
//		return orderDao.findCartByIdx(arrayIdx);
//	}

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
	public List<ItemVo> findItemByOrderIdx(String[] arrayOrderIdx,String store_code) {
		return orderDao.findItemByOrderIdx(arrayOrderIdx,store_code);
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
	public List<ItemVo> findItem(String route, String[] arrayIdx, String order_idx,ItemVo itemVo, String store) {
		List<ItemVo> vos = new ArrayList<ItemVo>();
		
		if(route.equals("cart")) {
			vos = orderDao.findCartByIdx(arrayIdx,store);
		}
		else if(route.equals("order")) {
			vos = orderDao.findItemByOrderIdx(new String[] {order_idx},store);
		}
		else {
			ProductVo product = adminDao.findProductByCode(itemVo.getProduct());
			if(product.getCategory_code().equals("PROD-001")) {
				String option = itemVo.getOption_unit();
				String bread = option.substring(0,option.indexOf("/"));
				String quantity = orderDao.checkStockByName(bread, store);
				itemVo.setQuantity(quantity);				
			}
			
			itemVo.setProduct_name(product.getProduct_name());
			itemVo.setCnt("1");
			vos.add(itemVo);
		}
		
		return vos;
	}

	@Override
	public List<StockVo> findStock(String route, String[] arrayIdx, String order_idx, ItemVo itemVo, String store) {
		List<StockVo> vos = new ArrayList<StockVo>();
		
		if(route.equals("cart")) {
			vos = orderDao.findCartStockByOption(arrayIdx,store);
		}
		else if(route.equals("order")) {
			vos = orderDao.findItemStockByOption(new String[] {order_idx},store);
		}
		else {
			if(itemVo.getProduct().substring(0, 4).equals("SAND")) {
				StockVo stockVo = new StockVo();
				String option = itemVo.getOption_unit();
				String bread = option.substring(0,option.indexOf("/"));
				String quantity = orderDao.checkStockByName(bread, store);
				if(Integer.parseInt(quantity) <= 0 ) {
					stockVo.setOption_name(bread);
					stockVo.setCnt("1");
					stockVo.setQuantity(quantity);
					vos.add(stockVo);
				}
			}
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

	@Override
	public List<StockVo> findItemStockByOption(String[] arrayOrderIdx, String store_code) {
		return orderDao.findItemStockByOption(arrayOrderIdx,store_code);
	}

	@Override
	public void insertPoint(OrdersVo vo) {
		PointEventVo voP = new PointEventVo();
		double amount = Integer.parseInt(vo.getTotal()) * 0.1 ;
		voP.setMid(vo.getMid());
		voP.setOrder_idx(vo.getOrder_idx());
		voP.setWay("적립");
		voP.setAmount(String.valueOf(amount));
		voP.setSave_detail_idx("0");
		orderDao.insertPoint(voP);
		orderDao.insertPointDetail(voP);
		orderDao.updatePointDetail(voP);
		
	}

	@Override
	public String findPointByMid(String mid) {
		return orderDao.findPointByMid(mid);
	}

	@Override
	public void insertMinusPoint(OrdersVo vo) {
		PointEventVo voP = new PointEventVo();
		int point = Integer.parseInt(vo.getPoint());
		voP.setMid(vo.getMid());
		voP.setOrder_idx(vo.getOrder_idx());
		voP.setWay("사용");
		voP.setAmount(String.valueOf(-point));
		orderDao.insertPoint(voP);
		
		List<Map<String, String>> mapPoint = orderDao.findPointGroupBySaveIdx(vo.getMid());
		
		for(Map<String, String> map : mapPoint) {
			if(point<=0) {
				break;
			}
//			int amount = Integer.parseInt(String.valueOf(map.get("amount")));
//			if(point >= amount) {
//				voP.setAmount("-"+String.valueOf(map.get("amount")));
//				voP.setSave_detail_idx(String.valueOf(map.get("save_detail_idx")));
//				orderDao.insertPointDetail(voP);
//			}
//			else if(point < amount) {
//				voP.setAmount("-"+Integer.toString(point));
//				voP.setSave_detail_idx(String.valueOf(map.get("save_detail_idx")));
//				orderDao.insertPointDetail(voP);
//			}
			
			int amount = Integer.parseInt(map.get("amount"));
			if(point >= amount) {
				voP.setAmount("-"+map.get("amount"));
				voP.setSave_detail_idx(map.get("save_detail_idx"));
				orderDao.insertPointDetail(voP);
			}
			else if(point < amount) {
				voP.setAmount("-"+Integer.toString(point));
				voP.setSave_detail_idx(map.get("save_detail_idx"));
				orderDao.insertPointDetail(voP);
			}
			point = point-amount;
		}
	}

	

	

	
}
