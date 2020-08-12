<%@page import="com.hal.dao.User"%>
<%@page import="com.hal.dao.UserDao"%>
<%@page import="com.hal.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<jsp:useBean id ="user" class="com.hal.dao.User" scope="request" />
<jsp:setProperty name="user" property="*"/>

<%
int newUserCode = 5;
System.out.println("==signupAction==");
Dao userDao = (Dao)UserDao.getInstance();
System.out.println(user);
//중복체크
if(isNewUser(userDao, user)) {
	//중복이면 돌려보내기
	System.out.println("중복회원");
	response.sendRedirect("signupForm.jsp");
	return;
} else {
//중복아니면 dao에 저장하기
userDao.insertData(user);
//로기인시키기
request.getSession().setAttribute("loggedInUser", user);
//UserInfo로 리다이렉트
response.sendRedirect("userInfo.jsp?code="+newUserCode);
}
%>
<%!
boolean isNewUser(Dao userDao, User user) {
	return userDao.selectData(user)!=null;
}
%>