<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/board/detailPage.css">
</head>

<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
		<div class="notice-wrap">
			<div class="notice-info">
				<span class="title">택배파업으로 인한 배송지연</span>
			</div>
			<div class="notice-info">
				<div class="info-one">
					<span>작성자</span>
					<span>운영자</span>
				</div>
				<div class="info-one">
					<span>작성일</span>
					<span>2022/12/12</span>
				</div>
			</div>
			<div class="notice-content">
				<p>
					내용입니다. 내용이에요. 내용이지요.
					무슨 내용을 적어야 하지
					내용을 채워야 해
					채워야해~~~~~~~~~~~~~~
					화이팅~~~~~~!!
					이 정도면 됐겠지 ㅎ.ㅎ
					내용입니다. 내용이에요. 내용이지요.
					무슨 내용을 적어야 하지
					내용을 채워야 해
					채워야해~~~~~~~~~~~~~~
					화이팅~~~~~~!!
					이 정도면 됐겠지 ㅎ.ㅎ
				</p>
			</div>
		</div>
		
		<div class="box-btn">
			<button class="btn-style-mint">
				<a href="">목록</a>
			</button>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>