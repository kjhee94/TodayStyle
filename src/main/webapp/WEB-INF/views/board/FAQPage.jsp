<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지? - 자주 묻는 질문</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/board/boardPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>  
<script src="/resources/common/common.js"></script>
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
</head>

<body>
	<div id="wrap">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
		<div id="content">
			<div class="box-tabs">
				<ul class="tabs">
					<a href="/board/NoticePage.do"><li class="tab-link" data-tab="tab-1">공지사항</li></a>
					<a href="/board/FAQPage.do?type=all"><li class="tab-link current" data-tab="tab-2">자주 묻는 질문</li></a>
				</ul>
			</div>
		
		<div id="tab-2" class="tab-content">
				<div class="box-category">
					<button><a href="/board/faqClick.do?type=all">전체</a></button>
					<button><a href="/board/faqClick.do?type=member">회원/정보</a></button>
					<button><a href="/board/faqClick.do?type=write">게시글</a></button>
					<button><a href="/board/faqClick.do?type=etc">기타</a></button>
				</div>
			
				<div class="faq">
					<c:choose>
						<c:when test="${!requestScope.list.isEmpty() }">
							<c:forEach items="${requestScope.list }" var="f" varStatus="i">
							<div class="faq-row">
								<div class="q-box">
									<span>${f.category }</span>
									<div>
										<span>Q</span>
										<span>${f.title }</span>
										<i class="fas fa-chevron-down"></i>
									</div>
								</div>
								<div class="a-box">
									<span>A</span>
									<p>${f.content }</p>
								</div>
							</div>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<div class="q-box">
									
									<div>
										검색 결과가 없습니다.
										
										
									</div>
								</div>
						</c:otherwise>
					</c:choose>
			  	</div>
			</div>
			</div>
			
			
			<script>
			$(document).ready(function(){
			$(".q-box").click(function(){
				if($(this).next(".a-box").css("display") == "none") {
					$(this).next(".a-box").slideDown(250);
					$(this).find(".fa-chevron-down").addClass("on");
					
					$(".a-box").not($(this).next(".a-box")).slideUp(250);
					$(".fa-chevron-down").not($(this).find(".fa-chevron-down")).removeClass("on");
				}
				else {
					$(this).next(".a-box").slideUp(250);
					$(this).find(".fa-chevron-down").removeClass("on");
				}
		    });
			});
			</script>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>