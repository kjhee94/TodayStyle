<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
        	<jsp:include page="/WEB-INF/views/myPage/include/userProfile.jsp" />

            <div class="contents-wrap">
                <div class="contents-title-wrap">
                    <div class="contents-title">코디</div>
                    <div class="contents-num">${requestScope.memberCoordiList.size() }</div>
                    <div class="contents-plus">
                    	<c:if test="${!requestScope.memberCoordiList.isEmpty() }"> 
                    		<a href="/mypage/memberCoordi.do?userId=${requestScope.memberUserId }">전체보기</a>
                    	</c:if>
                    </div>
                </div>
               
                <c:choose>
                
                	<c:when test="${!requestScope.memberCoordiList.isEmpty() }">
                		<div class="contents-area">
                			<c:forEach items="${requestScope.memberCoordiList }" var="mcList" varStatus="i" begin="0" end="7">
                				<a>
			                        <div class="contents">
			                        	<img src="${mcList.filepath }">
			                        </div>
			                    </a>
                			</c:forEach>
                		</div>
                	</c:when>
                	
                	<c:otherwise>
                		<a>
		                	<div class="contents-area-null-member"> 작성된 코디가 없습니다.</div>
		                </a>
                	</c:otherwise>
                	
                </c:choose>
                 
                <div id="space"></div>
                
                
                <div class="contents-title-wrap">
                    <div class="contents-title">잇템</div>
                    <div class="contents-num">${requestScope.memberItTemList.size() }</div>
                    <div class="contents-plus">
                    	<c:if test="${!requestScope.memberItTemList.isEmpty() }">
                    		<a href="/mypage/memberItTem.do?userId=${requestScope.memberUserId }">전체보기</a>
                    	</c:if>
                    </div>
                </div>
                
                
                <c:choose>
                	<c:when test="${!requestScope.memberItTemList.isEmpty() }">
                		<div class="contents-area">
                			<c:forEach items="${requestScope.memberItTemList }" var="mITList" varStatus="i" begin="0" end="7">
                				<a>
			                        <div class="contents"><img src="${mITList.filepath }"></div>
			                    </a>
                			</c:forEach>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<a>
		                	<div class="contents-area-null-member">작성된 잇템이 없습니다.</div>
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
