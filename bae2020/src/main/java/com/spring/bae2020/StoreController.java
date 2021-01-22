package com.spring.bae2020;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.bae2020.service.OrderService;
import com.spring.bae2020.service.StoreService;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.StoreVo;

@Controller
@RequestMapping("/store")
public class StoreController {
	String msgFlag = "";
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	OrderService orderService;

	@RequestMapping(value="/viewStoreOrderList/{state}", method = RequestMethod.GET)
	public String viewStoreOrderListGet(@PathVariable String state, HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		
		StoreVo vo = storeService.findStoreByMid(mid);

		String open = vo.getOpen_yn();
		String store_code = vo.getStore_code();
		
		if(open.equals("y")) {
			List<OrdersVo> vos = orderService.findOrdersGroupByIdx("store",store_code,"only",state);
			
			if(vos.size() != 0) {
				String[] arrayOrderIdx = new String[vos.size()];
				for(int i=0; i<vos.size(); i++) {
					OrdersVo orderVo = vos.get(i);
					arrayOrderIdx[i] = orderVo.getOrder_idx();
				}
				List<ItemVo> vosItem = orderService.findItemByOrderIdx(arrayOrderIdx);
				model.addAttribute("vosItem", vosItem);
			}		
			model.addAttribute("vos", vos);			
		}
		
		model.addAttribute("open", open);
		model.addAttribute("store", store_code);
		model.addAttribute("state", state);
		
		return "store/storeOrderList";
	}
	
	@RequestMapping(value="/updateOrderByStateAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateOrderByStateAjaxPost(String order_idx, String state) {
		
		storeService.updateOrderByState(order_idx, state);
		
		return "";
	}
	
	@RequestMapping(value="/updateStoreByOpenAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateStoreByOpenAjaxPost(String store_code, String open_yn) {
		
		storeService.updateStoreByOpen(store_code, open_yn);
		
		return "";
	}
	
	@RequestMapping(value="/viewDeliveryOrderList", method = RequestMethod.GET)
	public String viewDeliveryOrderListGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		
		StoreVo vo = storeService.findStoreByMid(mid);

		String open = vo.getOpen_yn();
		String store_code = vo.getStore_code();
		
		if(open.equals("y")) {
			List<OrdersVo> vos = storeService.findOrderByDeliveryState(store_code);
			
			model.addAttribute("vos", vos);			
		}
		
		model.addAttribute("open", open);
		model.addAttribute("store", store_code);
		
		return "store/deliveryOrderList";
	}
	
	@RequestMapping(value="/viewSalesCalendar", method=RequestMethod.GET)
	  public String viewSalesCalendarGet() {
		storeService.getCalendar();
	  	return "store/salesCalendar";
	  }
}
