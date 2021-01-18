package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.StoreService;
import com.spring.bae2020.vo.OrdersVo;

@Controller
@RequestMapping("/store")
public class StoreController {
	String msgFlag = "";
	
	@Autowired
	StoreService storeService;

	@RequestMapping(value="/viewStoreOrderList", method = RequestMethod.GET)
	public String viewCategoryEditGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		
		//String store = storeService.findStoreByMid();
		
		List<OrdersVo> vos = storeService.findOrderByMid(mid); 
		
		model.addAttribute("vos", vos);
		
		return "store/storeOrderList";
	}
	
	@RequestMapping(value="/updateOrderByStateAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateOrderByStateAjaxPost(String order_idx) {
		
		storeService.updateOrderByState(order_idx, "state-02");
		
		return "";
	}
	
}
