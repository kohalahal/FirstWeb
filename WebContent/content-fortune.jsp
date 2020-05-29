<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<div class="fortune">
    <header class="fortune-header">
        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3219/logo.svg" alt="" />
        <h1 class="fortune__title">오늘 나의 운세는?</h1>
    </header>
    
    <form class="form" action="Result.jsp" method="post" onsubmit="return submitCheck(this);">
        <div class="form__group">
            <input type="text" placeholder="이름" name="name" class="form__input" />
        </div>
        
        <div class="form__group">
            <input type="date" placeholder="생일" name="birthday" class="form__input" max="9999-12-31" />
        </div>

        <div class="form__group">
            <input class="radio" type = "radio" name = "gender" value = "1">여성
            <input class="radio" type = "radio" name = "gender" value = "2">남성
            <input class="radio" type = "radio" name = "gender" value = "3" checked>*

        </div>
        
        <button class="btn" type="submit">운세보기</button>
    </form>
</div>