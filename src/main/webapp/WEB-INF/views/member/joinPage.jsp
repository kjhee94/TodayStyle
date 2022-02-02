<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/css/member/joinPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>

	<div id="content">
		<form id="joinForm" action="/member/joinMember.do" method="post">
		
			<div id="logo">
				<a href="/" id="logo"><img alt="오늘 뭐 입지 로고" src="/resources/images/logo.png"></a>
			</div>
		
	        <span class="title">아이디</span>
	        <span class="explain">영문,숫자를 포함한 12자 이상의 아이디를 입력해주세요</span>
	        <input type="text" id="id" class="input-style" name="userId" placeholder="아이디"/>
        
	        <span class="title">비밀번호</span>
	        <span class="explain">영문,숫자를 포함한 8자 이상의 비밀번호를 입력해주세요</span>
	        <input type="password" class="input-style" name="userPwd" placeholder="비밀번호"/>
	        <input type="password" class="input-style" name="userpwd_re" placeholder="비밀번호 확인">
        
	        <span class="title">이름</span>
	        <input class="input-style" name="userName" placeholder="이름"/>
        
	        <span class="title">닉네임</span>
	        <span class="explain">다른 유저와 겹치지 않는 별명을 입력해주세요(2~15자)</span>
	        <input type="text" class="input-style" name="nickname" placeholder="닉네임"/>
       
	        <span class="title">이메일</span>
	        <input type="text" class="input-style" name="userEmail" placeholder="이메일"/>
	        <button class="btn-style-mint btn-certified"><a>이메일 인증</a></button>
        
       		<span class="title">성별</span>
       		<div class="box-radio">
		        <div><input type="radio" id="female" name="gender" value="여자"><label for="female">여자</label></div>
		        <div><input type="radio" id="male" name="gender" value="남자"><label for="male">남자</label></div>
		        <div><input type="radio" id="non" name="gender" value="비공개" checked><label for="non">비공개</label></div>
			</div>
       
        	<span class="title">약관동의</span>
       		<div class="box-agree">
       			<div class="whole"><input type="checkbox" id="allcheckbox"><label for="allcheckbox">전체동의</label></div>
		       	<div class="box-checkbox">
		       		<div><input type="checkbox" id="agree1" name="agree"><label for="agree1">이용약관 <span class="small">(필수)</span></label></div>
		       		<div><input type="checkbox" id="agree2" name="agree"><label for="agree2">개인정보 처리방침 <span class="small">(필수)</span></label></div>
		       		<div><input type="checkbox" id="agree3" name="agree"><label for="agree3">마케팅 수신동의 <span class="small un">(선택)</span></label></div>
		    	</div>
	       	</div>
	       	
	        <input type="submit" class="btn-style-mint" value="회원 가입">
    	</form>
    </div>
    
    
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
</body>
</html>