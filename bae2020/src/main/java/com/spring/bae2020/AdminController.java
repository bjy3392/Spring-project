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
import com.spring.bae2020.vo.ProductVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag;

	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/viewCategoryEdit", method = RequestMethod.GET)
	public String viewCategoryEditGet(Model model) {
		List<CategoryVo> vos =  adminService.findCategoryByCode("prod");
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
		
		List<ProductVo> vos = adminService.findProductByCode(category_code);
		model.addAttribute("vos", vos);
		
		return "admin/productEdit";
	}
	
	@RequestMapping(value="/insertProductAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertProductAjaxPost(HttpSession session, MultipartFile file, ProductVo vo) {
		String mid = (String)session.getAttribute("smid");
		vo.setUser_id(mid);
		System.out.println(vo);
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
		
		adminService.deleteProduc(product_code);
		
		return "";
	}
}







