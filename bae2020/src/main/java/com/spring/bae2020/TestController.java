package com.spring.bae2020;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.service.StoreService;
import com.spring.bae2020.vo.TestVo;
import com.spring.bae2020.vo.TimeTableVo;

@Controller
@RequestMapping("/test")
public class TestController {
	String msgFlag;

	@Autowired
	AdminService adminService;
	
	@Autowired
	StoreService storeService;

	@RequestMapping(value="/viewMapTest", method = RequestMethod.GET)
	public String viewCategoryEditGet(Model model) {
		
		
		return "test/mapTest";
	}
	
	@RequestMapping(value="/viewChartTest", method = RequestMethod.GET)
	public String viewChartTestGet(Model model) {
		
		
		return "test/analysisBarChart";
	}
	
	
	@RequestMapping(value="/findChartTest", method = RequestMethod.POST)
	@ResponseBody
	public List<TimeTableVo> findChartTestPost(Model model) {
		List<TimeTableVo> timeTable = storeService.findOrderGroupByHour("STORE-001");
		
		
		return timeTable;
	}
	
	@RequestMapping(value="/viewChartTestAddColumn", method = RequestMethod.GET)
	public String viewChartTestAddColumnGet(Model model) {
		
		
		return "test/chartTest";
	}
	
	@RequestMapping(value="/findChartTestAddColumn", method = RequestMethod.POST)
	@ResponseBody
	public List<TimeTableVo> findChartTestAddColumnPost(Model model) {
		List<TimeTableVo> dataTable = storeService.findOrderGroupByCategory("STORE-001");
		
		
		return dataTable;
	}
	
	@RequestMapping(value="/t1", method = RequestMethod.GET)
	public String t1Get() {
		TestVo vo = new TestVo();
		
		System.out.println(vo);
		
		return "";
	}
	

}
