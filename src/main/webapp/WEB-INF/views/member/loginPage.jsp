<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
</head>
<body>
<style>
		*
		{
		font-family: 'Noto Sans KR', sans-serif;
		}
	
       #loginForm
       {
       		
           width:400px;
           height:400px;     
           text-align: center;
           margin: 0 auto;
           
       }
        .small
       {
           text-decoration: none;
           color:#707070;
           margin: 0px 10px 0 10px;
           font-size:14px;
       }
       .btn-style-mint {
       width:400px;
       margin: 13px 0px 17px;
	}
	#logo
	{
	margin: 0 auto;
	}
	.input-style
	{
	width:400px;
	margin: 0px 0px 10px 0px;
	}

    </style>
    
    <div id="content">
    
    <form id="loginForm" action="/member/login.do" method="post">
    <div id="logo">
				<a href="/"><img alt="오늘 뭐 입지 로고" src="/resources/images/logo.png"></a>
	</div><br>
			
	<div style=" height:120px;">
    <input type="text"  class="input-style" name="userId" placeholder="아이디를 입력해주세요"/><br>
    <input type="text"  class="input-style" name="userPwd" style="margin: 0px 0px 20px;" placeholder="비밀번호를 입력해주세요"/><br><br>
   </div>
    <input type="submit" class="btn-style-mint" value="로그인"><br>
    
    
    <a href="/member/findIdPage.do" class="small">아이디찾기</a> <span style="color:#C8C8C8;">l</span> <a href="/member/findPwdPage.do" class="small">비밀번호찾기</a>  <a href="/member/joinPage.do" class="small">회원가입</a>
    
    </form>
    
    
    
    

    </div>
    
</body>
</html>