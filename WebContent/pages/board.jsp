<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!-- 로그인 안한 상태라면 필터때문에 들어올수없음. -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 게시판</title>
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />
</head>
<body>
	<div class="center-contents">
		<div class="contents">
			<h1><%=loggedInUser.getUserid()%>님, 어서오세요. 게시판입니다.</h1>
		</div>
	</div>
</body>
</html>