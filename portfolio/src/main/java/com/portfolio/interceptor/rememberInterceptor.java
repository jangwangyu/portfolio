package com.portfolio.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.portfolio.Service.MemberService;
import com.portfolio.VO.MemberVO;

public class rememberInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(rememberInterceptor.class);
	
	@Inject
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object hadler) throws Exception{
		
		HttpSession httpSession = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie != null) {
			MemberVO memberVO = memberService.checkLoginBefore(loginCookie.getValue());
			if(memberVO != null)
				httpSession.setAttribute("login", memberVO);
		}
		return true;
	}
}
