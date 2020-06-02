<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
   	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 오늘의 운세</title>
	<link rel="stylesheet" type="text/css" href="../assets/style/style.css" />	
    <link rel="stylesheet" type="text/css" href="../assets/style/fortunestyle.css">	
  </head>
  <body>
	<div class="center-contents">
		<div class="contents">
			<div class="fortune">
				<div class="fortune-header">
					<h1 class="fortune__title">오늘 <%= loggedIn? id+"님":"나" %>의 운세는?</h1>
				</div>
	
				<form class="form" action="fortuneResult.jsp" method="post">
					<div class="form__group">
						<input type="text" placeholder="이름" name="name" class="form__input"
							required />
					</div>
	
					<div class="form__group">
						<input type="date" placeholder="생일" name="birthday"
							class="form__input" max="9999-12-31" required />
					</div>
	
					<div class="form__group">
						<input class="radio" type="radio" name="gender" value="1">여성
						<input class="radio" type="radio" name="gender" value="2">남성
						<input class="radio" type="radio" name="gender" value="3" checked>외계인
					</div>
					<button class="btn" type="submit">운세보기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>