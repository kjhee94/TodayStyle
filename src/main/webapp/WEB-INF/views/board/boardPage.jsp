<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/board/boardPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>  
</head>

<body>
	<div id="wrap">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
		<div id="content">
			<div class="box-tabs">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">공지사항</li>
					<li class="tab-link" data-tab="tab-2">자주 묻는 질문</li>
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
								없어(ㅋㅋㅋ)
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
	
	
			<div id="tab-2" class="tab-content">
				<div class="box-category">
					<button>전체</button>
					<button>회원/정보</button>
					<button>게시글</button>
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
							
						</c:otherwise>
					</c:choose>
			  	</div>
			</div>
		</div>
		
		<script>
			$(document).ready(function(){
				//tab 버튼 전환
				$("ul.tabs li").click(function() {
					var tabId = $(this).attr("data-tab");
	
					$("ul.tabs li").removeClass("current");
					$(".tab-content").removeClass("on");
					
					$(this).addClass("current");
					$("#" + tabId).addClass("on");
				})
				
				//FAQ 내려오기
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