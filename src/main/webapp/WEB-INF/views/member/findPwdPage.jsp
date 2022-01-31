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
				<li class="tab-link" data-tab="tab-2">아이디 찾기</li><span style="color:#C8C8C8;">l</span><li class="tab-link current" data-tab="tab-1" id="pwdTab">비밀번호 찾기</li>
			</ul>
			<br>
			<div id="tab-2" class="tab-content">
			<input type="text" class="input-style" name="userName" placeholder="이름" style="margin:0px 0px 10px 0px;">
			<br>
			<input type="email" class="input-style" name="userEmail" placeholder="이메일">
			<br>
			<input type="button" value="아이디 찾기" id="findId" class="btn-style-mint">
			</div>

			<div  id="tab-1" class="tab-content current">
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
			

		// 아이디 찾기
		$("#findId").click(
				function() {
					var name = $("input[name=userName]").val();
					var email = $("input[name=userEmail]").val();

					$.ajax({
						url : "/member/AjaxFindId.do",
						type : "post",
						data : {
							"userName" : name,
							"userEmail" : email
						},
						success : function(id) {
							var findId = $.trim(id);
							if (findId != "") {
								$("#alertModalMSG").html(name + "님 아이디는 " + id + "입니다.");
								$("#btn").css("display", "none");
								$("#pwdBtn").css("display", "block");
								$("#loginBtn").css("display", "block");
							} else {
								$("#alertModalMSG").html("입력하신 정보로 아이디를 찾을 수 없습니다." + "<br>"
														+ "이름과 이메일을 확인해주세요.");
								$("#btn").css("display", "show");
								$("#loginBtn").css("display", "none");
								$("#movePwdBtn").css("display", "none");
							}
						}
					})
					$("#alertModal").modal("show");
				})

		// 비밀번호 찾기
		$("#findPwd").click(
				function() {
					var userId = $("input[name=userId]").val();
					var email = $("input[name=pwdUserEmail]").val();

					$.ajax({
						url : "/member/AjaxFindPwd.do",
						type : "post",
						data : {
							"userId" : userId,
							"userEmail" : email
						},
						success : function(result) {
							var findPwd = $.trim(result);
							if (findPwd != "") {
								$("#alertModalMSG").html( email + " 주소로 임시비밀번호가 발급되었습니다.");
								$("#btn").css("display", "block");
								$("#movePwdBtn").css("display", "none");
								$("#loginBtn").css("display", "block");
							} else {
								$("#alertModalMSG").html("입력하신 정보로 비밀번호를 찾을 수 없습니다." + "<br>"
														+ "아이디와 이메일을 확인해주세요.");
								$("#movePwdBtn").css("display", "none");
								$("#loginBtn").css("display", "none");
								$("#btn").css("display", "show");
							}
							$("#alertModal").modal("show");
						}
					})
				})

		
	</script>


</div>
</body>
</html>