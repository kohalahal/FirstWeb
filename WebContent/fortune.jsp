<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ㅇㅣ해리의 웹의 나라 : 오늘의 운세</title>
    <link rel="stylesheet" type="text/css" href="navstyle.css">
    <link rel="stylesheet" type="text/css" href="fortunestyle.css">
    <style>
        @import url("https://fonts.googleapis.com/css?family=Alegreya+Sans:800,900");
        @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@600&display=swap');
	    html, body {
	    height: 100%; 
	    }	
	    body {
	    background: #b6f0cf;
	    margin:0px;
	    text-align:center;
	    padding-top:43vh;
	    color:#fff;
	    font-size:36px;
	    font-weight:100;
	    overflow:hidden;
	    }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp" flush="false" />
    <div class="center-contents">
    <%@include file="content-fortune.jsp"%>
    </div>
    <script src="nav.js"></script>
</body>
</html>