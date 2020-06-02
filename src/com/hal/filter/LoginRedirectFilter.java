package com.hal.filter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginRedirectFilter
 */
@WebFilter("/LoginRedirectFilter")
public class LoginRedirectFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginRedirectFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest request = (HttpServletRequest) req;
	    HttpServletResponse response = (HttpServletResponse) res;
	    
	    //로그인페이지 이전단계에서, 로그인 성공 후에 어디로보낼지를 결정하는 필터	
	    //페러미터에서 받아서 있으면 ㅇㅋ
	    //없으면 만들어줌.
	    String sendTo = null;	    

	    
	    //1.없으면
	    if(request.getParameter("to")==null) {
	    	
	    	//레퍼러로 보냄
	    	String 
	    	//리다이렉트하면서 다른 패러미터를 붙여서 보냄.
	    	
	    } 
	    
	    //2.있으면 통과
		chain.doFilter(request, response);
	}
	
	String getParameters(Map<String, String[]> parameterMap) {
		String parameters = "";
    	for(String parameter : parameterMap.keySet()) {
    		if(!(parameters.equals("to")))
    	    parameters += parameter+"="+parameterMap.get(parameter)[0];
    	}
    	return parameters;
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
