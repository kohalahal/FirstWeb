package com.hal.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//코드로 어디서왔는지 받아둠
		String fromPage = request.getParameter("from")==null?"":request.getParameter("from");
		System.out.println("로긴액션:프롬페이지:"+fromPage);
		
		//오류코드. 코드가많아지면 이넘을쓰면될랑가?
		final int loginFailed = 1;
		final int loginRequired = 3;
		
		//먼저 널검사.
		if(id == null || id==null ) {
			System.out.println("로긴액션1");
			response.sendRedirect("loginForm.jsp?code="+loginFailed+"&from="+fromPage);
		} else {
			//걸릴 확률 높아보이는 것부터 먼저 검사. 틀렸을때 or
			if(!id.equals("asdf") || !pwd.equals("1234")) {
				System.out.println("로긴액션2");
				response.sendRedirect("loginForm.jsp?code="+loginFailed+"&from="+fromPage);				
			} else {
				//로그인 성공시 왔던 곳으로 돌려보냄
				System.out.println("로긴액션3");
				if(request.getParameter("rememberId")!=null) {
					System.out.println("리멤버는"+request.getParameter("rememberId"));
					response.addCookie(new Cookie("id", id));
				}
				request.getSession().setAttribute("id", "asdf");
				System.out.println("로긴액션 세션아이디:"+request.getSession().getAttribute("id"));
				response.sendRedirect(fromPage);
			}		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
