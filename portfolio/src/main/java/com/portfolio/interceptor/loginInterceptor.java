package com.portfolio.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.portfolio.VO.MemberVO;

public class loginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(loginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object hadler, ModelAndView mav)throws Exception{
		
		logger.info("interceptor postHandel");
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = mav.getModelMap();
		Object memberVO = modelMap.get("member");
		
		if(memberVO != null) {
		    logger.info("new login success");
		    httpSession.setAttribute(LOGIN, memberVO);
		    
		    MemberVO member = (MemberVO) memberVO;
		    Cookie idCookie = new Cookie("member_id", member.getMember_id());
		    idCookie.setPath("/");
		    idCookie.setMaxAge(60*60*24*7); // 7일
		    response.addCookie(idCookie);

			// response.sendRedirect("/");
			if(request.getParameter("useCookie") != null) {
				logger.info("remember me..");
				idCookie.setPath("/");
				idCookie.setMaxAge(60*60*24*7); // 7일
				response.addCookie(idCookie);
			}
			
			
			
			Object destination = httpSession.getAttribute("destination");
			Object URL = httpSession.getAttribute("URL");
			response.sendRedirect(destination != null ? (String) destination : (String) URL);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		
		HttpSession httpSession = request.getSession();
		// 로그인 정보 제거
		if(httpSession.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			httpSession.removeAttribute(LOGIN);
		}
		
		return true;
	}
}
