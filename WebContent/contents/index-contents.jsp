<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%
	String id = (String) session.getAttribute("id");
	boolean loginStatus = id == null ? false : true;
%>
<link rel="stylesheet" type="text/css" href="./assets/style/indexstyle.css" />
<div class="center-contents">
	<div class="contents">
		<h1 class="hello">어서오세요,</h1>
		<h1 class="hello">
			<%=id == null ? "용사님!" : id + "님!"%>
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
<script src="./assets/js/index.js"></script>
