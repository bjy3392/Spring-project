package com.spring.bae2020.dao;

import java.util.List;

import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.ProductVo;

public interface OrderDao {

	List<ProductVo> findProductAll();

	List<OptionVo> findOptionAll();


}
