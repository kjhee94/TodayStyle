<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/member/joinPage.css">
</head>
<body>
<style>
	
	#logo{
	margin: 0 auto;
	}
	.btn-style-mint
	{
	width:400px;
	margin:30px 0px 0px;
	}
	.input-style
	{
	width:400px;
	}
	
	#whole{
	margin:17px 0px 0px 15px;
	
	}
	#whole:after {
	content: "";
	display: block;
	width: 370px;
	border: 1px solid #C8C8C8;
	margin: 17px 0px 0px 0px;
}
.checkbox
{
width:18px;
height:18px;
margin: 0px 12px 0px 0px;
}

#allcheckbox
{
margin: 0px 12px 0px 0px;
}
	
</style>
<div id="content">
<form id="join" action="/member/joinMember.do" method="post">
		
		 <div id="logo">
				<a href="/" id="logo"><img alt="오늘 뭐 입지 로고" src="/resources/images/logo.png"></a>
		</div><br>
		
        <span class="span">아이디</span>
        <span class="span2">영문,숫자를 포함한 12자 이상의 아이디를 입력해주세요</span><br>
        <input type="text" id="id" class="input-style" name="userId" placeholder="아이디"/><br><br>
       
        
        <span class="span">비밀번호</span>
        <span class="span2">영문,숫자를 포함한 8자 이상의 비밀번호를 입력해주세요</span>
        <input type="text" class="input-style" name="userPwd" style="margin:0px 0px 13px 0px;" placeholder="비밀번호"/><br>
        <input type="text" class="input-style" name="userpwd_re" placeholder="비밀번호 확인"><br><br>
        
        <span class="span">이름</span>
        <span class="span2"> &nbsp; </span>
        <input class="input-style" name="userName" placeholder="이름"/><br><br>
        
        <span class="span">닉네임</span>
        <span class="span2">다른 유저와 겹치지 않는 별명을 입력해주세요(2~15자)</span>
        <input type="text" class="input-style" name="nickname" placeholder="닉네임"/><br><br>
       
        <span class="span">이메일</span>
        <span class="span2"> &nbsp; </span>
        <input type="text" class="input-style" name="userEmail" placeholder="이메일"/>
        <button class="btn-style-mint" style="margin: 10px 0px 0px;"><a>이메일 인증</a></button><br><br>
        
       <div>
        <span class="span">성별</span><br>
        <div style="margin:22px 0px 0px 0px; display: flex;
justify-content: space-between;">
	<div>
        <input type="radio" name="gender" value="여자"><span style="color:#707070; font-size:16px;">여자</span>
    </div>
    <div>    
        <input type="radio" name="gender" value="남자"><span style="color:#707070; font-size:16px;">남자</span>
    </div>   
    <div>    
        <input type="radio" name="gender" value="비공개" checked><span style="color:#707070; font-size:16px;">비공개</span>
    </div>  
        </div>
        </div>
        <br>
       
        
        <span class="span">약관동의</span><br>
        <div style="border:1px solid #C8C8C8;margin:10px 0px 0px 0px; ">
        <div id="whole" >
        <input type="checkbox" id="allcheckbox"><span style="color:#707070; font-size:16px; font-weight:bold;">전체동의</span><br>
       </div>
       <div class="check" style="margin: 10px 0px 0px 15px;">
        <input type="checkbox" name="agree" style="margin: 0px 15px 0px 0px;"><span style="font-size:16px; color:#707070;">이용약관 </span><span style="font-size:12px; color:#A9D4D9">(필수)</span><br>
       </div>
       <div class="check" style="margin: 26px 0px 0px 15px;">
        <input type="checkbox" name="agree" style="margin: 0px 15px 0px 0px;"  ><span style="font-size:16px; color:#707070;">개인정보 처리방침 </span><span style="font-size:12px; color:#A9D4D9">(필수)</span><br>
       </div>
       <div class="check" style="margin: 26px 0px 13px 15px;">
        <input type="checkbox" name="agree" style="margin: 0px 15px 0px 0px;"  ><span style="font-size:16px; color:#707070;">마케팅 수신동의 </span><span style="font-size:12px; color:#C8C8C8">(선택)</span><br>
       </div>
       
       <div>
       </div>
       </div>
        <input type="submit" class="btn-style-mint" value="회원 가입">
        
      
        
        
    </form>
    
    <script>
			$('#allcheckbox').click(function() {
				if ($(this).prop('checked')) {
					$('input[name=agree]').prop('checked', true);
				} else {
					$('input[name=agree]').prop('checked', false);
				}
			});
		</script>
		
		
		<script>
		var authKey;
		//입력받은 값 유효성검사 호출
		$("input[name]").keyup(function() {
							var exp = "";
							//입력하고 있는 데이터에 맞는 정규식을 찾아 exp에 넣음
							if ($(this).attr("name") == "userId") { // 아이디
								exp = "^[a-z0-9]{6,12}$";
							} else if ($(this).attr("name") == "userPwd") { // 비밀번호
								exp = "^(?=.+[a-z])(?=.+[0-9])(?=.+[~!@#$%^&*-+]).{8,14}";
							} else if ($(this).attr("name") == "userPwd_re") {//비밀번호 확인    
								var pw = $("input[name=userPwd]").val();
								if ($(this).val() == pw) {
									$(this).parent().next().children().next().css("color", "green");
									$(this).attr("vali", "T");
								} else {
									$(this).parent().next().children().next().css("color", "red");
									$(this).attr("vali", "F");
								}
								$(this).parent().next().css("display", "block");
								return;
							} else if ($(this).attr("name") == "userName") {//이름 확인
								exp = "^[가-힣]{2,10}$";
							} else if ($(this).attr("name") == "userEmail") {//이메일 확인
								exp = ".+@.+";
							} else if ($(this).attr("name") == "userPhone") {//전화번호 확인
								exp = "^[0-9]{10,11}$";
							}
							$(this).parent().next().css("display", "block");

							//정규식 결과에 따라 span 태그에 있는 메시지를 보여줌
							var result = checkValidation($(this).val(), exp);
							if (result) {
								$(this).parent().next().children().next().css("color", "green");
								$(this).attr("vali", "T");
							} else {
								$(this).parent().next().children().next().css("color", "red");
								$(this).attr("vali", "F");
							}
							$(this).parent().next().css("display", "block");
						});

		//입력값과 정규식을 매개변수로 받아 유효성 검사
		function checkValidation(value, exp) {
			var exp = new RegExp(exp);
			return exp.test(value);
		}
		</script>

</div>


</body>
</html>