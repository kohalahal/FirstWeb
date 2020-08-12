package com.hal.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

/**
 * Servlet Filter implementation class AcessAuthorityFilter
 */
@WebFilter("/AccessAuthorityFilter")
public class AccessAuthorityFilter implements Filter {
	final int loginRequired = 3;
    /**
     * Default constructor. 
     */
    public AccessAuthorityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("AccessAuthorityFilter destroy");

	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest request = (HttpServletRequest) req;
	    HttpServletResponse response = (HttpServletResponse) res;
	    
	    //로그인이 필요한 페이지 앞에서, 로그인 상태인지 확인하고 아니면 돌려보내는 필터.
	    

	    //1.세션에 아이디가 없으면 
	    //로그인하라고 오류코드 붙여서, 원래 가려고요청한 곳이 어딘지를 붙여서 로그인폼으로 보냄.
	    if(loggedInCheck(request)) {	    	
	    	accessDenied(response, getDestination(request));
	    } else {
		    //2.세션에 아이디가 있으면 리퀘스트 통과	    
			// pass the request along the filter chain
			chain.doFilter(request, response);
	    }
	}

	private void accessDenied(HttpServletResponse response, String sendTo) throws IOException {
		response.sendRedirect("loginForm.jsp?code="+loginRequired+"&to="+sendTo);
	}

	private boolean loggedInCheck(HttpServletRequest request) {
		return request.getSession().getAttribute("loggedInUser")==null;
	}
	
	//목적지 페이지를 확장자없이 이름만 떼어냄
	private String getDestination(HttpServletRequest request) {
		return request.getRequestURI().substring("/pages/".length(), request.getRequestURI().length()-4);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("AccessAuthorityFilter init");
	}

}
