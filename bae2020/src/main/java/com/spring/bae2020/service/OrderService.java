package com.spring.bae2020.service;

import java.util.List;

import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.ProductVo;

public interface OrderService {

	List<ProductVo> findProductAll();

	List<ProductVo> findProductByCategory(List<ProductVo> vos, String category);

	List<OptionVo> findOptionAll();

	List<OptionVo> findOptionByCategory(List<OptionVo> vos, String category);


}
