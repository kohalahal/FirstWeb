<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="true"%>
<%
//로그인 한 상태라면 정상적인 경로로는 들어올수없음. 로그인 상태라면 뒤로가기나 주소창입력으로 들어왔으면 그냥 인덱스로보내기.
if(request.getSession().getAttribute("id")!=null) {
	response.sendRedirect("index.jsp");
	return;
} 
	
//id기억 쿠키 확인
Cookie[] cookies = request.getCookies();
String cookieId = getCookieValue(cookies, "id");
boolean rememberId = cookieId.length()==0?false:true;

//오류 코드 확인
final String[][] errorCode = {
		{"1", "로그인에 실패하였습니다."},
		{"3", "로그인이 필요합니다."} 
		};
//없으면 0
String codeReceived = request.getParameter("code")==null?"0":request.getParameter("code");
boolean errorOccured = Integer.parseInt(codeReceived)>0? true:false;
String errorMessage = null;
if(errorOccured) {
	for(int i = 0; i<errorCode[0].length; i++) {
		if(errorCode[i][0].equals(codeReceived)) {
			errorMessage = 
					"<div class=\"login-message\"><p class=\"message\">"+errorCode[i][1]+"</p><button class=\"return-button\">확인</button>";
			break;
		}
	}
}

//어디서 왔는지 받기. 폼 패러미터로 전달.
String sendTo = request.getParameter("to")==null?request.getHeader("referer").substring("http://localhost:8080/pages/".length(), request.getHeader("referer").length()-4):request.getParameter("to");
%>

<%! //쿠키받는 메소드
     String getCookieValue(Cookie[] cookies, String key) {
		for(int i = 0; i<cookies.length; i++) {
			if(cookies[i].getName().equals(key)) {
				return (String) cookies[i].getValue();
			}
		}
           return "";  // 일단 하드코딩으로 작성하고 테스트 후에. 다시 작성한다.
     }
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
   	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 로그인</title>
	<link rel="stylesheet" type="text/css" href="../assets/style/style.css" />	
	<link rel="stylesheet" type="text/css" href="../assets/style/loginformstyle.css">	
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
	          name="id"
	          placeholder="Username"
	          value="<%= rememberId? id:""%>" 
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
	        <input class="remember-checkbox" type="checkbox" name="rememberId" <%=rememberId?"checked":""%> />
	        <p class="remember-p">Remember me</p>
	      </div>
	      <input type="text" name="to" value="<%=sendTo %>" style="visibility: hidden;" />
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
		var form = $("form")[0];
		
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
		
	</script>
  </body>
</html>