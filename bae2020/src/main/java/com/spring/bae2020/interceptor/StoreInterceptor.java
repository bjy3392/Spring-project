package com.spring.bae2020.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class StoreInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String level = session.getAttribute("slevel")==null ? "No" : (String)session.getAttribute("slevel");
		
		if(!level.equals("level-05")) {
			response.sendRedirect(request.getContextPath()+"/msg/useOnlyManager");
		}
		
		return true;
	}

}
