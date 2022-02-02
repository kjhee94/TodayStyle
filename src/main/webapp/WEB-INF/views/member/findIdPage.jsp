<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/member/findIdPage.css">
</head>
<body>
<style>
.input-style
{
width:400px;
}
.btn-style-mint
{
width:400px;
margin: 20px 0px 20px 0px;
}
</style>

<div id="content">

 <div id="Wrapper">
			
			<br>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">아이디 찾기</li><span style="color:#C8C8C8;">l</span><li class="tab-link" data-tab="tab-2" id="pwdTab">비밀번호 찾기</li>
			</ul>
			<br>
			<div id="tab-1" class="tab-content current">
			
			<c:choose>
			<c:when test="${requestScope.m != null }">
			<div style="color:#707070; font-size:16px; margin: 0px 0px 20px 0px;">
	<span style="font-weight:bold; ">${requestScope.m.userName}</span> 님의 정보와 일치하는 아이디 목록입니다.
	</div>
	<div style="border: 1px solid #C8C8C8; width:400px; height:73px; margin:0 auto;">
	<div style="float:left; width:50%; height:100%; line-height:70px; font-size:18px; color:#707070;">
	${requestScope.m.userId}
	</div>
	<div style="float:left; width:50%; height:100%; line-height:70px; font-size:12px; color:#C8C8C8;">
	 ${requestScope.m.enrollDate} 가입
	 </div>
	</div>
	<input type="button" onclick="location.href='/member/loginPage.do'" value="로그인 하기" id="findId" class="btn-style-mint">
			</c:when>
			<c:otherwise>
			<form action="/member/findId.do" method="post">
			<input type="text" class="input-style" name="userName" placeholder="이름" style="margin:0px 0px 10px 0px;">
			<br>
			<input type="email" class="input-style" name="userEmail" placeholder="이메일">
			<br>
			<input type="submit" value="아이디 찾기" id="findId" class="btn-style-mint"><br>
			</form>
			</c:otherwise>
			</c:choose>
			</div>



			<div  id="tab-2" class="tab-content">
			<input type="text" class="input-style" name="userName" placeholder="이름" style="margin:0px 0px 10px 0px;">
			<br>
			<input type="email" class="input-style" name="userEmail" placeholder="이메일">
				<br>
					<input type="button" value="비밀번호 찾기" id="findPwd" class="btn-style-mint">
			</div>
			<a href="/">메인으로 이동</a>
		</div>

	<script>
	
	$(document).ready(function(){
			$("ul.tabs li").click(function() {
				var tabId = $(this).attr("data-tab");

				$("ul.tabs li").removeClass("current");
				$(".tab-content").removeClass("current");

				$(this).addClass("current");
				$("#" + tabId).addClass("current");
			})

		
			});
	</script>


</div>


</body>
</html>