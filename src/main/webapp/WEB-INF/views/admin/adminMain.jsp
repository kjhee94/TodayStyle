<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_메인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/adminCommon.css">
<link rel="stylesheet" href="/resources/common/adminHeader.css">
<link rel="stylesheet" href="/resources/css/admin/adminMain.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/admin.js"></script>
</head>

<body>

	<div id="wrap">
		<!-- adminHeader -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		
		<div id="content">
			<div id="top">
				<div id="topLink">
					<span id="topTitle">Home</span>
				</div>
				<a href="/member/logout.do">로그아웃</a>
			</div>
			
			<div id="container">
				<div class="box-counts">
					<div class="box-count">
						<a href="/admin/adminMember.do">
							<span class="tit-count">가입한 회원 수</span>
							<span class="date-count">${requestScope.date } 기준</span>
							<span class="result-count count-member"></span>
						</a>
					</div>
					<div class="box-count">
						<a href="/admin/adminCoordi.do">
							<span class="tit-count"><span class="top-count">오늘의 코디</span>작성된 피드 수</span>
							<span class="date-count">${requestScope.date } 기준</span>
							<span class="result-count count-coordi"></span>
						</a>
					</div>
					<div class="box-count">
						<a href="/admin/adminIttem.do">
							<span class="tit-count"><span class="top-count">오늘의 잇템</span>작성된 피드 수</span>
							<span class="date-count">${requestScope.date } 기준</span>
							<span class="result-count count-ittem"></span>
						</a>
					</div>
				</div>
			</div>
			
			<div id="bottom">
				<p>© 2022. 투데이스타일 Inc. all rights reserved</p>
			</div>
		</div>
	</div>
	
	
	<!-- 숫자 카운팅 모션 -->
	<script>
		var countMember= ${requestScope.map.get("countMember")};
		var countCoordi= ${requestScope.map.get("countCoordi")};
		var countIttem= ${requestScope.map.get("countIttem")};
	  
		$({ val : 0 }).animate({ val : countMember }, {
			duration: 1000,
			step: function() {
				var num = numberWithCommas(Math.floor(this.val));
				$(".count-member").text(num);
			},
			complete: function() {
				var num = numberWithCommas(Math.floor(this.val));
				$(".count-member").text(num);
			}
		});
		
		$({ val : 0 }).animate({ val : countCoordi }, {
			duration: 1000,
			step: function() {
				var num = numberWithCommas(Math.floor(this.val));
				$(".count-coordi").text(num);
			},
			complete: function() {
				var num = numberWithCommas(Math.floor(this.val));
				$(".count-coordi").text(num);
			}
		});
		
		$({ val : 0 }).animate({ val : countIttem }, {
			duration: 1000,
			step: function() {
				var num = numberWithCommas(Math.floor(this.val));
				$(".count-ittem").text(num);
			},
			complete: function() {
				var num = numberWithCommas(Math.floor(this.val));
				$(".count-ittem").text(num);
			}
		});
		
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
	 
</body>
</html>