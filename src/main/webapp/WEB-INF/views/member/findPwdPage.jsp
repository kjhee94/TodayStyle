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
				<a href="/member/findIdPage.do"><li class="tab-link" data-tab="tab-1">아이디 찾기</li></a><span style="color:#C8C8C8;">l</span><a href="/member/findPwdPage.do"><li class="tab-link current" data-tab="tab-2" id="pwdTab">비밀번호 찾기</li></a>
			</ul>
			<br>

			<div  id="tab-1" class="tab-content current">
			<input type="text" class="input-style" id="userName" name="userName" placeholder="이름" style="margin:0px 0px 10px 0px;">
			<br>
			<input type="email" class="input-style" id="userEmail" name="userEmail" placeholder="이메일">
			<br>
			<button value="비밀번호 찾기" id="findPwd" class="btn-style-mint">비밀번호 찾기</button>
			</div>
			<a href="/">메인으로 이동</a>
 </div>


</div>

<script>
$('#findPwd').click(function(){
	var userName = $('#userName').val();
	var userEmail = $('#userEmail').val();
	
	$.ajax({
		url:"/member/findPwd.do",
		data:{"userName":userName,"userEmail":userEmail},
		type:"POST",
		success:function(result){
			
			if(result=="true")
				{
				alert("dd")
				}else
					{
					alert("회원 정보가 없습니다.");
					}
		},
		error:function(){
			console.log("ajax 통신 실패");
		}
	});
	
});
</script>



</body>
</html>