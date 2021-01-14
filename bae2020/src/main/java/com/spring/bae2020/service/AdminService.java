package com.spring.bae2020.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.SubcategoryVo;

public interface AdminService {
	
	List<CategoryVo> findCategory();

	void insertCategory(String category_name, String first_code, String mid);

	void updateCategory(String category_name, String first_code, String category_code);

	void deleteCategory(String category_code);

	void insertProduct(MultipartFile file, ProductVo vo);

	List<ProductVo> findProductByCategory(String category_code);

	void updateProduct(MultipartFile file, ProductVo vo);

	void deleteProduct(String product_code);

	List<SubcategoryVo> findSubcategoryBycategory(String category_code);

	void insertSubcategory(String category_code, String subcategory_name, String first_code, String mid);

	void updateSubcategory(String subcategory_name, String first_code, String subcategory_code);

	void deleteSubcategory(String subcategory_code);

	List<OptionsVo> findOptionBySubcategory(String subcategory_code);

	void insertOption(MultipartFile file, OptionsVo vo);

	void updateOption(MultipartFile file, OptionsVo vo);

	ProductVo findProductByCode(String product_code);

	void deleteOption(String option_code);

}
