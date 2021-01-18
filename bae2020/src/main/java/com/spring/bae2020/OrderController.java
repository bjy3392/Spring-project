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
import com.spring.bae2020.vo.OptionsVo;
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
		
		List<CategoryVo> vosC =  adminService.findCategory();
		List<ProductVo> vos = adminService.findProductByCategory(category);

		model.addAttribute("vosC", vosC);
		model.addAttribute("vos", vos);
		model.addAttribute("category", category);
		
		return "order/productList";
	}
	
	@RequestMapping(value="/viewOptionList/{category}", method = RequestMethod.GET)
	public String viewOptionListGet(@PathVariable String category, Model model, String product_code ) {
		List<SubcategoryVo> vosS =  adminService.findSubcategoryByCategory(category);
		ProductVo voP = adminService.findProductByCode(product_code);
		
		for(int i=0; i<vosS.size(); i++) {
			SubcategoryVo vo = vosS.get(i);
			String subcategory_code = vo.getSubcategory_code();
			List<OptionsVo> vos = adminService.findOptionBySubcategory(subcategory_code);
			
			String option_code = vos.get(0).getOption_code();
			String first_code = option_code.substring(0,option_code.lastIndexOf("-"));			
			
			model.addAttribute(first_code+"vos", vos);
		}
		model.addAttribute("voP", voP);
		model.addAttribute("category_code", category);
		
		
		return "order/optionList";
	}

	
	@RequestMapping(value="/insertCartAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertCartAjaxPost(HttpSession session, CartVo vo) {
		String mid = (String)session.getAttribute("smid");
		vo.setMid(mid);
		CartVo voCheck = orderService.findCartByProduct(vo); //장바구니에 같은 제품이 있나 확인
		
		if(voCheck!=null) {
			String cart_idx = voCheck.getCart_idx();
			String purpose = "1";
			orderService.updateCart(mid, cart_idx, purpose);
		}
		else {
			orderService.insertCart(vo);			
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
	
	
	@RequestMapping(value="/viewOrderInput/{route}", method = RequestMethod.POST)
	public String viewOrderInputPost(@PathVariable String route, Model model,HttpSession session,
									@RequestParam(value="arrayIdx[]", required = false) String[] arrayIdx,
									@RequestParam(value="order_idx", required = false) String order_idx) {
	
		if(arrayIdx==null && order_idx.equals("")) {
			msgFlag= "notProduct";
			return "redirect:/msg/" + msgFlag;
		}
		
		List<ItemVo> vos = orderService.findItem(route,arrayIdx,order_idx);
		
		if(arrayIdx == null){
		  	arrayIdx = new String[vos.size()];
			for(int i=0; i<vos.size(); i++) {
				ItemVo vo = vos.get(i);
				arrayIdx[i] = vo.getItem_idx();
			}
		}
		
		if(vos.size()<1) {
			msgFlag= "notProduct";
			return "redirect:/msg/" + msgFlag;
		}
		else {
		  	model.addAttribute("vos", vos);	
		  	model.addAttribute("route", route);
		  	model.addAttribute("arrayIdx", arrayIdx);
		}
	  	
		return "order/orderInput";
	}
	
	@RequestMapping(value="/insertOrder/{route}", method = RequestMethod.POST)
	public String insertOrderPost(@PathVariable String route, Model model,HttpSession session, OrdersVo vo, String addIdx) {
		if(addIdx==null || addIdx.equals("")) {
			msgFlag= "notProduct";
			return "redirect:/msg/" + msgFlag;
		}
		
		String mid = (String)session.getAttribute("smid");
		vo.setMid(mid);
		
		String[] arrayIdx = addIdx.split("/");
		
		orderService.insertOrders(vo);
		String order_idx = vo.getOrder_idx();
		
		if(route.equals("cart")) {
			orderService.insertItemFromCart(order_idx, arrayIdx);
			orderService.deleteCartByIdx(mid, arrayIdx); 
		}
		else {
			orderService.insertItemFromItem(order_idx, arrayIdx);
		}
		
		return "order/orderInputOk";
	}
	
	@RequestMapping(value="/viewOrderList", method = RequestMethod.GET)
	public String viewOrderListGet(Model model,HttpSession session) {
		String mid = (String)session.getAttribute("smid");
		
		List<OrdersVo> vos = orderService.findOrdersGroupByIdx("mid",mid,"not","state-04");
		
		
		if(vos.size() != 0) {
			String[] arrayOrderIdx = new String[vos.size()];
			
			for(int i=0; i<vos.size(); i++) {
				OrdersVo vo = vos.get(i);
				arrayOrderIdx[i] = vo.getOrder_idx();
			}
					
			List<ItemVo> vosItem = orderService.findItemByOrderIdx(arrayOrderIdx);
			model.addAttribute("vosItem", vosItem);
		}
		
	  	model.addAttribute("vos", vos);
		
	  	
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
		
		List<OrdersVo> vos = orderService.findOrdersGroupByIdx("mid",mid,"only","state-04");
		
	  	model.addAttribute("vos", vos);
		
		return "order/orderEndList";
	}


	
}








