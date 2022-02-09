<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%-- jQuery 라이브러리 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/beststyle/best.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>  
<script src="/resources/common/common.js"></script>
</head>

<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<div id="content">
			<ul class="tabs">
				<a href="/beststyle/weekBestPage.do"><li class="tab-link " data-tab="tab-1">이번주 베스트</li></a>
				<a href="/beststyle/bestOfbestPage.do"><li class="tab-link current" data-tab="tab-2">역대 베스트</li></a>
			</ul>
			<div id="tab-2" class="tab-content current">
				<div class="img-coordi-area">
				
				<c:choose>
						<c:when test="${!requestScope.list.isEmpty() }">
							<c:forEach items="${requestScope.list }" var="b" varStatus="i">
							
					<div class="img-coordi-box">
						<img src="${b.coordifilepath}">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>${i.count }</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href="">
								
								<c:choose>
                                    <c:when test="${b.profilefilepath!=null}">
                                        <img src="${b.profilefilepath}" id="profileImg">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/images/default/profile.jpg" id="profileImg">
                                    </c:otherwise>
                               </c:choose>
								
								</a>
							</div>
							<span class="nickName">${b.nickname }</span>
						</div>
					</div>
					</c:forEach>
					</c:when>
					</c:choose>
					
					
					
				
				</div>
			</div>

			<script>
				$(document).ready(function(){
					$("ul.tabs li").click(function() {
						var tabId = $(this).attr("data-tab");
		
						$("ul.tabs li").removeClass("current");
						$(".tab-content").removeClass("current");
		
						$(this).addClass("current");
						$("#" + tabId).addClass("current");
					})
		
				
				});
				
				$('.like').click(function() {
					if ($(this).attr('src') === "/resources/images/icon/heart_on.png") {
						$(this).attr('src', "/resources/images/icon/heart_wf.png");
					} else {
						$(this).attr('src', "/resources/images/icon/heart_on.png");
					}
				});
				$('.scrap').click(function() {
					if ($(this).attr('src') === "/resources/images/icon/saved_on.png") {
						$(this).attr('src', "/resources/images/icon/saved_wf.png");
					} else {
						$(this).attr('src', "/resources/images/icon/saved_on.png");
					}
				});
			</script>
		</div>
	
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>