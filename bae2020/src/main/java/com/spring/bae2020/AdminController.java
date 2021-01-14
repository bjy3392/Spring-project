package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.SubcategoryVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag;

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/viewCategoryEdit", method = RequestMethod.GET)
	public String viewCategoryEditGet(Model model) {
		List<CategoryVo> vos =  adminService.findCategory();
		
		model.addAttribute("vos", vos);
		
		return "admin/categoryEdit";
	}
	
	@RequestMapping(value="/insertCategoryAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertCategoryAjaxPost(HttpSession session, String first_code, String category_name) {
		String mid = (String)session.getAttribute("smid");
		first_code = first_code.toUpperCase().trim();
		adminService.insertCategory(category_name,first_code,mid);
		 
		return "";
	}
	
	@RequestMapping(value="/updateCategoryAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateCategoryAjaxPost(String first_code, String category_name, String category_code) {
		first_code = first_code.toUpperCase().trim();
		adminService.updateCategory(category_name,first_code,category_code);
		 
		return "";
	} 
	
	@RequestMapping(value="/deleteCategoryAjax", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCategoryAjaxPost(String category_code) {
		
		adminService.deleteCategory(category_code);
		 
		return "";
	}
	
	@RequestMapping(value="/viewProductEdit", method = RequestMethod.GET)
	public String viewProductEditGet(Model model, String category_code) {
		model.addAttribute("category_code", category_code);
		
		List<ProductVo> vos = adminService.findProductByCategory(category_code);
		
		model.addAttribute("category_code", category_code);
		model.addAttribute("vos", vos);
		
		return "admin/productEdit";
	}
	
	@RequestMapping(value="/insertProductAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertProductAjaxPost(HttpSession session, MultipartFile file, ProductVo vo) {
		String mid = (String)session.getAttribute("smid");
		vo.setUser_id(mid);
		
		adminService.insertProduct(file,vo);
		
		return "";
	}
	
	@RequestMapping(value="/updateProductAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateProductAjaxPost(MultipartFile file, ProductVo vo) {
		
		adminService.updateProduct(file,vo);
		
		return "";
	}
	
	@RequestMapping(value="/deleteProductAjax", method = RequestMethod.POST)
	@ResponseBody
	public String deleteProductAjaxPost(String product_code) {
		
		adminService.deleteProduct(product_code);
		
		return "";
	}
	
	@RequestMapping(value="/viewSubcategoryEdit", method = RequestMethod.GET)
	public String viewSubcategoryEditGet(Model model, String category_code) {
		
		List<SubcategoryVo> vos =  adminService.findSubcategoryBycategory(category_code);
		
		model.addAttribute("category_code", category_code);
		model.addAttribute("vos", vos);
		
		return "admin/subcategoryEdit";
	}
	
	@RequestMapping(value="/insertSubcategoryAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertSubcategoryAjaxPost(HttpSession session, String first_code,String category_code, String subcategory_name) {
		String mid = (String)session.getAttribute("smid");
		first_code = first_code.toUpperCase().trim();
		adminService.insertSubcategory(category_code,subcategory_name,first_code,mid);
		 
		return "";
	}
	
	@RequestMapping(value="/updateSubcategoryAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateSubcategoryAjaxPost(String first_code, String subcategory_name, String subcategory_code) {
		first_code = first_code.toUpperCase().trim();
		adminService.updateSubcategory(subcategory_name,first_code,subcategory_code);	 
		  
		return "";
	}

	@RequestMapping(value="/deleteSubcategoryAjax", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSubcategoryAjaxPost(String subcategory_code) {
		
		adminService.deleteSubcategory(subcategory_code);
		 
		return "";
	}
	
	@RequestMapping(value="/viewOptionEdit", method = RequestMethod.GET)
	public String viewOptionEditGet(Model model, String subcategory_code) {
		model.addAttribute("subcategory_code", subcategory_code);
		List<OptionsVo> vos = adminService.findOptionBySubcategory(subcategory_code);
		
		model.addAttribute("subcategory_code", subcategory_code);
		model.addAttribute("vos", vos);
		
		return "admin/optionEdit";
	}
	
	@RequestMapping(value="/insertOptionAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertOptionAjaxPost(HttpSession session, MultipartFile file, OptionsVo vo) {		
		String mid = (String)session.getAttribute("smid");
		vo.setUser_id(mid);
		
		adminService.insertOption(file,vo);
		
		return "";
	}
	
	@RequestMapping(value="/updateOptionAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateOptionAjaxPost(MultipartFile file, OptionsVo vo) {
		
		adminService.updateOption(file,vo);
		
		return "";
	}
	
	@RequestMapping(value="/deleteOptionAjax", method = RequestMethod.POST)
	@ResponseBody
	public String deleteOptionAjaxPost(String option_code) {
		
		adminService.deleteOption(option_code);
		
		return "";
	}
	
}







