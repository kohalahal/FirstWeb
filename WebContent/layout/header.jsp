<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<div class="header">
  <div class="logo">
    <a class="logo-title" href="index.jsp">ㅇㅣ해리의 웹 나라</a>
  </div>
  <nav class="top-right">
    <a class="disc l1" 
    <%if(request.getSession().getAttribute("id")==null) {%>
    href="loginForm.jsp">
      <div>Log in</div>
      <%} else { %>
      href="logoutAction">
      <div>Log out</div>
      <%} %>
    </a>
    <a class="disc l2" href="signupForm.jsp">
      <div>Sign up</div>
    </a>
    <a class="disc l3" href="board.jsp">
      <div>Board</div>
    </a>
    <a class="disc l4" href="lecture.jsp">
      <div>Lecture</div>
    </a>
    <a class="disc l5" href="fortune.jsp">
      <div>Fortune</div>
    </a>
    <a class="disc l6 toggle">
      Menu
    </a> 
  </nav>
</div>
<script src="./assets/js/header.js"></script>
