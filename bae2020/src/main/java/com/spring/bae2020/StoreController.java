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
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.ReorderVo;
import com.spring.bae2020.vo.StockVo;
import com.spring.bae2020.vo.StoreVo;
import com.spring.bae2020.vo.TimeTableVo;
import com.spring.bae2020.vo.UserVo;

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

		if(vo==null) {
			msgFlag= "notStore";
			return "redirect:/msg/" + msgFlag;
		}
		
		String open = vo.getOpen_yn();
		String store_code = vo.getStore_code();
		
		if(open.equals("y")) {
			//당일 데이터만 가져온다.
			List<OrdersVo> vos = orderService.findOrdersGroupByIdx("store",store_code,"only",state);
			
			if(vos.size() != 0) {
				String[] arrayOrderIdx = new String[vos.size()];
				for(int i=0; i<vos.size(); i++) {
					OrdersVo orderVo = vos.get(i);
					arrayOrderIdx[i] = orderVo.getOrder_idx();
				}
				List<ItemVo> vosItem = orderService.findItemByOrderIdx(arrayOrderIdx,store_code);
				List<StockVo> stockVos = orderService.findItemStockByOption(arrayOrderIdx,store_code);
				model.addAttribute("vosItem", vosItem);
				model.addAttribute("stockVos", stockVos);			
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
	public String updateOrderByStateAjaxPost(HttpSession session, String order_idx, String state) {
		
		storeService.updateOrderByState(order_idx, state);
		if(state.equals("state-04")) {
			String mid = (String)session.getAttribute("smid");
			storeService.updateOrderByDelivery(order_idx, mid);
		}
		
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
	public String viewSalesCalendarGet(HttpSession session) {
		String mid = (String)session.getAttribute("smid");
		StoreVo vo = storeService.findStoreByMid(mid);
		if(vo==null) {
			msgFlag= "notStore";
			return "redirect:/msg/" + msgFlag;
		}
		storeService.getCalendar();
	  	return "store/salesCalendar";
	}
	
	@RequestMapping(value="/viewStockEdit", method=RequestMethod.GET)
	public String viewStockEditGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		StoreVo vo = storeService.findStoreByMid(mid);
		if(vo==null) {
			msgFlag= "notStore";
			return "redirect:/msg/" + msgFlag;
		}
		String store_code = vo.getStore_code();
		
		List<StockVo> vos = storeService.findStockBtStore(store_code);
		model.addAttribute("vos", vos);
		
		return "store/stockEdit";
	}
	
	@RequestMapping(value="/updateStockAjax", method = RequestMethod.POST)
	@ResponseBody
	public String updateStockAjaxxPost(String quantity, String option_code, String store) {
		
		storeService.updateStock(quantity, option_code, store);
		
		return "";
	}
	
	@RequestMapping(value="/viewCancelInput", method=RequestMethod.GET)
	public String viewCancleInputGet(Model model, String order_idx) {
		
		model.addAttribute("order_idx", order_idx);
		
	  	return "store/cancelInput";
	}
	
	@RequestMapping(value="/insertCancel", method=RequestMethod.POST)
	public String insertCancelPost(String order_idx, String cancel) {
		
		storeService.updateOrderByState(order_idx, "state-06"); 
		storeService.updateOrderByCancel(order_idx, cancel);

		OrdersVo vo = orderService.findOrderByIdx(order_idx);
		if(vo.getPoint().equals("0")  && Integer.parseInt(vo.getTotal()) >= 10000) {
			//적립취소 vo.getTotal() * 0.1 를 Minus
			orderService.insertMinusPointByCancel(vo);
		}
		else if(!vo.getPoint().equals("0")){
			//vo.getPoint() 다시 적립
			orderService.insertPointByCancel(vo);
		}
		
	  	return "store/cancelInput";
	}
	
	@RequestMapping(value="/viewAnalysisChart", method = RequestMethod.GET)
	public String viewAnalysisChartGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		StoreVo vo = storeService.findStoreByMid(mid);
		
		model.addAttribute("store", vo.getStore_code());
		
		return "store/analysisChart";
	}
	
	
	@RequestMapping(value="/findChart", method = RequestMethod.POST)
	@ResponseBody
	public List<TimeTableVo> findChartTestPost(String store) {
		List<TimeTableVo> timeTable = storeService.findOrderGroupByHour(store);
		
		
		return timeTable;
	}
	
	@RequestMapping(value="/findChartByCategory", method = RequestMethod.POST)
	@ResponseBody
	public List<TimeTableVo> findChartByCategoryPost(String store) {
		List<TimeTableVo> dataTable = storeService.findOrderGroupByCategory(store);
		
		
		return dataTable;
	}
	
	@RequestMapping(value="/findPieChart", method = RequestMethod.POST)
	@ResponseBody
	public List<CategoryVo> findPieChartPost(String store) {
		List<CategoryVo> dataTable = storeService.findPieChar(store);
		
		
		return dataTable;
	}
	
	@RequestMapping(value="/findOrderGroupByProduct", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductVo> findOrderGroupByProductPost(String store, String category) {
		List<ProductVo> dataTable = storeService.findOrderGroupByProduct(store, category);
		
		return dataTable;
	}
	
	@RequestMapping(value="/viewUserChart", method = RequestMethod.GET)
	public String viewUserChartGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("smid");
		StoreVo vo = storeService.findStoreByMid(mid);
		
		model.addAttribute("store", vo.getStore_code());
		
		return "store/userChart";
	}
	
	@RequestMapping(value="/findUserByStore", method = RequestMethod.POST)
	@ResponseBody
	public List<ReorderVo> findUserByStorePost(String store) {
		List<ReorderVo> dataTable = storeService.findUserByStore(store);
		
		return dataTable;
	}
	
	@RequestMapping(value="/findUserByOrderCnt", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> findUserByOrderCntPost(String store) {
		List<UserVo> dataTable = storeService.findUserByOrderCnt(store);
		
		return dataTable;
	}
}





