<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%
int code = 0;
code = Integer.parseInt(request.getParameter("code"));
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
   	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 회원 정보</title>
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />	
	<style>
	</style>
  </head>
  <body>
	<div class="center-contents">
		<h1>회원 정보</h1>
		<h3>아이디:<%=loggedInUser.getUserid() %></h3>
		<h3>이름:<%=loggedInUser.getName() %></h3>
		<h3>이메일:<%=loggedInUser.getEmail() %></h3>
	</div>
	<script>		
	</script>
  </body>
</html>