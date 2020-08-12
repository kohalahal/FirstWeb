<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="true"%>
<!-- 로그인 한 상태라면 회원가입 페이지에 오면안됨. 내보내야함. --> 
<%
if(loggedIn) {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
   	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - 회원 가입</title>
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />	
	<style>
		.user {
		width: 90%;
		}
		.user__header {
		text-align: center;
		opacity: 0;
		transform: translate3d(0, 500px, 0);
		animation: arrive 500ms ease-in-out forwards; 
		}
		.form {
		margin-top: 40px;
		border-radius: 6px;
		overflow: hidden;
		opacity: 1;
		transform: translate3d(0, 0, 0);
		width: 340px;
    	margin: auto;
		}
		.no {
		animation: NO 1s ease-in-out;
		opacity: 1;
		transform: translate3d(0, 0, 0); 
		}
		.form-input {
		display: block;
		width: 100%;
		padding: 20px;
		font-family: "Roboto";
		-webkit-appearance: none;
		border: 0;
		outline: 0;
		transition: 0.3s; 
		}
		.form__input:focus {
			background: #f7f7f7; 
		}
		.btn-confirm {
		display: block;
		width: 100%;
		height: 57px;
		-webkit-appearance: none;
		outline: 0;
		border: 0;
		transition: 0.3s; 
		}
		.btn-confirm:hover {
			background: rgb(255, 230, 0);
		}
		#userid {
	    width: 240px;
	    float: left;
	    }
		.btn-idcheck {
		width: 100px;
	    height: 57px;
	    float: right;
	    font-size: 14px;
	    margin: 0;
	    border-radius: 0 4px 0 0;
	    background-color: #ffc050;
	    color: #b20000;
	    }
		.no {
		animation: NO 1s ease-in-out;
		opacity: 1;
		transform: translate3d(0, 0, 0); 
		}
		@keyframes NO {
		from, to {
			-webkit-transform: translate3d(0, 0, 0);
			transform: translate3d(0, 0, 0); }
		10%, 30%, 50%, 70%, 90% {
			-webkit-transform: translate3d(-10px, 0, 0);
			transform: translate3d(-10px, 0, 0); }
		20%, 40%, 60%, 80% {
			-webkit-transform: translate3d(10px, 0, 0);
			transform: translate3d(10px, 0, 0); } 
		}
		@keyframes arrive {
		0% {
			opacity: 0;
			transform: translate3d(0, 50px, 0); }
		100% {
			opacity: 1;
			transform: translate3d(0, 0, 0); } 
		}
		#iframe {
		visibility: hidden;
		}

	</style>
  </head>
  <body>
	<div class="center-contents">
		<div class="user">
			<header class="user__header">
				<h1>웹 나라의 회원이 되세요.</h1>
				<h2>어서오세요.</h2>
				<h3 id="msg1"></h3>
				<h3 id="msg2"></h3>
			</header>			
			<form class="form" >
				<div class="form__group">
					<input class="form-input" type="text" placeholder="User ID" name="userid" id="userid" />
					<button class="btn-idcheck" type="button">ID 중복 확인</button>
				</div>
				<div class="form__group">
					<input class="form-input" type="text" placeholder="Name" name="name" />
				</div>
				<div class="form__group">
					<input class="form-input" type="email" placeholder="Email" name="email" />
				</div>				
				<div class="form__group">
					<input class="form-input" type="password" placeholder="Password" name="pwd" />
				</div>	
				<div class="form__group">
					<input class="form-input" type="password" placeholder="re-type Password" name="pwd2" />
				</div>				
				<button class="btn-confirm" type="button">확 인</button>
			</form>
		</div>
	</div>
	<iframe id="iframe" name="iframe"></iframe>
	<script>
		var idOk = false;
		const btnConfirm = document.querySelector('.btn-confirm');
		const btnIdcheck = document.querySelector('.btn-idcheck');
		
		const iframe = document.getElementById("iframe");

		const form   = document.querySelector('.form');
		const input = document.querySelector('.form-input');
		const idInput = document.getElementById('userid');
		const idCheckResult = document.getElementsByClassName("getCheckResult")[0];
		const msg1 = document.getElementById('msg1');
		const msg2 = document.getElementById('msg2');
		const idReg = /^[a-z0-9]+$/;
		const emailReg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/i;

		
		//Form ctl
		//전체 모든 창에 스페이스엔터금지
		input.addEventListener('keydown', function (e) {
			console.log("전부"+e.keycode);
			if(e.keycode == 13 || e.keycode == 32 || e.keycode == 123 || e.which == 13 || e.which == 32 || e.which == 123) {
				e.preventDefault();
			}
		});	
		//userid
		form[0].onkeydown = function (e) {			
			console.log(form[0].value);
			idOk = false;
			if(e.keycode == 13 || e.keycode == 32 || e.keycode == 123 || e.which == 13 || e.which == 32 || e.which == 123) {
				e.preventDefault();
			}
			if ( (e.keycode>64 && e.keycode<91) || (e.which>64 && e.which<91 && e.which) 
					|| (e.keycode>47 && e.keycode<58) || (e.which>47 && e.which<58 && e.which)
					|| e.keycode==8 || e.which==8 || e.keycode==9 || e.which==9
					|| e.keycode==13 || e.which==13 || e.keycode==32 || e.which==32
					|| e.keycode==123 || e.which==123 ) {
				msg1.innerText = "";
				form[0].style.color = "black";
			} else {
				msg1.innerText = "아이디는 알파벳 소문자와 숫자로 이루어져야합니다.";
				form[0].style.color = "red";
			}
			if (form[0].value.length<3) {
				msg2.innerText = "아이디는 4글자 이상이어야 합니다.";
				form[0].style.color = "red";
			} else {
				msg2.innerText = "";
				form[0].style.color = "black";
			}

		};	
		//name

		//email
		form[3].addEventListener('keydown', function () {
			if(emailReg.test(form[3].value)) {
				msg1.innerText = "";
				form[3].style.color = "black";
			} else {
				msg1.innerText = "올바른 이메일 형식을 입력해주세요.";
				form[3].style.color = "red";
			}
		});	
		//pwd
		form[4].addEventListener('keydown', function () {
			if(form[4].value.length<3) {
				msg1.innerText = "비밀번호는 4글자 이상이어야합니다.";
				form[4].style.color = "red";
			} else {
				msg1.innerText = "";
				form[4].style.color = "black";
			}
		});	
		//pwd2
		form[5].addEventListener('keydown', function () {
			setTimeout(function(){ 
				if(form[4].value=="" || form[4].value==form[5].value) {
					msg2.innerText = "";
					form[5].style.color = "black";
				} else {
					msg2.innerText = "비밀번호가 서로 다릅니다.";
					form[5].style.color = "red";
				}
			}, 100);
		});	
		
		btnConfirm.onclick = function() {
			if(form[0].value==""||form[2].value==""||form[3].value==""||form[4].value==""||form[5].value=="") {
				msg1.innerText = "모든 항목을 입력해 주세요.";
				no();
			} else if(!idOk) {
				msg1.innerText = "아이디 중복 체크를 통과해주세요.";
				form[0].style.color = "red";
				no();
			} else if(idOk&&form[2].value!=""
					&&idReg.test(form[0].value)&&emailReg.test(form[3].value)&&
					form[4].value.length>3&&form[4].value==form[5].value) {
				iframe.close();
				form.action = "signupAction.jsp";
				form.submit();
			} else {
				msg1.innerText = "모든 항목을 정확히 입력해 주세요.";
				no();
			}
		}
		
		function no() {
			form.classList.add('no');
			setTimeout(function() {
				form.classList.remove('no');
			},500);
		}
		
		btnIdcheck.onclick = function() {
			if(form[0].value.length>3 && idReg.test(form[0].value)) {
				checkId();
			} else if(form[0].value.length<3) {
				msg2.innerText = "아이디는 4글자 이상이어야 합니다.";
				form[0].style.color = "red";
			} else if(idReg.test(form[0].value)) {
				msg1.innerText = "아이디는 알파벳 소문자와 숫자로 이루어져야합니다.";
				form[0].style.color = "red";
			}
		}
		
	
		
		function checkId() {		 
			var hiddenWindow = window.open("idcheckAction.jsp", "iframe", "width=570, height=350, resizable = no, scrollbars = no");
			form.target="iframe";
			form.action="idcheckAction.jsp";
			form.submit();
		}
		

		function checkResult(a) {
			idOk = a;
			console.log(a);
			if(idOk) {
				msg1.innerText = "사용할 수 있는 아이디입니다.";
				form[0].style.color = "black";
			} else {
				msg1.innerText = "사용할 수 없는 아이디입니다.";
				form[0].style.color = "red";
			}
		}
		
	</script>
  </body>
</html>