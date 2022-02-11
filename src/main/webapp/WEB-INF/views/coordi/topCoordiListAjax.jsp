<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/index.css">
<script src="/resources/common/common.js"></script>
</head>
<body>	
		<c:choose>
			<c:when test="${list.size()<4 }">
				<c:forEach items="${list }" var="coordi">
					<div class="rankCoordiImg"><img alt="" src="${coordi.filePath }"></div>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${list }" var="coordi" end="3">
					<div class="rankCoordiImg"><img alt="" src="${coordi.filePath }"></div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		
		
</body>
</html>