<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="true"%>
<%
//로그인 한 상태라면 정상적인 경로로는 들어올수없음. 로그인 상태라면 뒤로가기나 주소창입력으로 들어왔으면 그냥 인덱스로보내기.
if(loggedIn) {
	response.sendRedirect("index.jsp");
	return;
} 
	
//id기억 쿠키 확인
String cookieId = getCookieValue(request.getCookies(), "id");
boolean rememberMe = cookieId.length()==0?false:true;

boolean errorOccured = errorCheck(request);
String errorMessage = "";
if(errorOccured) errorMessage = getErrorMessage(request);

//어디서 왔는지 받기. 폼 패러미터로 전달.
String sendTo = getDestination(request);
%>

<%! 
//쿠키받는 메소드
private String getCookieValue(Cookie[] cookies, String key) {
	if(cookies!=null) {
		for(int i = 0; i<cookies.length; i++) {
			if(cookies[i].getName().equals(key)) {
				return (String) cookies[i].getValue();
			}
		}
	}
    return "";  // 일단 하드코딩으로 작성하고 테스트 후에. 다시 작성한다.
}
//error check
private boolean errorCheck(HttpServletRequest request) {
	return Integer.parseInt(request.getParameter("code")==null?"0":request.getParameter("code"))>0? true:false;
}

//get errormessage
static String[][] errorCode = {
		{"1", "로그인에 실패하였습니다."},
		{"3", "로그인이 필요합니다."} 
		};

private String getErrorMessage(HttpServletRequest request) {
	String errorMessage = "";
	for(int i = 0; i<errorCode[0].length; i++) {
		if(errorCode[i][0].equals(request.getParameter("code"))) {
			errorMessage = "<div class=\"login-message\"><p class=\"message\">"+errorCode[i][1]+"</p><button class=\"return-button\">확인</button>";
		}
	}
	return errorMessage;
}

//get request destination
private String getDestination(HttpServletRequest request) {
	return request.getParameter("to")==null?request.getHeader("referer")==null?"index.jsp":request.getHeader("referer").substring("http://localhost:8080/pages/".length(), request.getHeader("referer").length()-4):request.getParameter("to");
}

