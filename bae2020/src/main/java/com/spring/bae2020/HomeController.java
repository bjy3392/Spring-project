package com.spring.bae2020;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ProductVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	AdminService adminService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		List<CategoryVo> vosC =  adminService.findCategory();
		List<ProductVo> vos = adminService.findProductByCategory("PROD-001");
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("vosC", vosC );
		model.addAttribute("vos", vos );
		
		return "home";
	}
	
	@RequestMapping(value="/findProductByCategoryAjax", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductVo> findProductByCategoryAjaxPost(String category_code) {

		List<ProductVo> vos = adminService.findProductByCategory(category_code);
		
		return vos;
	}
	
}
