package com.spring.bae2020;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bae2020.service.AdminService;

@Controller
@RequestMapping("/test")
public class TestController {
	String msgFlag;

	@Autowired
	AdminService adminService;

	@RequestMapping(value="/viewMapTest", method = RequestMethod.GET)
	public String viewCategoryEditGet(Model model) {
		
		
		return "test/mapTest";
	}
}
