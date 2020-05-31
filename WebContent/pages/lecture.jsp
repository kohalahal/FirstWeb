<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%//Login일때 접근 허용
String id = (String) session.getAttribute("id"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 강의실</title>
	<link rel="stylesheet" type="text/css" href="../assets/style/style.css" />		
  </head>
  <body>
	<div class="center-contents">
		<div class="contents">
			<h1><%=id + "님, "%>
				어서오세요. 강의실입니다.
			</h1>
		</div>
	</div>
</body>
</html>