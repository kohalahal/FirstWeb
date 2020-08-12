<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 오늘의 운세</title>
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />	
    <style>
		.fortune {
		width: 90%;
		max-width: 400px;
		margin: auto;
		}

		.fortune__header {
		text-align: center;
		opacity: 0;
		transform: translate3d(0, 500px, 0);
		animation: arrive 500ms ease-in-out 0.7s forwards;
		}

		.fortune__title {
		background-color: #ffb10054;
		border-radius: 10px;
		}

		.form {
		margin-top: 40px;
		border-radius: 6px;
		overflow: hidden;
		opacity: 0;
		transform: translate3d(0, 500px, 0);
		animation: arrive 500ms ease-in-out 0s forwards;
		}

		.form--no {
		animation: NO 1s ease-in-out;
		opacity: 1;
		transform: translate3d(0, 0, 0);
		}

		.form__group {
		background-color: white;
		font-size: 1rem;
		border-bottom: 0.1px solid #eaeaea;
		}

		.form__input {
		display: block;
		width: 100%;
		padding: 20px;
		-webkit-appearance: none;
		border: 0;
		outline: 0;
		transition: 0.3s;
		font-size: 1rem;
		font-family: 'GmarketSansMedium';

		}

		.form__input:focus {
		background: darken(#fff, 3%);
		}

		.radio {
		margin: 18px;
		}

		.btn {
		display: block;
		width: 100%;
		-webkit-appearance: none;
		transition: 0.3s;
		font-size: 2rem;
		height: 80px;
		}

		.btn:hover {
		background: darken(green, 5%);
		}

		@keyframes NO {
		from,
		to {
			-webkit-transform: translate3d(0, 0, 0);
			transform: translate3d(0, 0, 0);
		}

		10%,
		30%,
		50%,
		70%,
		90% {
			-webkit-transform: translate3d(-10px, 0, 0);
			transform: translate3d(-10px, 0, 0);
		}

		20%,
		40%,
		60%,
		80% {
			-webkit-transform: translate3d(10px, 0, 0);
			transform: translate3d(10px, 0, 0);
		}
		}

		@keyframes arrive {
		0% {
			opacity: 0;
			transform: translate3d(0, 50px, 0);
		}

		100% {
			opacity: 1;
			transform: translate3d(0, 0, 0);
		}
		}

		@keyframes move {
		0% {
			background-position: 0 0;
		}

		50% {
			background-position: 100% 0;
		}

		100% {
			background-position: 0 0;
		}
		}
	</style>
  </head>
  <body>
	<div class="center-contents">
		<div class="contents">
			<div class="fortune">
				<div class="fortune-header">
					<h1 class="fortune__title">오늘 <%= loggedIn? loggedInUser.getUserid()+"님":"나" %>의 운세는?</h1>
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