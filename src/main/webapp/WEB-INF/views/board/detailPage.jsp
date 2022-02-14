<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/board/detailPage.css">
<script src="/resources/common/common.js"></script>
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
</head>

<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
		<div class="notice-wrap">
			<div class="notice-info">
				<span class="title">${requestScope.n.title }</span>
			</div>
			<div class="notice-info">
				<div class="info-one">
					<span>작성자</span>
					<span>${requestScope.n.userName }</span>
				</div>
				<div class="info-one">
					<span>작성일</span>
					<span>${requestScope.n.regdate}</span>
				</div>
			</div>
			<div class="notice-content">
				<p>
					${requestScope.n.content }
				</p>
			</div>
		</div>
		
		<div class="box-btn">
			<button class="btn-style-mint">
				<a href="/board/NoticePage.do?currentPage=${requestScope.currentPage }">목록</a>
			</button>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>