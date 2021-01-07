package com.spring.bae2020.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ProductVo;

public interface AdminService {

	void insertCategory(String category_name, String first_code, String mid);

	List<CategoryVo> findCategoryByCode(String string);

	void updateCategory(String category_name, String first_code, String category_code);

	void deleteCategory(String category_code);

	void insertProduct(MultipartFile file, ProductVo vo);

	List<ProductVo> findProductByCode(String category_code);

	void updateProduct(MultipartFile file, ProductVo vo);

	void deleteProduc(String product_code);

}
