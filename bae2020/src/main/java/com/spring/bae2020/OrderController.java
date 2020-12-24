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
import com.spring.bae2020.vo.OptionVo;
import com.spring.bae2020.vo.OrderDetailVo;
import com.spring.bae2020.vo.OrderVo;
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
	public String productOrderGet(Model model, String product_code ) {

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
		
		return "order/productOrder";
	}

	
	@RequestMapping(value="/insertOrderAjax", method = RequestMethod.POST)
	@ResponseBody
	public String insertOrderAjaxPost(@RequestParam(value="orderId", required = false, defaultValue ="") String orderId,
									  String prod_code, String options, String price, String mid) {
		
		//주문창에서 접근할 경우 : 장바구니 유무 확인 후 삽입 및 업데이트
		if(orderId.equals("")) {
			OrderVo vo = orderService.findOrderByIdandState(mid, "0"); //같은아이디 중 장바구니인 상태가 있나 없나 검색		
			if(vo == null) {
				orderService.insertOrder(mid,price,"0");  //장바구니 상태인 주문을 추가 return 값을 orderid을 가져올까???,, 
				vo = orderService.findOrderByIdandState(mid, "0");  //이 함수가 재사용 가능성이 있어서 따로 뺏음..
				orderId = vo.getOrder_id();
			}else {
				orderId = vo.getOrder_id();
				orderService.updateOrder(orderId,mid,price,"0"); //가격을 업데이트한다.
			}
		}
		//장바구니에 insert를 실행하는 경우 : 장바구니가 무조건 있는 경우이므로 확인이 필요없음
		else {
			orderService.updateOrder(orderId,mid,price,"0"); //가격을 업데이트한다.
		}
		
		orderService.insertOrderDetail(orderId,prod_code,price,options);
		
		return "";
	}
	
	
	@RequestMapping(value="/deleteOrderAjax", method = RequestMethod.POST)
	@ResponseBody
	public String deleteOrderAjaxPost(String orderId, String prod_code, String options, String price, String mid) {

		String subPrice = "-"+price;
		orderService.updateOrder(orderId,mid,subPrice,"0"); //가격을 업데이트한다.
		orderService.deleteOrderDetail(orderId,prod_code,options);
		
		return "";
	}
	
	@RequestMapping(value="/cartList", method = RequestMethod.GET)
	public String cartListGet(HttpSession session, Model model) {
		String orderId;
		String mid = (String)session.getAttribute("smid");
		OrderVo vo = orderService.findOrderByIdandState(mid, "0");
		if(vo != null) {
			orderId = vo.getOrder_id();
			List<OrderDetailVo> vos = orderService.findOrderDetailByOrderId(orderId);
			model.addAttribute("orderId", orderId);
			model.addAttribute("vos", vos);
		}
		
		return "order/cartList";
	}
	
	@RequestMapping(value="/orderInput", method = RequestMethod.GET)
	public String orderInputtGet(Model model) {
		
		
		
		return "order/orderInput";
	}
}








