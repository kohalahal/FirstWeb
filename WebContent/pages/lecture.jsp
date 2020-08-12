<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!-- 로그인 안한 상태라면 필터때문에 들어올수없음. -->
<!DOCTYPE html>
<html lang="ko">
  <head>
   	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 강의실</title>
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />		
  </head>
  <body>
	<div class="center-contents">
		<div class="contents">
			<h1><%=loggedInUser.getUserid()%>님, 어서오세요. 강의실입니다.</h1>
		</div>
	</div>
</body>
</html>