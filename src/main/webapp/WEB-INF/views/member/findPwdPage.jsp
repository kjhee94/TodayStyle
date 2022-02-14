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
<title>오늘 뭐 입지?</title>
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
				<li class="tab-link" data-tab="tab-1"><a href="/member/findIdPage.do">아이디 찾기</a></li>
				<li class="tab-link current" data-tab="tab-2" id="pwdTab"><a href="/member/findPwdPage.do">비밀번호 찾기</a></li>
			</ul>

			<div  id="tab-1" class="tab-content current">
			<form  method="post" id="findPwdForm" style="width:400px; margin:0 auto;">
			<input type="text" class="input-style" id="userId" name="userId" placeholder="아이디">
			<span id=id style="text-align:left;" class="validity"></span>
			<input type="email" class="input-style" id="userEmail" name="userEmail" placeholder="이메일" style="margin:10px 0px 0px 0px;">
			<span id="email" style="text-align:left;" class="validity"></span>
			<input type="submit" value="비밀번호 찾기" id="findPwdBtn" class="btn-style-mint">
			</form>
			</div>
			<a href="/">메인으로 이동</a>
 </div>


</div>

<script>
<%-- ID 유효성 검사 --%>
$("input[name='userId']").keyup(function(){
     var regId=/^[a-zA-Z0-9]{5,15}$/;
     if(regId.test($(this).val())){
   	  $('#id').css("display","none");
   	  $('#userId').css("border-color","#C8C8C8");
   	 
     }else{
        $('#id').css("color",'#FD8A69');
        $('#id').html("아이디는 영문,숫자 5자 이상이어야 합니다.");
        $('#id').css("display","block");
        $('#userId').css("border-color","#FD8A69");
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
	$('#findPwdBtn').click(function(){
		/*아이디작성칸이 빈칸일때*/
		if(($('#userId').val())=="")
		{
		alert('아이디를 작성해주세요');
		 // $('#name').css("color",'#FD8A69');
		 // $('#name').html("이름을 입력해주세요.");
		 // $('#name').css("display","block");
		  $('#userId').css("border-color","#FD8A69");
		return false;
		}
		
		if(($('#userEmail').val())=="")
		{
		alert('이메일을 작성해주세요');
		$('#userEmail').css("border-color","#FD8A69");
		return false;
		}
		  var id =  $('#userId').css("border-color")=="rgb(200, 200, 200)";
		 var email =  $('#userEmail').css("border-color")=="rgb(200, 200, 200)";
		 if(id&&email){
    		 $('#findPwdForm').attr("action","/member/findPwd.do");
             $('#findPwdBtn').submit();
          }else{
       
             alert("실패");
             return false;
          }
	});
	
	
	</script>



</body>
</html>