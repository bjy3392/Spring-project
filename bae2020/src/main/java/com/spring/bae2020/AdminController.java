package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.service.UserService;
import com.spring.bae2020.vo.AskManagerVo;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.StoreVo;
import com.spring.bae2020.vo.SubcategoryVo;
import com.spring.bae2020.vo.UserVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag;

	@Autowired
	AdminService adminService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/viewCategoryEdit", method = RequestMethod.GET)
	public String viewCategoryEditGet(Model model) {
		List<CategoryVo> vos =  adminService.findCategory();
		
		model.addAttribute("vos", vos);
		
		return "admin/product/categoryEdit";
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
		
		return "admin/product/productEdit";
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
		
		List<SubcategoryVo> vos =  adminService.findSubcategoryByCategory(category_code);
		
		model.addAttribute("category_code", category_code);
		model.addAttribute("vos", vos);
		
		return "admin/product/subcategoryEdit";
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
		
		return "admin/product/optionEdit";
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
	
	@RequestMapping(value="/viewStoreList", method = RequestMethod.GET)
	public String viewStoreListGet(Model model) {
		List<StoreVo> vos =  adminService.findStore();
		
		model.addAttribute("vos", vos);
		
		return "admin/store/storeList";
	}
	
	@RequestMapping(value="/viewStoreInput", method = RequestMethod.GET)
	public String viewStoreInputGet() {
		return "admin/store/storeInput";
	}
	
	@RequestMapping(value="/insertStore", method = RequestMethod.POST)
	public String insertStorePost(StoreVo vo) {
		adminService.insertStore(vo);
		msgFlag= "insertStoreOk";
		
		return "redirect:/msg/" + msgFlag;
	}
	
	@RequestMapping(value="/updateStore", method = RequestMethod.POST)
	@ResponseBody
	public String updateStorePost(String column, String condition, String store_code) {
		adminService.updateStore(column, condition, store_code);
		
		return "";
	}
	
	@RequestMapping(value="/viewStoreInfo", method = RequestMethod.GET)
	public String viewStoreGet(Model model, String store_code) {
		StoreVo vo = adminService.findStoreByCode(store_code);
		
		model.addAttribute("vo", vo);
		
		return "admin/store/storeInfo";
	}
	
	@RequestMapping(value="/viewManagerList", method = RequestMethod.GET)
	public String viewManagerListGet(Model model) {
		List<UserVo> vos = userService.findUserByLevel("level-05");

		model.addAttribute("vos", vos);
		
		return "admin/manager/managerList";
	}
	
	@RequestMapping(value="/viewAskManagerList", method = RequestMethod.GET)
	public String viewAskManagerListGet(Model model) {
		List<AskManagerVo> vos = adminService.findAskManager();
		
		model.addAttribute("vos", vos);
		
		return "admin/manager/askManagerList";
	}
	
	@RequestMapping(value="/updateAskManagerAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateAskManagerAjaxPost(String ask_idx, String pass_yn, String mid) {
		
		adminService.updateAskManager(ask_idx,pass_yn);
		
		if(pass_yn.equals("y")) {
			userService.updateUserByLevel(mid,"level-05");
		}
		
		return "";
	}
	
	@RequestMapping(value="/updateUserByLevelAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateUserByLevelAjaxPost(String mid) {
		
		userService.updateUserByLevel(mid,"level-01");
		
		return "";
	}
	
	@RequestMapping(value="/viewManagerSimpleList", method = RequestMethod.GET)
	public String viewManagerSimpleListGet(Model model, String store_code) {
		List<UserVo> vos = userService.findUserByLevel("level-05");

		model.addAttribute("store_code", store_code);
		model.addAttribute("vos", vos);
		
		return "admin/manager/managerSimpleList";
	}
	
	@RequestMapping(value="/findUserByNameAjax", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> findUserByNameAjaxPost(String name) {
		
		List<UserVo> vos = userService.findUserByName(name);
		
		return vos;
	}
	
	@RequestMapping(value="/viewImageShow", method = RequestMethod.GET)
	public String viewImageShowGet(Model model, String code, String classify) {
		
		if(classify.equals("prod")) {
			ProductVo vo = adminService.findProductByCode(code);
			model.addAttribute("vo", vo);
			model.addAttribute("classify", classify);
		}
		else if(classify.equals("opt")) {
			OptionsVo vo = adminService.findOptionByCode(code);
			model.addAttribute("vo", vo);
			model.addAttribute("classify", classify);
		}
		
		return "admin/product/ImageShow";
	}

	@RequestMapping(value="/viewUserList", method = RequestMethod.GET)
	public String viewUserListGet(HttpServletRequest request, Model model) {
		// 페이징처리 준비 시작...
		int totRecCnt = adminService.totUserRecCnt();  // 총레코드건수 구하기
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize")); // 한페이지 분량
		int blockSize = 3; // 한개 블록의 크기는 3으로 지정
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));  // 현재 페이지 번호
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize : (int)(totRecCnt/pageSize) + 1; // 총페이지 수
		int startNo = (pag - 1) * pageSize; // 시작 인덱스 번호
		int curScrNo = totRecCnt - startNo; // 해당 페이지의 시작문항의 번호
		// 이까지 페이징 처리 준비 완료..
		
		
		List<UserVo> vos = adminService.findUser(startNo,pageSize);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("pag", pag);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrNo", curScrNo);
		
		return "admin/user/userList";
	}
}







