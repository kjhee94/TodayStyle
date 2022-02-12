<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_오늘의 잇템 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/adminCommon.css">
<link rel="stylesheet" href="/resources/common/adminHeader.css">
<link rel="stylesheet" href="/resources/css/admin/adminIttem.css">
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
					<span id="topTitle">오늘의 잇템 관리</span>
					<span>Home &nbsp-&nbsp 게시판 관리 &nbsp-&nbsp </span>
					<span id="topAction">오늘의 잇템 관리</span>
				</div>
				<a href="/member/logout.do">로그아웃</a>
			</div>
			
			<div id="container">
				<div id="searchAndBtn">
					<form action="/admin/ittemSearch.do" method="get">
						<div id="boxSelect">
							<select class="select-style" name="type">
								<option disabled selected>필터선택</option>
								<option value="nickName">작성자</option>
								<option value="itItemTitle">제목</option>
								<option value="itItemContent">내용</option>
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
						<button id="checkedDeleteIttemBtn" class="btn-style">삭제</button>
					</div>
				</div>
				
				<table>
					<tr>
						<th><input type="checkbox" id="Allcheck"></th>
						<th>잇템 번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
						<th>잇템정보</th>
						<th>해시태그</th>
						<th>댓글관리</th>
						<th>삭제</th>
					</tr>
					
					<c:choose>
						<c:when test="${!requestScope.map.list.isEmpty() }">
							<c:forEach items="${requestScope.map.list }" var="i">
								<c:if test="${i.delYN eq 'N'.charAt(0)}">
									<tr>
								</c:if>
								<c:if test="${i.delYN eq 'Y'.charAt(0)}">
									<tr class="deactivate">
								</c:if>
									<td>
										<c:if test="${i.delYN eq 'N'.charAt(0)}">
											<input type="checkbox" name="itItemNo" value="${i.itItemNo}">
										</c:if>
										<c:if test="${i.delYN eq 'Y'.charAt(0)}">
											<input type="checkbox" name="itItemNo" value="${i.itItemNo}" disabled>
										</c:if>
									</td>
									<td>${i.itItemNo}</td>
									<td>${i.nickName}</td>
									<td>
										<div class="relative">
											<div class="ellipsis unenter">${i.itItemTitle}</div>
											<c:if test="${i.delYN eq 'N'.charAt(0)}">
												<div class="box-hovor">${i.itItemTitle}</div>
											</c:if>
											<c:if test="${i.delYN eq 'Y'.charAt(0)}">
												<div>${i.itItemTitle}</div>
											</c:if>
										</div>
									</td>
									<td>
										<div class="relative">
											<div class="ellipsis unenter">${i.itItemContent}</div>
											<c:if test="${i.delYN eq 'N'.charAt(0)}">
												<div class="box-hovor">${i.itItemContent}</div>
											</c:if>
											<c:if test="${i.delYN eq 'Y'.charAt(0)}">
												<div>${i.itItemContent}</div>
											</c:if>
										</div>
									</td>
									<td>${i.regDate}</td>
									<td>
										<div id="box-icon-btn">
											<div class="relative">
												<div class="btn-style-icon">
													<i class="fas fa-tshirt"></i>
												</div>
												<div class="box-style detail">
													<div class="style">
														<c:if test="${i.itemCode.substring(0,1) eq 'T'}">
															<div class="img-style">
																<img alt="상의" src="/resources/images/default/top.png">
															</div>
															<div class="txt-style">
																<p>Top &nbsp·&nbsp ${i.itemName}</p>
																<span>${i.itItembrand}</span>
															</div>
														</c:if>
														<c:if test="${i.itemCode.substring(0,1) eq 'B'}">
															<div class="img-style">
																<img alt="하의" src="/resources/images/default/bottom.png">
															</div>
															<div class="txt-style">
																<p>Bottom &nbsp·&nbsp ${i.itemName}</p>
																<span>${i.itItembrand}</span>
															</div>
														</c:if>
														<c:if test="${i.itemCode.substring(0,1) eq 'O'}">
															<div class="img-style">
																<img alt="아우터" src="/resources/images/default/outer.png">
															</div>
															<div class="txt-style">
																<p>Outer &nbsp·&nbsp ${i.itemName}</p>
																<span>${i.itItembrand}</span>
															</div>
														</c:if>
														<c:if test="${i.itemCode.substring(0,1) eq 'S'}">
															<div class="img-style">
																<img alt="신발" src="/resources/images/default/shoes.png">
															</div>
															<div class="txt-style">
																<p>Shoes &nbsp·&nbsp ${i.itemName}</p>
																<span>${i.itItembrand}</span>
															</div>
														</c:if>
														<c:if test="${i.itemCode.substring(0,1) eq 'A'}">
															<div class="img-style">
																<img alt="악세사리" src="/resources/images/default/acc.png">
															</div>
															<div class="txt-style">
																<p>Acc &nbsp·&nbsp ${i.itemName}</p>
																<span>${i.itItembrand}</span>
															</div>
														</c:if>
													</div>
													<div class="txt-item">
														<div class="txt-item-list">
															<span class="tit-item">상품명</span>
															<span>${i.itItemName}</span>
														</div>
														<div class="txt-item-list">
															<span class="tit-item">색상</span>
															<span>${i.itItemColor}</span>
														</div>
														<div class="txt-item-list">
															<span class="tit-item">구매 사이즈</span>
															<span>${i.itItemSize}</span>
														</div>
													</div>
												</div>
											</div>
											
											<div class="relative">
												<div class="btn-style-icon">
													<i class="fas fa-user"></i>
												</div>
												<div class="box-user detail">
													<div class="txt-item-list">
														<span class="tit-item">구매자 키</span>
														<span>${i.userHeight}</span>
													</div>
													<div class="txt-item-list">
														<span class="tit-item">정사이즈</span>
														<span>${i.userSize}</span>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td>
										<div class="relative">
											<div class="btn-style-icon">
												<i class="fas fa-hashtag"></i>
											</div>
											<c:if test="${i.delYN eq 'N'.charAt(0)}">
												<div class="box-hashtag detail">
											</c:if>
											<c:if test="${i.delYN eq 'Y'.charAt(0)}">
												<div class="box-hashtag">
											</c:if>
												<c:forTokens var="hashTag" items="${i.hashTag }" delims=",">
													<div class="h-wrap">#${hashTag}</div>
												</c:forTokens>
											</div>
										</div>
									</td>
									<td>
										<c:if test="${i.delYN eq 'N'.charAt(0)}">
											<a href="/admin/adminIttemComment.do?itItemNo=${i.itItemNo}">
										</c:if>
										<c:if test="${i.delYN eq 'Y'.charAt(0)}">
											<a>
										</c:if>
											<div class="btn-style-icon">
												<i class="far fa-comment-dots"></i>
											</div>
										</a>
									</td>
									<td>
										<div class="btn-style-icon btn-one-ittem-delete" delyn="${i.delYN}" itItemNo="${i.itItemNo}">
											<c:if test="${i.delYN eq 'N'.charAt(0)}">
												<i class="fas fa-trash"></i>
											</c:if>
											<c:if test="${i.delYN eq 'Y'.charAt(0)}">
												<i class="fas fa-trash-restore"></i>
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="txt-none">
								<td colspan="12">검색된 잇템이 없습니다</td>
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