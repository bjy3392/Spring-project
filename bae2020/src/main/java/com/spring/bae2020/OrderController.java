package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.AdminService;
import com.spring.bae2020.service.OrderService;
import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.SubcategoryVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	String msgFlag;
	@Autowired
	OrderService orderService;
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/viewProductList/{category}", method = RequestMethod.GET)
	public String viewProductListGet(@PathVariable String category, Model model) {
		//List<ProductVo> vos  = orderService.findProductAll();
		//List<ProductVo> vosM = orderService.findProductByCategory(vos,"m");
		
		List<CategoryVo> vosC =  adminService.findCategory();
		List<ProductVo> vos = adminService.findProductByCategory(category);

		model.addAttribute("vosC", vosC);
		model.addAttribute("vos", vos);
		
		String product_code = vos.get(0).getProduct_code();
		String first_code = product_code.substring(0,product_code.lastIndexOf("-"));
		model.addAttribute("first_code", first_code);
		
		return "order/productList";
	}
	
	@RequestMapping(value="/viewOptionList/{category}", method = RequestMethod.GET)
	public String viewOptionListGet(@PathVariable String category, Model model, String product_code ) {

		//List<SubcategoryVo> vos =  adminService.findSUbcategoryBycategory(category_code);
		//List<ProductVo> vos = adminService.findOptionBySubcategory(subcategory_code);
		
		
//		List<OptionsVo> vos  = orderService.findOptionAll(); //한번에 모든 옵션을 가져와서 분류할때는 DB에 다녀오지 않고 분류
//		ProductVo prod = orderService.findProductByCode(product_code);
//		
//		List<OptionsVo> vosB = orderService.findOptionByCategory(vos,"b");
//		List<OptionsVo> vosV = orderService.findOptionByCategory(vos,"v");
//		List<OptionsVo> vosS = orderService.findOptionByCategory(vos,"s");
//		List<OptionsVo> vosA = orderService.findOptionByCategory(vos,"a");
//		
//		model.addAttribute("prod", prod);
//		model.addAttribute("vosB", vosB);
//		model.addAttribute("vosV", vosV);
//		model.addAttribute("vosS", vosS);
//		model.addAttribute("vosA", vosA);
		
		return "order/optionList";
	}

	
	@RequestMapping(value="/insertCartAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertCartAjaxPost(HttpSession session, String product, String options, String price) {
		String mid = (String)session.getAttribute("smid");
		CartVo vo = orderService.findCartByProduct(mid,product,options,price);
		
		if(vo!=null) {
			String cart_idx = vo.getCart_idx();
			String purpose = "1";
			orderService.updateCart(mid, cart_idx, purpose);
		}
		else {
			orderService.insertCart(mid,product,options,price);			
		}
		
		return "";
	}
	
	@RequestMapping(value="/viewCartList", method = RequestMethod.GET)
	public String viewCartListGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		List<CartVo> vos = orderService.findCartByMid(mid);
		model.addAttribute("vos", vos);
		
		return "order/cartList";
	}
	
	@RequestMapping(value="/updateCartAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateCartAjaxPost(HttpSession session, String cart_idx, String purpose) {
		String mid = (String)session.getAttribute("smid");
		
		orderService.updateCart(mid, cart_idx, purpose); //개수를 업데이트한다.
		
		return "";
	}
	
	@RequestMapping(value="/deleteCartAjax", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCartAjaxPost(HttpSession session, @RequestParam("arrayCartIdx[]") String[] arrayCartIdx) {
		String mid = (String)session.getAttribute("smid");
				
		orderService.deleteCartByIdx(mid, arrayCartIdx);
		
		return "";
	}
	
	
	@RequestMapping(value="/viewOrderInput", method = RequestMethod.POST)
	public String viewOrderInputPost(Model model,HttpSession session, @RequestParam("arrayCartIdx[]") String[] arrayCartIdx) {
	
		if(arrayCartIdx==null) {
			msgFlag= "notProduct";
			return "redirect:/msg/" + msgFlag;
		}
		
		String mid = (String)session.getAttribute("smid");
		List<CartVo> vos = orderService.findCartByIdx(mid, arrayCartIdx);		
	  	
		if(vos.size()<1) {
			msgFlag= "notProduct";
			return "redirect:/msg/" + msgFlag;
		}
		else {
		  	model.addAttribute("vos", vos);
		  	model.addAttribute("arrayCartIdx", arrayCartIdx);
			return "order/orderInput";
		}	
	}
	
	@RequestMapping(value="/insertOrder", method = RequestMethod.POST)
	public String insertOrderPost(Model model,HttpSession session, OrdersVo vo, String addCartIdx) {
		String mid = (String)session.getAttribute("smid");
		vo.setMid(mid);
		
		String[] arrayCartIdx = addCartIdx.split("/");
		
		orderService.insertOrders(vo);
		String order_idx = vo.getOrder_idx();
		orderService.insertItem(order_idx, arrayCartIdx);
		orderService.deleteCartByIdx(mid, arrayCartIdx); 
		
		return "order/";
	}
	
	@RequestMapping(value="/viewOrderList", method = RequestMethod.GET)
	public String viewOrderListGet(Model model,HttpSession session) {
		String mid = (String)session.getAttribute("smid");
//		if(mid==null) {
//			msgFlag= "";
//			return "redirect:/msg/" + msgFlag;
//		}
		
		List<OrdersVo> vos = orderService.findOrdersGroupByIdx("mid",mid,"not","state5");
		
		String[] arrayOrderIdx = new String[vos.size()];
		
		for(int i=0; i<vos.size(); i++) {
			OrdersVo vo = vos.get(i);
			arrayOrderIdx[i] = vo.getOrder_idx();
		}
				
		List<ItemVo> vosItem = orderService.findItemByIdx(arrayOrderIdx);
		
	  	model.addAttribute("vos", vos);
	  	model.addAttribute("vosItem", vosItem);
		
	  	
		return "order/orderList";
	}
	
	@RequestMapping(value="/deleteOrderAjax", method = RequestMethod.POST)
	@ResponseBody
	public String deleteOrderAjaxPost(HttpSession session, String order_idx) {
		String mid = (String)session.getAttribute("smid");
				
		orderService.deleteItemByIdx(order_idx);
		orderService.deleteOrderByIdx(mid, order_idx);
		
		return "";
	}

	
	@RequestMapping(value="/viewOrderEndList", method = RequestMethod.GET)
	public String viewOrderEndListGet(Model model,HttpSession session) {
		String mid = (String)session.getAttribute("smid");
//		if(mid==null) {
//			msgFlag= "";
//			return "redirect:/msg/" + msgFlag;
//		}
		
		List<OrdersVo> vos = orderService.findOrdersGroupByIdx("mid",mid,"only","state0");
		
		String[] arrayOrderIdx = new String[vos.size()];
		
		for(int i=0; i<vos.size(); i++) {
			OrdersVo vo = vos.get(i);
			arrayOrderIdx[i] = vo.getOrder_idx();
		}
				
		List<ItemVo> vosItem = orderService.findItemByIdx(arrayOrderIdx);
		
	  	model.addAttribute("vos", vos);
	  	model.addAttribute("vosItem", vosItem);
		
	  	
		return "order/orderEndList";
	}
}








