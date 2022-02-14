<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">


    <meta charset="UTF-8">
    <title>오늘 뭐 입지? - 마이페이지</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/common/common.css">
    <link rel="stylesheet" href="/resources/common/header.css">
	<link rel="stylesheet" href="/resources/common/footer.css">
	<link rel="stylesheet" href="/resources/css/myPage/myStyle.css">
    <script src="/resources/common/common.js"></script>

    <style>
       
    </style>

</head>



<body>
<div id="wrap">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div id="content">
        <div id="body">
        	<jsp:include page="/WEB-INF/views/myPage/include/profile.jsp" />

            <div class="contents-wrap">
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 코디</div>
                    <div class="contents-num">${requestScope.myCoordiList.size() }</div>
                    <div class="contents-plus">
                    	<c:if test="${!requestScope.myCoordiList.isEmpty() }">
                    		<a href="/mypage/myCoordi.do">전체보기</a>
                    	</c:if>
                    </div>
                </div>
                
                <c:choose>
                	<c:when test="${!requestScope.myCoordiList.isEmpty() }">
                		<div class="contents-area">
                			<c:forEach items="${requestScope.myCoordiList }" var="mcList" varStatus="i" begin="0" end="7">
                				<a href="/coordi/coordiPost.do?coordiNo=${mcList.coordiNo}">
			                        <div class="contents"><img src="${mcList.filepath }"></div>
			                    </a>
                			</c:forEach>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<a>
		                	<div class="contents-area-null"> 코디를 추가해주세요 :)</div>
		                </a>
                	</c:otherwise>
                	
                </c:choose>
                
                <div id="space"></div>
                
                
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 잇템</div>
                    <div class="contents-num">${requestScope.myItTemList.size() }</div>
                    <div class="contents-plus">
                    	<c:if test="${!requestScope.myItTemList.isEmpty() }">
                    		<a href="/mypage/myItTem.do">전체보기</a>
                    	</c:if>
                    </div>
                </div>
                
                
                <c:choose>
                	<c:when test="${!requestScope.myItTemList.isEmpty() }">
                		<div class="contents-area">
                			<c:forEach items="${requestScope.myItTemList }" var="mITList" varStatus="i" begin="0" end="7">
                				<a href="/coordi/ItPost.do?itItemNo=${mITList.itTemNo}">
			                        <div class="contents"><img src="${mITList.filepath }"></div>
			                    </a>
                			</c:forEach>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<a>
		                	<div class="contents-area-null"> 잇템을 추가해주세요 :)</div>
		                </a>
                	</c:otherwise>
                	
                </c:choose>
                
            </div>
            

        </div>


    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/followerModal.jsp" />
    <jsp:include page="/WEB-INF/views/myPage/include/followingModal.jsp" />
    
</div>


</body>

</html>
