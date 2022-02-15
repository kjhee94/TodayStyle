<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?-오늘의 코디 댓글 관리</title>
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/adminCommon.css">
<link rel="stylesheet" href="/resources/common/adminHeader.css">
<link rel="stylesheet" href="/resources/css/admin/adminCoordi.css">
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
					<span id="topTitle">오늘의 코디 댓글 관리</span>
					<span>Home &nbsp-&nbsp 게시판 관리 &nbsp-&nbsp 오늘의 코디 관리 &nbsp-&nbsp </span>
					<span id="topAction">오늘의 코디 댓글 관리</span>
				</div>
				<a href="/member/logout.do">로그아웃</a>
			</div>
			
			<div id="container">
				<div id="searchAndBtn">
					<form action="/admin/coordiCommentSearch.do" method="get">
						<div id="boxSelect">
							<select class="select-style" name="type">
								<option disabled selected>필터선택</option>
								<option value="nickName">작성자</option>
								<option value="cmtContent">내용</option>
							</select>
							<i class="fas fa-chevron-down"></i>
						</div>
						
						<div id="boxSearch">
							<input class="input-style" type="text" name="keyword" placeholder="검색어를 입력하세요">
							<input type="hidden" name="coordiNo" value="${requestScope.coordiNo}">
							<button type="submit"><i class="fas fa-search"></i></button>
						</div>
					</form>
					<div id="boxBtn">
						<button id="checkedDeleteCCommentBtn" class="btn-style">삭제</button>
					</div>
				</div>
				
				<table>
					<tr>
						<th><input type="checkbox" id="Allcheck"></th>
						<th>댓글 번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일</th>
						<th>삭제</th>
					</tr>
				
					<c:choose>
						<c:when test="${!requestScope.map.list.isEmpty() }">
							<c:forEach items="${requestScope.map.list }" var="cc">
								<c:if test="${cc.cmtDelYN eq 'N'}">
									<tr>
								</c:if>
								<c:if test="${cc.cmtDelYN eq 'Y'}">
									<tr class="deactivate">
								</c:if>
									<td>
										<c:if test="${cc.cmtDelYN eq 'N'}">
											<input type="checkbox" name="cmtNo" value="${cc.cmtNo}">
										</c:if>
										<c:if test="${cc.cmtDelYN eq 'Y'}">
											<input type="checkbox" name="cmtNo" value="${cc.cmtNo}" disabled>
										</c:if>
									</td>
									<td>${cc.cmtNo}</td>
									<td>${cc.nickName}</td>
									<td>${cc.cmtContent}</td>
									<td>${cc.cmtTime}</td>
									<td>
										<div class="btn-style-icon btn-one-coordi-comment-delete" delyn="${cc.cmtDelYN}" cmtNo="${cc.cmtNo}">
											<c:if test="${cc.cmtDelYN eq 'N'}">
												<i class="fas fa-trash"></i>
											</c:if>
											<c:if test="${cc.cmtDelYN eq 'Y'}">
												<i class="fas fa-trash-restore"></i>
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="txt-none">
								<td colspan="8">댓글 결과가 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
					
				<div id="page_wrap">
					<ul class="page_ul">
						${requestScope.map.pageNavi}
	 				</ul>
			    </div>
			</div>
			
			<div id="bottom">
				<p>© 2022. 투데이스타일 Inc. all rights reserved</p>
			</div>
		</div>
	</div>
	
</body>
</html>