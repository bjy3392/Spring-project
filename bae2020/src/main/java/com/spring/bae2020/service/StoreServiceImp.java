package com.spring.bae2020.service;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.bae2020.dao.StoreDao;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.ItemVo;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.ReorderVo;
import com.spring.bae2020.vo.StockVo;
import com.spring.bae2020.vo.StoreVo;
import com.spring.bae2020.vo.TimeTableVo;
import com.spring.bae2020.vo.UserVo;

@Service
public class StoreServiceImp implements StoreService {
	@Autowired
	StoreDao storeDao;

	@Override
	public StoreVo findStoreByMid(String mid) {
		return storeDao.findStoreByMid(mid);
	}

	@Override
	public void updateOrderByState(String order_idx, String state) {
		if(state.equals("state-02")) {
			List<Map<String, String>> hm = storeDao.findOrderOptionGroupByCode(order_idx);
			for(Map<String, String> map :hm) {
				storeDao.updateStockByOption(String.valueOf(map.get("cnt")),map.get("option_code"),map.get("store"));
			}
		}
		storeDao.updateOrderByState(order_idx, state);
	}

	@Override
	public void updateStoreByOpen(String store_code, String open_yn) {
		storeDao.updateStoreByOpen(store_code, open_yn);
	}

	@Override
	public List<OrdersVo> findOrderByDeliveryState(String store_code) {
		return storeDao.findOrderByDeliveryState(store_code);
	}

	@Override
	public void getCalendar() {
		 	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest(); // AOP에서 request객체를 사용(선언)하기위한 방법
		    HttpSession session = request.getSession();
		    String mid = (String) session.getAttribute("smid");
				
				// 오늘날짜를 설정(저장)
			Calendar calToday = Calendar.getInstance();
			int toYear = calToday.get(Calendar.YEAR);
			int toMonth = calToday.get(Calendar.MONTH);
			int toDay = calToday.get(Calendar.DATE);
			
			// 화면에 출력할 달력 날자를 셋팅(해당 년/월)
			Calendar calView = Calendar.getInstance();
			int yy = request.getParameter("yy")==null? calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
			int mm = request.getParameter("mm")==null? calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
			
			if(mm < 0) { // 1월에서 '전월'버튼을 클릭한 경우
				yy--;
				mm = 11;
			}
			if(mm > 11) { // 12월에서 '다음월'버튼을 클릭한 경우
				yy++;
				mm=0;
			}
			calView.set(yy,mm,1);  // 해당 년/월의 첫날로 설정한다.
			
			int startWeek = calView.get(Calendar.DAY_OF_WEEK); // 해당 년월의 1일에 해당되는 요일값(숫자)을 가져온다.
			int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);  // 해당월의 마지막일을 구한다.
			
			// 화면에 보여줄 '전년도/전월,다음년도/다음월'의 값을 구하기위한 변수 설정
			int preYear = yy; // 전년도
			int preMonth = mm - 1; // 전월
			int nextYear = yy; // 다음년도
			int nextMonth = mm + 1; // 다음월
			
			// 1월에서 전월버튼을 클릭하게되면 12월로 이동시킨다.
			if(preMonth == -1) {
				preYear--;
				preMonth = 11;
			}
			
			// 12월에서 다음월버튼을 클릭하게되면 1월로 이동시킨다.
			if(nextMonth == 12) {
				nextYear++;
				nextMonth = 0;
			}
			
			// 이전월 달력저장
			Calendar calPre = Calendar.getInstance();
			calPre.set(preYear,preMonth,1);  // 이전월의 첫날로 셋팅
			int preLastDay = calPre.getActualMaximum(Calendar.DAY_OF_MONTH); // 이전월의 마지막날을 구한다.
			
			// 다음월 달력저장
			Calendar calNext = Calendar.getInstance();
			calNext.set(nextYear,nextMonth,1);  // 이전월의 첫날로 셋팅
			int nextStartWeek = calNext.get(Calendar.DAY_OF_WEEK); // 다음달의 1일에 해당하는 요일값을 얻어온다.
			
			// 화면에 표시할 해달월 해당일자의 각각의 제목을 배열에 담아서 넘긴다.
			String[] memoryArr = new String[lastDay];
			String ymd = "";
			String memory = "";
			DecimalFormat df = new DecimalFormat("#,###");
			int total =0;				
			for(int i=0; i<lastDay; i++) {
				ymd = yy + "-" + (mm+1) + "-" + (i+1);
				List<ItemVo> vos = storeDao.findItemGroupByProduct(mid, ymd);
				for(ItemVo vo : vos) {
					int sum_price = Integer.parseInt(vo.getSum_price());
					memory += vo.getCategory_name() + " : " + df.format(sum_price) + "<br/>";
					total += sum_price;
				}
				memory += "<br/>---총 매출" + ":" + df.format(total) +"---";
				memoryArr[i] = memory;
				memory ="";
				total =0;
			}
			
			// 해당 달의 memoryArr을 저장한다.
			request.setAttribute("memoryArr", memoryArr);
			
			// 오늘 기준날자의 달력을 저장한다.
			request.setAttribute("toYear", toYear);
			request.setAttribute("toMonth", toMonth);
			request.setAttribute("toDay", toDay);
			
			// 화면에 보여줄 해당 달력 저장
			request.setAttribute("yy", yy);
			request.setAttribute("mm", mm);
			request.setAttribute("startWeek", startWeek);
			request.setAttribute("lastDay", lastDay);
			
			// 화면에 보여줄 해당 달력기준으로 전년도/전월, 다음년도/다음월
			request.setAttribute("preYear", preYear);
			request.setAttribute("preMonth", preMonth);
			request.setAttribute("preLastDay", preLastDay);
			request.setAttribute("nextYear", nextYear);
			request.setAttribute("nextMonth", nextMonth);
			request.setAttribute("nextStartWeek", nextStartWeek);
		
	}

	@Override
	public List<StockVo> findStockBtStore(String store_code) {
		return storeDao.findStockBtStore(store_code);
	}

	@Override
	public void updateStock(String quantity, String option_code, String store) {
		storeDao.updateStock(quantity,option_code,store);		
	}

	@Override
	public void updateOrderByCancel(String order_idx, String cancel) {
		storeDao.updateOrderByCancel(order_idx,cancel);				
	}

	@Override
	public List<TimeTableVo> findOrderGroupByHour(String store) {
		
		//List<TimeTableVo> timeTable = storeDao.findOrderGroupByHour(store);
		
		return storeDao.findOrderGroupByHour(store);			
	}

	@Override
	public List<TimeTableVo> findOrderGroupByCategory(String store) {
		//List<TimeTableVo> dataTable = storeDao.findOrderGroupByCategory(store);
	
		return storeDao.findOrderGroupByCategory(store);	
	}

	@Override
	public List<CategoryVo> findPieChar(String store) {
		//List<CategoryVo> dataTable = storeDao.findPieChar(store);
	
		return storeDao.findPieChar(store);	
	}

	@Override
	public List<ProductVo> findOrderGroupByProduct(String store, String category) {
		//List<ProductVo> dataTable = ;
	
		return storeDao.findOrderGroupByProduct(store,category);
	}

	@Override
	public List<ReorderVo> findUserByStore(String store) {
		return storeDao.findUserByStore(store);
	}

	@Override
	public List<UserVo> findUserByOrderCnt(String store) {
		return storeDao.findUserByOrderCnt(store);
	}

	@Override
	public void updateOrderByDelivery(String order_idx, String mid) {
		storeDao.updateOrderByDelivery(order_idx,mid);		
	}
}
