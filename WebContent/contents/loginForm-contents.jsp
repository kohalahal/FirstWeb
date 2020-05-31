<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="true"%>
<%
//로그인 한 상태라면 정상적인 경로로는 들어올수없음. 로그인 상태라면 뒤로가기나 주소창입력으로 들어왔으면 그냥 인덱스로보내기.
if(request.getSession().getAttribute("id")!=null) {
	response.sendRedirect("/HelloWeb/index.jsp");
	//로그인 상태가 아니면 검토시작
} else {

	
//id기억 쿠키 확인
boolean rememberId = false;
String id = "";
Cookie[] cookies = request.getCookies();
for(int i = 0; i<cookies.length; i++) {
	if(cookies[i].getName().equals("id")) {
		rememberId = true;
		id = (String) cookies[i].getValue();
		System.out.println("로긴폼 쿠키있어.id:"+id);
		break;
	}
}

//오류 코드 확인
final int loginFailed = 1;
final int loginRequired = 3;

int errorCode = request.getParameter("code")==null?0:Integer.parseInt(request.getParameter("code"));

//어디서 왔는지 확인
String fromPage = (String) request.getAttribute("from");
if(fromPage==null) fromPage = request.getParameter("from");
request.removeAttribute("from");
if(fromPage==null) fromPage = "/HelloeWeb/index.jsp";
System.out.println("로킨폼콘첸트 frompage: "+fromPage);
%>
<link rel="stylesheet" type="text/css" href="/HelloWeb/assets/style/loginformstyle.css">
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
          <%if(rememberId) {%>value="<%=id %>"<%} %>
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
        <input class="remember-checkbox" type="checkbox" name="rememberId" <%if(rememberId) {%>checked<%} %> />
        <p class="remember-p">Remember me</p>
      </div>
      <input type="text" name="from" value="<%=fromPage %>" style="visibility: hidden;" />
    </form>
    <div class="loading">
      <div class="loading-spinner-large" style="display: none;"></div>
      <div class="loading-spinner-small" style="display: none;"></div>

      <div class="login-message">
        <p class="message"><% switch(errorCode) { case loginFailed:%>로그인에 실패했습니다.<% break; case loginRequired: %>로그인이 필요한 페이지입니다.<% break;} %></p>
        <button class="return-button">확인</button>
      </div>
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
	      $("form").attr("action", "/HelloWeb/LoginAction").submit();
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
	
	<% if(errorCode>0) {%>
	initiateError();
	<%} else { %>
	initiateLogin();
	<%} %>
	
</script>
<%} %>
