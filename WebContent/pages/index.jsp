<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
 	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
 	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="icon" href="favicon.ico">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라!</title>
	<link rel="stylesheet" type="text/css" href="../assets/style/style.css" />	
	<link rel="stylesheet" type="text/css" href="../assets/style/indexstyle.css" />	
  </head>
  <body>
	<div class="center-contents">
		<div class="contents">
			<h1 class="hello">어서오세요,</h1>
			<h1 class="hello">
				<%= loggedIn? id:"소환사"%>님!
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
				<div style="pointer-events: none;">
					<h1 class="heart">♥</h1>
				</div>
			</div>
		</div>
	</div>
	<script src="../assets/js/index.js"></script>
  </body>
</html>