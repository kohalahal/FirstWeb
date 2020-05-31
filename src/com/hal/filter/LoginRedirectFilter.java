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
	    
	    //로그인페이지 이전단계. 로그인 성공 후에 어디로보낼지를 결정하는 필터
	    
	    //어디서 왔는지 파라미터로 받음
		String fromPage = request.getParameter("from");
		System.out.println("로긴리다이렉트필터프롬페이지1: "+fromPage);

		
		//먼저 널검사
		if(fromPage==null || fromPage.equals("")) {
			if(request.getHeader("referer")==null) {				
				fromPage = "/HelloWeb/index.jsp";
			} else {
			fromPage = request.getHeader("referer").substring("http://localhost:8080/HelloWeb/".length());
			System.out.println("로긴리다이렉트 레퍼러섭스트링:"+fromPage);
			}
		}
		//로그인 성공하고나서 만약에 로그인폼으로 돌려보내면 index로 가긴하지만 여기서도확인
		if(fromPage.contains("loginForm.jsp")) fromPage = "/HelloWeb/index.jsp";
		
		request.setAttribute("from", fromPage);
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
