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
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />	
	<style>
		.dropping-texts {
		width: 80vw;
		height: 40vh;
		text-align: center;
		position: absolute;
		left: 10vw;
		}

		.dropping-texts > div {
		opacity: 0;
		position: absolute;
		top: 20px;
		width: 100%;
		font-weight: 300;
		font-size: 0px;
		}

		.dropping-texts h1 {
		margin: 0;
		position: relative;
		}

		.dropping-texts > div:nth-child(1) {
		animation: roll 2s linear forwards 0s;
		}
		.dropping-texts > div:nth-child(2) {
		animation: roll 2s linear forwards 0.6s;
		}
		.dropping-texts > div:nth-child(3) {
		animation: roll 2s linear forwards 1.2s;
		}
		.dropping-texts > div:nth-child(4) {
		animation: roll 2s linear forwards 1.8s;
		}
		.dropping-texts > div:nth-child(5) {
		animation: roll2 2s linear forwards 2.5s;
		}

		@keyframes roll {
		0% {
			font-size: 0px;
			opacity: 0;
			margin-left: 0px;
			margin-top: 0px;
			transform: rotate(-25deg);
		}
		3% {
			opacity: 1;
			transform: rotate(0deg);
		}
		5% {
			font-size: inherit;
			opacity: 1;
			margin-left: 0px;
			margin-top: 0px;
		}
		20% {
			font-size: inherit;
			opacity: 1;
			margin-left: 0px;
			margin-top: 0px;
			transform: rotate(0deg);
		}
		27% {
			font-size: 0px;
			opacity: 0.5;
			margin-left: px;
			margin-top: 50px;
		}
		100% {
			font-size: 0px;
			opacity: 0;
			margin-left: 0px;
			margin-top: -15px;
			transform: rotate(15deg);
		}
		}

		@keyframes roll2 {
		0% {
			font-size: 0px;
			opacity: 0;
			margin-top: 0px;
			transform: rotate(-25deg);
		}
		3% {
			opacity: 1;
			transform: rotate(0deg);
		}
		5% {
			font-size: inherit;
			opacity: 1;
		}
		30% {
			font-size: inherit;
			opacity: 1;
			transform: rotate(0deg);
		}
		99% {
			font-size: 40em;
			opacity: 0;
			margin-top: -1em;
		}
		100% {
			font-size: 11em;
			opacity: 0.2;
			margin-right: 0px;
			margin-top: -2.3em;
			transform: rotate(0deg);
		}
		}

		.hello {
		color: black;
		}

		.heart {
		color: crimson;
		margin: auto;
		position: relative;
		}
	</style>
  </head>
  <body>
	<div class="center-contents">
		<div class="contents">
			<h1 class="hello">어서오세요,</h1>
			<h1 class="hello">
				<%= loggedIn? loggedInUser.getUserid():"소환사"%>님!
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
	<script>
		nav = document.querySelectorAll("nav")[0];
		nav.classList.toggle('open');	
		setTimeout(function(){
			nav.classList.toggle('open');	
		}, 800);
	</script>
  </body>
</html>