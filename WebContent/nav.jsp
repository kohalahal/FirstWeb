<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<% String id = (String) session.getAttribute("id");
boolean loginStatus = id==null?false:true;
%>

<nav class="top-right open">
    <a class="disc l1"
    <%if(loginStatus) 
    {%>href="logout.jsp"><div>Log out</div><%} else 
    {%>href="loginForm.jsp"><div>Log in</div><%} %>
    </a>
    <a class="disc l2" href="">
        <div>Board보드</div>
    </a>
    <a class="disc l3" href="">
        <div>Lecture</div>
    </a>
    <a class="disc l4" href="fortune.jsp">
        <div>Fortune</div>
    </a>
    <a class="disc l5 toggle">
        Menu
    </a>
</nav>

