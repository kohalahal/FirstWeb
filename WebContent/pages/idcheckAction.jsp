<%@page import="com.hal.dao.UserDao"%>
<%@page import="com.hal.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Dao userDao = UserDao.getInstance();
String idToCheck = request.getParameter("userid");
boolean idCheckOk = isThere(userDao, idToCheck);
System.out.println(idToCheck+":"+idCheckOk);
%>
<%!
boolean isThere(Dao userDao, String idToCheck) {
	if (idToCheck==null || idToCheck=="" || idToCheck.length()<4) return false;
	return userDao.selectData(idToCheck)==null;
};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck</title>
</head>
<body>
</body>
<script>
const input = document.querySelector('input');
window.load = setTimeout(function() {
	<%=idCheckOk? "opener.checkResult(true);":"opener.checkResult(false);" %>
},100);
</script>
</html>