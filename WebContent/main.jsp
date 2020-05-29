<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<% String id = (String) session.getAttribute("id");
boolean loginStatus = id==null?false:true;
%>


    <%if(loginStatus) {%><%=id %>님!<%} else { %> 정체를 알 수 없는 방문자님!<%} %>
<div class="dropping-texts">
  <div>오늘도</div>
  <div>행복한</div>
  <div>하루</div>
  <div>보내세요!</div>
  <div>♥</div>
</div>
