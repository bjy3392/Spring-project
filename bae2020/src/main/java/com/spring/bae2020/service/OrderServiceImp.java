package com.spring.bae2020.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bae2020.dao.OrderDao;
import com.spring.bae2020.vo.OptionVo;
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

	
}
