<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/css/member/loginPage.css">
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
</head>
<body>
	<div id="content">
	    <form id="loginForm" action="/member/login.do" method="post">
		    <div id="logo">
				<a href="/"><img alt="오늘 뭐 입지 로고" src="/resources/images/logo.png"></a>
			</div>
					
			<div class="box-input">
			    <input type="text" class="input-style" name="userId" placeholder="아이디를 입력해주세요"/>
			    <input type="password" class="input-style" name="userPwd" placeholder="비밀번호를 입력해주세요"/>
		   	</div>
		    <input type="submit" class="btn-style-mint" value="로그인"><br>
		 
		 	<div class="box-member-link">
	 			<a href="/member/findIdPage.do" class="small">아이디찾기</a> 
		    	<a href="/member/findPwdPage.do" class="small">비밀번호찾기</a> 
			    <a href="/member/joinPage.do" class="small">회원가입</a>
		 	</div>
	    </form>
	    <div id="kakaoLogin">
	    	<span>간편 로그인</span>
	    	<button class="btn-style-gray kakao">
	    		<a href="/main/kakao_login.ajax">
    				<img alt="" src="/resources/images/icon/kakao.png">
    				카카오로 시작하기
	    		</a>
	    	</button>
	    </div>
	</div>
</body>
</html>