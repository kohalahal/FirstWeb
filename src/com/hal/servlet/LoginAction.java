package com.hal.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hal.dao.Dao;
import com.hal.dao.User;
import com.hal.dao.UserDao;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static int loginFailed = 1;
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
		Dao userDao = (Dao)UserDao.getInstance();
		String id = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		//코드로 어디서왔는지 받아둠		
		String sendTo = getSendTo(request);
		System.out.println("===login===");
		System.out.println("id:"+id);
		System.out.println("pwd:"+pwd);
		System.out.println("to:"+sendTo);

		//먼저 널검사. 건너온 id,비번이 널이거나, 혹은 id로 회원이없을때.
		if( id==null || pwd==null || userDao.selectData(id)==null ) {
			System.out.println("1");
			loginFailed(response, sendTo);
		} else {
			//걸릴 확률 높아보이는 것부터 먼저 검사. 로그인 아디비번 맞지않을때
			if(!loginCheck((User)userDao.selectData(id), pwd)) {
				System.out.println("2");
				loginFailed(response, sendTo);				
			} else {
				//Login Success
				System.out.println("3");
				rememberMeCheck(request, response, id);
				setLoggedInSession(request, (User)userDao.selectData(id));
				redirectLoggedInUser(response, sendTo);
			}		
		}
	}

	private String getSendTo(HttpServletRequest request) {
		String sendTo = request.getParameter("to");
		if(sendTo==null || sendTo.length()==0) sendTo = "index";
		return sendTo;
	}

	private void redirectLoggedInUser(HttpServletResponse response, String sendTo) throws IOException {
		response.sendRedirect(sendTo+".jsp");
	}

	private void setLoggedInSession(HttpServletRequest request, User user) {
		request.getSession().setAttribute("loggedInUser", user);
	}

	private void loginFailed(HttpServletResponse response, String sendTo) throws IOException {
		response.sendRedirect("pages/loginForm.jsp?code="+loginFailed+"&to="+sendTo);
	}

	private void rememberMeCheck(HttpServletRequest request, HttpServletResponse response, String id) {
		if(request.getParameter("rememberId")!=null) {
			System.out.println("리멤버는"+request.getParameter("rememberId"));
			response.addCookie(new Cookie("id", id));
		}
	}

	private boolean loginCheck(User user, String pwd) {
		return pwd.equals(user.getPwd());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
