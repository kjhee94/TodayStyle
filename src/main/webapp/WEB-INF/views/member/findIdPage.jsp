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
<title>오늘 뭐 입지? - 아이디 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/member/findIdPage.css">
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
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
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1"><a href="/member/findIdPage.do">아이디 찾기</a></li>
				<li class="tab-link" data-tab="tab-2" id="pwdTab"><a href="/member/findPwdPage.do">비밀번호 찾기</a></li>
			</ul>
			<div id="tab-1" class="tab-content current">
			
			<c:choose>
			<c:when test="${requestScope.m != null }">
			<div style="color:#707070; font-size:16px; margin: 0px 0px 20px 0px;">
	<span style="font-weight:bold; ">${requestScope.m.userName}</span> 님의 정보와 일치하는 아이디 목록입니다.
	</div>
	<div style="border: 1px solid #C8C8C8; width:400px; height:73px; margin:0 auto;">
	<div style="float:left; width:50%; height:100%; line-height:70px; font-size:18px; color:#707070;">
	${requestScope.maskingId}
	</div>
	<div style="float:left; width:50%; height:100%; line-height:70px; font-size:12px; color:#C8C8C8;">
	 ${requestScope.m.enrollDate} 가입
	 </div>
	</div>
	<input type="button" onclick="location.href='/member/loginPage.do'" value="로그인 하기" id="findId" class="btn-style-mint">
			</c:when>
			<c:otherwise>
			<form  method="post" id="findIdForm" style="width:400px; margin:0 auto;">
			<input type="text" class="input-style" id="userName" name="userName" placeholder="이름">
			<span id="name" style="text-align:left;" class="validity"></span>
			<input type="email" class="input-style" id="userEmail" name="userEmail" placeholder="이메일" style="margin-top: 10px;">
			<span id="email" style="text-align:left;" class="validity"></span>
			<input type="submit" value="아이디 찾기" id="findId" class="btn-style-mint"><br>
			</form>
			</c:otherwise>
			</c:choose>
			</div>

			<a href="/">메인으로 이동</a>
		</div>
		<script>
		 <%-- 이름 유효성 검사 --%>
	       $("input[name='userName']").keyup(function(){
	          var regName=/^[가-힣]+$/;
	          if(regName.test($(this).val())){
	        	  $('#name').css("display","none");
	        	  $('#userName').css("border-color","#C8C8C8");
	          }else{
	        	  $('#name').css("color",'#FD8A69');
		          $('#name').html("한글만 가능합니다.");
		          $('#name').css("display","block");
		          $('#userName').css("border-color","#FD8A69");
	          }
	       });
	       <%--이메일 유효성 검사 --%>
	       $("input[name='userEmail']").keyup(function(){
		          var regName=/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		          if(regName.test($(this).val())){
		        	  $('#email').css("display","none");
		        	  $('#userEmail').css("border-color","#C8C8C8");
		        	 
		          }else{
		        	  $('#email').css("color",'#FD8A69');
			          $('#email').html("이메일 형식이 올바르지 않습니다.");
			          $('#email').css("display","block");
			          $('#userEmail').css("border-color","#FD8A69");
		          }
		       });
		</script>

	<script>
	/*마지막 테스트*/
	$('#findId').click(function(){
		/*아이디작성칸이 빈칸일때*/
		if(($('#userName').val())=="")
		{
		alert('이름을 작성해주세요');
		 // $('#name').css("color",'#FD8A69');
		 // $('#name').html("이름을 입력해주세요.");
		 // $('#name').css("display","block");
		  $('#userName').css("border-color","#FD8A69");
		return false;
		}
		
		if(($('#userEmail').val())=="")
		{
		alert('이메일을 작성해주세요');
		$('#userEmail').css("border-color","#FD8A69");
		return false;
		}
		  var name =  $('#userName').css("border-color")=="rgb(200, 200, 200)";
		 var email =  $('#userEmail').css("border-color")=="rgb(200, 200, 200)";
		 if(name&&email){
    		 $('#findIdForm').attr("action","/member/findId.do");
             $('#findId').submit();
          }else{
       
             
             return false;
          }
	});
	
	
	</script>


</div>


</body>
</html>