package com.spring.bae2020;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.bae2020.service.OrderService;
import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.ProductVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="/productList", method = RequestMethod.GET)
	public String productListGet(Model model) {
		List<ProductVo> vos  = orderService.findProductAll();
		List<ProductVo> vosM = orderService.findProductByCategory(vos,"m");
		
		model.addAttribute("vos", vosM);
		
		return "order/productList";
	}
	
	@RequestMapping(value="/productOrder", method = RequestMethod.GET)
	public String productOrderGet(Model model, ProductVo vo ) {

		List<OptionVo> vos  = orderService.findOptionAll();

		List<OptionVo> vosB = orderService.findOptionByCategory(vos,"b");
		List<OptionVo> vosV = orderService.findOptionByCategory(vos,"v");
		List<OptionVo> vosS = orderService.findOptionByCategory(vos,"s");
		List<OptionVo> vosA = orderService.findOptionByCategory(vos,"a");

		model.addAttribute("vo", vo);
		model.addAttribute("vosB", vosB);
		model.addAttribute("vosV", vosV);
		model.addAttribute("vosS", vosS);
		model.addAttribute("vosA", vosA);
		
		return "order/productOrder";
	}
	
	@RequestMapping(value="/productOrder", method = RequestMethod.POST)
	public String productOrderPost(String menu, String option) {
		System.out.println(menu);
		System.out.println(option);
		return "";
	}
	
}








