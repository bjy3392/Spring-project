package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ProductVo;

public interface AdminDao {

	void insertCategory(@Param("category_name")String category_name, @Param("first_code")String first_code, @Param("mid")String mid);

	List<CategoryVo> findCategoryByCode(@Param("code")String code);

	void updateCategory(@Param("category_name")String category_name, @Param("first_code")String first_code, @Param("category_code")String category_code);

	void deleteCategory(@Param("category_code")String category_code);

	String findProductCodeByCode(@Param("category_code")String category_code);

	void insertProduct(@Param("vo")ProductVo vo);

	List<ProductVo> findProductByCode(@Param("category_code")String category_code);

	void updateProduct(@Param("vo")ProductVo vo);

	void deleteProduct(@Param("product_code")String product_code);

}
