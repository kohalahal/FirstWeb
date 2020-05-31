<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%
//로그인중이냐 아니냐에 따라 콘텐츠 내용이 동적으로 구성. 로긴확인.
String id = (String) session.getAttribute("id");
boolean loginStatus = id == null ? false : true;
System.out.println("인덱스콘첸츠 id:"+id);
%>
<link rel="stylesheet" type="text/css" href="../assets/style/indexstyle.css" />
<div class="center-contents">
	<div class="contents">
		<h1 class="hello">어서오세요,</h1>
		<h1 class="hello">
			<%if(id == null) {%>소환사님!<%} else {%><%=id %>님!<%} %>
		</h1>
		<div class="dropping-texts">
			<div>
				<h1>오늘도</h1>
			</div>
			<div>
				<h1>행복한</h1>
			</div>
			<div>
				<h1>하루</h1>
			</div>
			<div>
				<h1>보내세요</h1>
			</div>
			<div>
				<h1 class="heart">♥</h1>
			</div>
		</div>
	</div>
</div>
<script src="../assets/js/index.js"></script>

