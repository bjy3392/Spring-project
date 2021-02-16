package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bae2020.service.DeliveryService;
import com.spring.bae2020.vo.OrdersVo;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

	@Autowired
	DeliveryService deliveryService;
	
	@RequestMapping(value="/viewDeliveryList/{state}", method = RequestMethod.GET)
	public String viewCategoryEditGet(@PathVariable String state, HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		
		List<OrdersVo> vos = deliveryService.findOrderByOnlyDelivery(state,mid);		
		
		model.addAttribute("vos", vos);
		
		return "delivery/deliveryList";
	}
}
