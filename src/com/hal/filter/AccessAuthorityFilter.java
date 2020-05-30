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
	    
	    //세션에 아이디가 없으면 로그인하라고 로그인폼으로 보냄.
	    if(request.getSession().getAttribute("id")==null) {
	    	System.out.println("필터 레퍼러"+request.getHeader("referer"));
	    	//어디서 왔는지를 붙여줌
	    	response.sendRedirect("loginForm.jsp?from="+request.getHeader("referer"));
	    } else {
	    	
	    //세션에 아이디가 있으면 리퀘스트 통과~~~~		    
		// pass the request along the filter chain
		chain.doFilter(request, response);
	    }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("AccessAuthorityFilter init");
	}

}
