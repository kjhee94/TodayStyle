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
					<a href="/board/NoticePage.do"><li class="tab-link current" data-tab="tab-1">공지사항</li></a>
					<a href="/board/FAQPage.do?type=all"><li class="tab-link" data-tab="tab-2">자주 묻는 질문</li></a>
				</ul>
			</div>
		
		
		<div id="tab-1" class="tab-content on">
			
				<form action="/board/noticeSearch.do" method="get">
				<div class="box-search">
					<input class="search-style" type="text" name="keyword" placeholder="검색어를 입력하세요">
				<button type="submit"><i class="fas fa-search"></i></button>	
					
				</div>
				</form>
				
				<div class="notice">
					<table id="noticeTable">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						
						<c:choose>
							<c:when test="${!requestScope.nlist.isEmpty() }">
								<c:forEach items="${requestScope.nlist }" var="n" varStatus="i">
								<tr>
									<td>${n.noticeNo }</td>
									<td>
										<div class="ellipsis"><a href="/board/detailPage.do?noticeNo=${n.noticeNo }&currentPage=${requestScope.currentPage}">${n.title }</a></div>
									</td>
									<td>${n.userName }</td>
									<td>${n.regdate}</td>
								</tr>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<tr>
									
									<td colspan="4">검색하신 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					
					<!-- pageNavi -->
					<div id="page_wrap">
						<ul class="page_ul">
							${requestScope.pageNavi }
		 				</ul>
				    </div>
				</div>
			</div>
			</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>