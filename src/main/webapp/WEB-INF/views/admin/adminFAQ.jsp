<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_자주 묻는 질문 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/adminCommon.css">
<link rel="stylesheet" href="/resources/common/adminHeader.css">
<link rel="stylesheet" href="/resources/css/admin/adminFAQ.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/admin.js"></script>
</head>

<body>

	<div id="insertModel">
		<div class="model-area">
			<div class="model-top">
				<h4>자주 묻는 질문 작성</h4>
				<i class="fas fa-times model-close"></i>
			</div>
			<form action="/admin/faqInsert.do" method="post">
				<div class="model-middle">
					<div class="box-select">
						<select class="select-style" name="category">
							<option disabled selected>카테고리</option>
							<option value="회원/정보">회원/정보</option>
							<option value="게시글">게시글</option>
							<option value="기타">기타</option>
						</select>
						<i class="fas fa-chevron-down"></i>
					</div>
					<input type="text" class="model-title" name="title" placeholder="제목을 입력하세요">
				</div>
				<textarea class="model-content" name="content" placeholder="내용을 입력하세요"></textarea>
				<input type="submit" class="btn-style" value="등록">
			</form>
		</div>
	</div>
	
	<div id="wrap">
		<!-- adminHeader -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		
		<div id="content">
			<div id="top">
				<div id="topLink">
					<span id="topTitle">자주 묻는 질문 관리</span>
					<span>Home &nbsp-&nbsp 공지 관리 &nbsp-&nbsp </span>
					<span id="topAction">자주 묻는 질문 관리</span>
				</div>
				<a href="/member/logout.do">로그아웃</a>
			</div>
			
			<div id="container">
				<div id="searchAndBtn">
					<form action="/admin/faqSearch.do" method="get">
						<div id="boxSelect">
							<select class="select-style" name="category">
								<option disabled selected>카테고리</option>
								<option value="회원/정보">회원/정보</option>
								<option value="게시글">게시글</option>
								<option value="기타">기타</option>
							</select>
							<i class="fas fa-chevron-down"></i>
						</div>
						
						<div id="boxSearch">
							<input class="input-style" type="text" name="keyword" placeholder="검색어를 입력하세요">
							<button type="submit"><i class="fas fa-search"></i></button>
						</div>
					</form>
					<div id="boxBtn">
						<button id="checkedDeleteFAQBtn" class="btn-style">삭제</button>
						<button id="writeBtn" class="btn-style">글쓰기</button>
					</div>
				</div>
				
				<c:choose>
					<c:when test="${!requestScope.map.isEmpty() }">
						<table>
							<tr>
								<th><input type="checkbox" id="Allcheck"></th>
								<th>글번호</th>
								<th>카테고리</th>
								<th>질문</th>
								<th>답변</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
							
							<c:forEach items="${requestScope.map.list }" var="f">
								<c:if test="${f.endYN eq 'N'.charAt(0)}">
									<tr>
								</c:if>
								<c:if test="${f.endYN eq 'Y'.charAt(0)}">
									<tr class="deactivate">
								</c:if>
									<td>
										<c:if test="${f.endYN eq 'N'.charAt(0)}">
											<input type="checkbox" name="faqNo" value="${f.faqNo}">
										</c:if>
										<c:if test="${f.endYN eq 'Y'.charAt(0)}">
											<input type="checkbox" name="faqNo" value="${f.faqNo}" disabled>
										</c:if>
									</td>
									<td>${f.faqNo}</td>
									<td>${f.category}</td>
									<td>
										<div class="relative">
											<div class="ellipsis unenter">${f.title}</div>
											<c:if test="${f.endYN eq 'N'.charAt(0)}">
												<div class="box-hovor">${f.title}</div>
											</c:if>
											<c:if test="${f.endYN eq 'Y'.charAt(0)}">
												<div>${f.title}</div>
											</c:if>
										</div>
									</td>
									<td>
										<div class="relative">
											<div class="ellipsis unenter">${f.content}</div>
											<c:if test="${f.endYN eq 'N'.charAt(0)}">
												<div class="box-hovor">${f.content}</div>
											</c:if>
											<c:if test="${f.endYN eq 'Y'.charAt(0)}">
												<div>${f.content}</div>
											</c:if>
										</div>
									</td>
									<td>${f.userName}</td>
									<td>${f.regdate}</td>
									<td>
										<c:if test="${f.endYN eq 'N'.charAt(0)}">
											<div class="btn-style-icon btn-modify">
												<i class="fas fa-pencil-alt"></i>
											</div>
										</c:if>
										<c:if test="${f.endYN eq 'Y'.charAt(0)}">
											<div class="btn-style-icon">
												<i class="fas fa-pencil-alt"></i>
											</div>
										</c:if>
										<div class="modify-model">
											<div class="model-area">
												<div class="model-top">
													<h4>자주 묻는 질문 수정</h4>
													<i class="fas fa-times model-close"></i>
												</div>
												<form action="/admin/faqUpdate.do" method="post">
													<div class="model-middle">
														<div class="box-select">
															<select class="select-style" name="category" categoty="${f.category}">
																<option value="회원/정보">회원/정보</option>
																<option value="게시글">게시글</option>
																<option value="기타">기타</option>
															</select>
															<i class="fas fa-chevron-down"></i>
														</div>
														<input type="text" class="model-title" name="title" placeholder="제목을 입력하세요" value="${f.title}">
													</div>
													<textarea class="model-content unenter" name="content" placeholder="내용을 입력하세요">${f.content}</textarea>
													<input type="hidden" name="faqNo" value="${f.faqNo}">
													<input type="submit" class="btn-style" value="완료">
												</form>
											</div>
										</div>
									</td>
									<td>
										<div class="btn-style-icon btn-one-faq-delete" endyn="${f.endYN}" faqNo="${f.faqNo}">
											<c:if test="${f.endYN eq 'N'.charAt(0)}">
												<i class="fas fa-trash"></i>
											</c:if>
											<c:if test="${f.endYN eq 'Y'.charAt(0)}">
												<i class="fas fa-trash-restore"></i>
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<h1>현재 자주 묻는 질문이 없습니다</h1>
					</c:otherwise>
				</c:choose>
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