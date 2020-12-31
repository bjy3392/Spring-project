package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.OrderService;
import com.spring.bae2020.vo.CartVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	String msgFlag;
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="/viewProductList", method = RequestMethod.GET)
	public String viewProductListGet(Model model) {
		List<ProductVo> vos  = orderService.findProductAll();
		List<ProductVo> vosM = orderService.findProductByCategory(vos,"m");
		
		model.addAttribute("vos", vosM);
		
		return "order/productList";
	}
	
	@RequestMapping(value="/viewOptionList", method = RequestMethod.GET)
	public String viewOptionListGet(Model model, String product_code ) {

		List<OptionVo> vos  = orderService.findOptionAll(); //한번에 모든 옵션을 가져와서 분류할때는 DB에 다녀오지 않고 분류
		ProductVo prod = orderService.findProductByCode(product_code);
		
		List<OptionVo> vosB = orderService.findOptionByCategory(vos,"b");
		List<OptionVo> vosV = orderService.findOptionByCategory(vos,"v");
		List<OptionVo> vosS = orderService.findOptionByCategory(vos,"s");
		List<OptionVo> vosA = orderService.findOptionByCategory(vos,"a");
		
		model.addAttribute("prod", prod);
		model.addAttribute("vosB", vosB);
		model.addAttribute("vosV", vosV);
		model.addAttribute("vosS", vosS);
		model.addAttribute("vosA", vosA);
		
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
		
		List<ItemVo> vos = orderService.findItemGroupByIdx(mid);
		List<ItemVo> vosItem = orderService.findItemByMid(mid);
		
	  	model.addAttribute("vos", vos);
	  	model.addAttribute("vosItem", vosItem);
		
	  	
		return "order/orderList";
	}
	
	
}