%>
<!DOCTYPE html>
<html lang="ko">
  <head>
   	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 로그인</title>
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />	
	<style>
		.form-container {
		display: block;
		margin: 0 auto;
		width: 400px;
		perspective: 1000;
		}
		.circle {
		width: 20vw;
		height: 20vw;
		position: absolute;
		border-radius: 50%;
		background-color: #fff03b;
		right: 10vw;
		top: 10vh;
		}
		.circle:after {
		content: "";
		width: 15vw;
		height: 15vw;
		position: absolute;
		border-radius: 50%;
		background-color: #e81b00;
		right: 50vw;
		top: 15vh;
		}
		.circle:before {
		content: "";
		width: 5vw;
		height: 5vw;
		position: absolute;
		border-radius: 50%;
		background-color: #ff523b;
		right: 20vw;
		top: -17vh;
		}

		.login-form,
		.loading {
		background: rgba(255, 145, 43, 0.43);
		border: 13px solid rgb(255, 147, 71);
		border-radius: 8px;
		-webkit-transform: rotateY(-180deg);
		transform: rotateY(-180deg);
		position: absolute;
		margin: 0 auto;
		height: 250px;
		-webkit-backface-visibility: hidden;
		backface-visibility: hidden;
		-webkit-transition: -webkit-transform 1s;
		transition: transform 1s;
		width: 25%;
		min-width: 400px;
		}

		.loading {
		background: rgb(255, 93, 64);
		}

		.title {
		background: rgb(255, 99, 71);
		color: #fff;
		font-size: 30px;
		padding: 10px 10px 10px 20px;
		margin-top: 0;
		margin-bottom: 15px;
		font-family: "GmarketSansMedium";
		display: flex;
		font-weight: 100;
		}

		.form-input {
		padding: 10px;
		min-width: 90%;
		height: 40px;
		border-radius: 4px;
		border: none;
		margin: auto;
		font-family: "GmarketSansMedium";
		font-size: 10px;
		}

		.tooltip {
		width: 35%;
		background: rgba(6, 41, 61, 1);
		font-size: 0.8em;
		color: #fff;
		margin-left: 10px;
		padding: 7px;
		border-radius: 5px;
		}

		.form-group {
		padding: 10px;
		width: 90%;
		height: 30px;
		margin: auto;
		}

		.login-button {
		background: rgb(255, 71, 71);
		}

		.login-button:hover {
		box-shadow: inset 0 40px 0 0 rgb(180, 43, 2);
		}

		.remember-checkbox {
		display: inline;
		position: relative;
		margin-left: 30px;
		top: 3px;
		}

		.remember-p {
		display: inline;
		position: relative;
		margin-left: 5px;
		color: #f30;
		font-size: 10px;
		}

		.loading-spinner-large {
		margin-left: 32%;
		margin-top: 55px;
		font-size: 10px;
		position: fixed;
		text-align: center;
		display: none;
		border-top: 10px solid rgba(255, 255, 255, 0.2);
		border-right: 10px solid rgba(255, 255, 255, 0.2);
		border-bottom: 10px solid rgba(255, 255, 255, 0.2);
		border-left: 10px solid rgb(250, 255, 177);
		-webkit-transform: translateZ(0);
		-ms-transform: translateZ(0);
		transform: translateZ(0);
		-webkit-animation: spin-clockwise 1.1s infinite linear;
		animation: spin-clockwise 1.1s infinite linear;
		}

		.loading-spinner-small {
		margin-left: 39%;
		margin-top: 85px;
		font-size: 10px;
		position: fixed;
		text-align: center;
		display: none;
		border-top: 10px solid rgba(255, 255, 255, 0.2);
		border-right: 10px solid rgba(255, 255, 255, 0.2);
		border-bottom: 10px solid rgba(255, 255, 255, 0.2);
		border-left: 10px solid rgb(250, 255, 177);
		-webkit-transform: translateZ(0);
		-ms-transform: translateZ(0);
		transform: translateZ(0);
		-webkit-animation: spin-counter-clockwise 1.1s infinite linear;
		animation: spin-counter-clockwise 1.1s infinite linear;
		}

		.loading-spinner-large,
		.loading-spinner-large:after {
		border-radius: 50%;
		width: 120px;
		height: 120px;
		}

		.loading-spinner-small,
		.loading-spinner-small:after {
		border-radius: 50%;
		width: 60px;
		height: 60px;
		}
		@-webkit-keyframes spin-clockwise {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(360deg);
			transform: rotate(360deg);
		}
		}
		@keyframes spin-clockwise {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(360deg);
			transform: rotate(360deg);
		}
		}

		@-webkit-keyframes spin-counter-clockwise {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(-360deg);
			transform: rotate(-360deg);
		}
		}
		@keyframes spin-counter-clockwise {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(-360deg);
			transform: rotate(-360deg);
		}
		}

		.login-message {
		position: absolute;
		width: 100%;
		height: 30%;
		text-align: center;
		padding-top: 20%;
		color: aliceblue;
		font-size: 15px;
		}

		.return-button {
		background: rgb(255, 169, 28);
		}

		.message {
		text-align: center;
		position: relative;
		width: 400px;
		height: 50px;
		margin: auto;
		letter-spacing: 3px;
		font-size: 23px;
		}
	</style>	
  </head>
  <body>
	<div class="center-contents">
	  <div class="form-container flip">
	    <div class="circle"></div>
	    <form class="login-form" method="post">
	      <h3 class="title">Hello.</h3>
	      <div class="form-group" id="username">
	        <input
	          class="form-input"
	          tooltip-class="username-tooltip"
	          name="userid"
	          placeholder="Username"
	          value="<%= rememberMe? cookieId:""%>" 
	        />
	      </div>
	      <div class="form-group" id="password">
	        <input
	          type="password"
	          class="form-input"
	          tooltip-class="password-tooltip"
	          name="pwd"
	          placeholder="Password"
	        />
	      </div>
	      <div class="form-group">
	        <button class="login-button">Login</button>
	        <input class="remember-checkbox" type="checkbox" name="rememberId" <%=rememberMe?"checked":""%> />
	        <p class="remember-p">Remember me</p>
	      </div>
	      <input type="hidden" name="to" value="<%=sendTo %>" />
	    </form>
	    <div class="loading">
	      <div class="loading-spinner-large" style="display: none;"></div>
	      <div class="loading-spinner-small" style="display: none;"></div>
	        <%= errorOccured? errorMessage:"" %>
	    </div>
	  </div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		var form = $("form")[0]
		
		function initiateLogin() {
		  $(".return-button").css("display","none");
		  $(".login-form").css("transform", "rotateY(0deg)");
		}
	
		function initiateError() {
		  $(".loading").css("transform", "rotateY(0deg)");
		}
		
		$(".return-button").click(function () {
		  $(".loading").css("transform", "rotateY(-180deg)");
		  $(".login-form").css("transform", "rotateY(0deg)");
		  $(".login-message").css("display", "none");
		});
		
		<%= errorOccured? "initiateError()":"initiateLogin()"%>
		
		$(".login-button").click(function (event) {
		  event.preventDefault();
		});
		
		$(".login-button").click(function () {
		  if (form[0].value == "") {
		    alert("ID를 입력하세요.");
		    return false;
		  } else if (form[1].value == "") {
		    alert("비밀번호를 입력하세요.");
		    return false;
		  } else {
			$(".login-form").css("transform", "rotateY(-180deg)");
		    $(".loading-spinner-large").css("display", "block");
		    $(".loading-spinner-small").css("display", "block");
		    $(".loading").css("transform", "rotateY(0deg)");
		    var delay = 1500;
		    setTimeout(function () {
		      $("form").attr("action", "../LoginAction").submit();
		    }, delay);
		  }
		});
		
		$(".form-input").bind("keypress", function(e) {
			if(e.which && (e.which == 13 || e.which == 32)) {
				e.preventDefault();
			}
		});
		
	</script>
  </body>
</html>