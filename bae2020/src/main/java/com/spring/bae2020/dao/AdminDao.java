package com.spring.bae2020.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.bae2020.vo.AskManagerVo;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.StoreVo;
import com.spring.bae2020.vo.SubcategoryVo;
import com.spring.bae2020.vo.UserVo;

public interface AdminDao {

	List<CategoryVo> findCategory();

	void insertCategory(@Param("category_name")String category_name, @Param("first_code")String first_code, @Param("mid")String mid);

	void updateCategory(@Param("category_name")String category_name, @Param("first_code")String first_code, @Param("category_code")String category_code);

	void deleteCategory(@Param("category_code")String category_code);

	String findProductCodeByCategory(@Param("category_code")String category_code);

	void insertProduct(@Param("vo")ProductVo vo);

	List<ProductVo> findProductByCategory(@Param("category_code")String category_code);

	void updateProduct(@Param("vo")ProductVo vo);

	void deleteProduct(@Param("product_code")String product_code);

	List<SubcategoryVo> findSubcategoryByCategory(@Param("category_code")String category_code);

	void insertSubcategory(@Param("category_code")String category_code, @Param("subcategory_name")String subcategory_name, @Param("first_code")String first_code, @Param("mid")String mid);

	void updateSubcategory(@Param("subcategory_name")String subcategory_name,@Param("first_code") String first_code, @Param("subcategory_code")String subcategory_code);

	void deleteSubcategory(@Param("subcategory_code")String subcategory_code);

	List<OptionsVo> findOptionBySubcategory(@Param("subcategory_code")String subcategory_code, @Param("store_code")String store_code);

	String findOptionCodeeByCategory(@Param("subcategory_code")String subcategory_code);

	void insertOption(@Param("vo")OptionsVo vo);

	void updateOption(@Param("vo")OptionsVo vo);

	ProductVo findProductByCode(@Param("product_code")String product_code);

	void deleteOption(@Param("option_code")String option_code);

	List<StoreVo> findStore();

	void insertStore(@Param("vo")StoreVo vo);

	List<AskManagerVo> findAskManager();

	void updateAskManager(@Param("ask_idx")String ask_idx, @Param("pass_yn")String pass_yn);

	void updateStore(@Param("column")String column, @Param("condition")String condition, @Param("store_code")String store_code);

	StoreVo findStoreByCode(@Param("store_code")String store_code);

	OptionsVo findOptionByCode(@Param("option_code")String option_code);

	int totUserRecCnt();

	List<UserVo> findUser(@Param("startNo")int startNo, @Param("pageSize")int pageSize);

	void insertStockinit(@Param("vo")StoreVo vo);

	
}
