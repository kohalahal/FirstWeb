<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%
	String[] fortune = { "운이 좋군요!", "운이 별로야...", "발 밑을 조심하세요.", "머리 위를 조심하세요.", "돈을 잃을 것 같네요.", "맛있는 것을 먹겠어요.",
			"빨리 집에 들어가세요! 아니면 큰일납니다.", "될 일도 안되는 날...", "안될 일도 되는 날!!!", "동쪽에 가면 귀인을 만나겠어요.", "웃을 일이 생기겠어요.",
			"걱정하던 일이 해결되겠어요.", "돌다리도 두들겨봐야 되는 날.", "건강을 유의해야하는 날.", "조상님이 화가 나신 날.", "유혹에 넘어가기 쉬운 날",
			"금전 운이 좋은 날.", "자다가도 떡이 나오는 날!", "믿음을 가지세요.", "오버하지마세요.", "꼬리가 길면 밟히는 날.", "밖으로 나가면  좋은 날.",
			"일이 잘 풀리니 마음도 행복한 날.", "인내심이 필요한 날, 참은 만큼 돌아올 거에요.", "마음을 바르게 먹으세요.", "외롭고 서러운 날.",
			"모든 일이 쉽게 이루어지는 날.", "분수껏 행동하세요.", "아직은 떄가 아닙니다.", };
	String name = request.getParameter("name");
	int nameCode = 0;
	for (int i = 0; i < name.length(); i++) {
		nameCode += name.codePointAt(i);
	}
	int gender = Integer.parseInt(request.getParameter("gender"));

	String[] birthday = request.getParameter("birthday").split("-");
	int year = Integer.parseInt(birthday[0]);
	int month = Integer.parseInt(birthday[1]);
	int day = Integer.parseInt(birthday[2]);
	int birthdayCode = year + month * day;
	System.out.println(birthdayCode);
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	Date todayDate = new Date();
	int today = Integer.parseInt(dateFormat.format(todayDate));
	System.out.println("name.length" + name.length() + "namecode" + nameCode + "gender" + gender + "today:"
			+ today + "fortune길이" + fortune.length);
	int individualCode = ((name.length() * nameCode + birthdayCode * gender) + today) % fortune.length;
	System.out.println("오늘:" + today + " 개인코드:" + individualCode);
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
   	<link rel="shortcut icon" href="../favicon.ico" type="image/icon">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>ㅇㅣ해리의 웹 나라 - <%=loggedIn?loggedInUser.getUserid():"소환사" %>님의 운세 결과</title>
	<link rel="stylesheet" type="text/css" href="../assets/style.css" />	
  </head>
  <body>
	<div class="center-contents">
		<div class="contents">
			<h2>오늘 <%=name %>님의 하루 운세는...</h2>
			<br>
			<br>
			<h1>"<%=fortune[individualCode]%>"</h1>
			<button onclick="history.back(-1)">돌아가기</button>
		</div>
	</div>
  </body>
</html>
