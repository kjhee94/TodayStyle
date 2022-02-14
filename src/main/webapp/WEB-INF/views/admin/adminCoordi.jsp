<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_오늘의 코디 관리</title>
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
					<span id="topTitle">오늘의 코디 관리</span>
					<span>Home &nbsp-&nbsp 게시판 관리 &nbsp-&nbsp </span>
					<span id="topAction">오늘의 코디 관리</span>
				</div>
				<a href="/member/logout.do">로그아웃</a>
			</div>
			
			<div id="container">
				<div id="searchAndBtn">
					<form action="/admin/coordiSearch.do" method="get">
						<div id="boxSelect">
							<select class="select-style" name="type">
								<option disabled selected>필터선택</option>
								<option value="nickName">작성자</option>
								<option value="coordiContent">내용</option>
								<option value="hashTag">해시태그</option>
							</select>
							<i class="fas fa-chevron-down"></i>
						</div>
						
						<div id="boxSearch">
							<input class="input-style" type="text" name="keyword" placeholder="검색어를 입력하세요">
							<button type="submit"><i class="fas fa-search"></i></button>
						</div>
					</form>
					<div id="boxBtn">
						<button id="checkedDeleteCoordiBtn" class="btn-style">삭제</button>
					</div>
				</div>
				
				<table>
					<tr>
						<th><input type="checkbox" id="Allcheck"></th>
						<th>코디 번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>기온</th>
						<th>계절</th>
						<th>성별</th>
						<th>작성일</th>
						<th>의상정보</th>
						<th>해시태그</th>
						<th>댓글관리</th>
						<th>삭제</th>
					</tr>
					
					<c:choose>
						<c:when test="${!requestScope.map.list.isEmpty() }">
							<c:forEach items="${requestScope.map.list }" var="c">
								<c:if test="${c.delYN eq 'N'.charAt(0)}">
									<tr>
								</c:if>
								<c:if test="${c.delYN eq 'Y'.charAt(0)}">
									<tr class="deactivate">
								</c:if>
									<td>
										<c:if test="${c.delYN eq 'N'.charAt(0)}">
											<input type="checkbox" name="coordiNo" value="${c.coordiNo}">
										</c:if>
										<c:if test="${c.delYN eq 'Y'.charAt(0)}">
											<input type="checkbox" name="coordiNo" value="${c.coordiNo}" disabled>
										</c:if>
									</td>
									<td>${c.coordiNo}</td>
									<td>${c.nickName}</td>
									<td>
										<div class="relative">
											<div class="ellipsis unenter">${c.coordiContent}</div>
											<c:if test="${c.delYN eq 'N'.charAt(0)}">
												<div class="box-hovor">${c.coordiContent}</div>
											</c:if>
											<c:if test="${c.delYN eq 'Y'.charAt(0)}">
												<div>${c.coordiContent}</div>
											</c:if>
										</div>
									</td>
									<td>${c.temperature}</td>
									<td>${c.season}</td>
									<td>${c.gender}</td>
									<td>${c.regDate}</td>
									<td>
										<div class="relative">
											<div class="btn-style-icon btn-item-info">
												<i class="fas fa-tshirt"></i>
											</div>
											<c:if test="${c.delYN eq 'N'.charAt(0)}">
												<div class="box-style detail" coordiNo="${c.coordiNo}">
											</c:if>
											<c:if test="${c.delYN eq 'Y'.charAt(0)}">
												<div class="box-style" coordiNo="${c.coordiNo}">
											</c:if>
											</div>
										</div>
									</td>
									<td>
										<div class="relative">
											<div class="btn-style-icon">
												<i class="fas fa-hashtag"></i>
											</div>
											<c:if test="${c.delYN eq 'N'.charAt(0)}">
												<div class="box-hashtag detail">
											</c:if>
											<c:if test="${c.delYN eq 'Y'.charAt(0)}">
												<div class="box-hashtag">
											</c:if>
												<c:forTokens var="hashTag" items="${c.hashTag }" delims=",">
													<div class="h-wrap">#${hashTag}</div>
												</c:forTokens>
											</div>
										</div>
									</td>
									<td>
										<c:if test="${c.delYN eq 'N'.charAt(0)}">
											<a href="/admin/adminCoordiComment.do?coordiNo=${c.coordiNo}">
										</c:if>
										<c:if test="${c.delYN eq 'Y'.charAt(0)}">
											<a>
										</c:if>
											<div class="btn-style-icon">
												<i class="far fa-comment-dots"></i>
											</div>
										</a>
									</td>
									<td>
										<div class="btn-style-icon btn-one-coordi-delete" delyn="${c.delYN}" coordiNo="${c.coordiNo}">
											<c:if test="${c.delYN eq 'N'.charAt(0)}">
												<i class="fas fa-trash"></i>
											</c:if>
											<c:if test="${c.delYN eq 'Y'.charAt(0)}">
												<i class="fas fa-trash-restore"></i>
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="txt-none">
								<td colspan="12">검색된 코디가 없습니다</td>
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