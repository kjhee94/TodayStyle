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
<title>베스트</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/beststyle/best.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">이번주 베스트</li><li class="tab-link" data-tab="tab-2">역대 베스트</li>
	</ul>
	<div id="tab-1" class="tab-content current">
		<div id="bestWeek"  >
		
		<div class="1" style="width:100%; height: 465px;">
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				1
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
			
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				2
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
			
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				3
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
			
			
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				4
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
		</div>
		
		<div class="2" style="width:100%; height: 465px;">
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				1
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
			
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				2
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
			
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				3
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
			
			
			<div  style="border:1px solid black; width:23%;height:465px; float:left; margin:0px 28px 30px 0px;  box-sizing: border-box;">
			<div style="position:relative; ">
			<img src="/resources/images/icon/코디.png" style=" width:100%;height:100%;"  >
			</div>
			
			<div style="display:inline-block; position:absolute; top:230px; ">
				<div style="display:relative;">
				<img src="/resources/images/icon/saved_on.png" style=" width:34px; height:46.48px; ">
				</div>
				<div style="position:absolute; top:12px; left:13px; color:white;">
				4
				</div>
			</div>
			
			<div style="display:inline-block; position:absolute; top:635px; ">
				<a href=""><img alt="프로필" src="/resources/images/icon/profile.jpg"  style="width:40px; height:40px; border-radius:50%;">
				<span style="color:white; font-size:18px; font-weight:bold;">여니여니</span></a>
			</div>
				
			
			</div>
		</div>
			
		</div>
		
		</div>
	</div>
	

	<div id="tab-2" class="tab-content">
		<div class="bestb">
			<div class="best">
			
			</div>
		</div>
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
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>