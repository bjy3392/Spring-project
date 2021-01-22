package com.spring.bae2020.service;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.bae2020.dao.StoreDao;
import com.spring.bae2020.vo.OrdersVo;
import com.spring.bae2020.vo.StoreVo;

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
			for(int i=0; i<lastDay; i++) {
				ymd = yy + "-" + (mm+1) + "-" + (i+1);
				//memoryArr[i] = storeDao.getMemory(mid, ymd);
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
}
