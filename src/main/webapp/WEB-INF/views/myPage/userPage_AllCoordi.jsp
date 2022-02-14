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
	<link rel="stylesheet" href="/resources/css/myPage/myStyle_myCoordi.css">
    <script src="/resources/common/common.js"></script>

    <style>
    </style>

</head>

<body>
<div id="wrap">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div id="content">
        <div id="body">
            <div id="profile-wrapwrap">
                <jsp:include page="/WEB-INF/views/myPage/include/userProfile.jsp" />
            </div>
            <div class="contents-wrap">
                <div class="contents-title-wrap">
                    <div class="contents-title">코디</div>
                    <div class="contents-num">${requestScope.memberCoordiList.size() }</div>
                    <div class="contents-plus"><a href="/myPage/userPage.do?userId=${requestScope.memberUserId }">목록보기</a></div>
                </div>
                <div class="contents-area">
                
                	<c:forEach items="${requestScope.memberCoordiList }" var="mcList" varStatus="i">
             			<a href="/coordi/coordiPost.do?coordiNo=${mcList.coordiNo}">
                        	<div class="contents">
                        		<img src="${mcList.filepath }">
		                        	<div id="${mcList.coordiNo }" class="likeScrap-wrap">
		                                <img class="likeIcon" src="/resources/images/icon/heart_wf.png">
		                                <img class="scrapIcon" src="/resources/images/icon/saved_wf.png">
		                            </div>
                        	</div>
                    	</a>
              		</c:forEach>
              		
              		
                </div>
                <div id="space"></div>

            </div>

        </div>


    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/userFollowerModal.jsp" />
    <jsp:include page="/WEB-INF/views/myPage/include/userFollowingModal.jsp" />

   
</div>

<script>

	// 좋아요, 스크랩 아이콘 데이터 반영
	var memberLikeList=new Array();
	var memberScrapList=new Array();
	
	<c:forEach items="${requestScope.memberLikeList}" var="coordiNo" varStatus="i">
		memberLikeList.push(${coordiNo});
	</c:forEach>
	for(var i=0;i<memberLikeList.length;i++){
		$('#'+memberLikeList[i]).children().eq(0).attr("src","/resources/images/icon/heart_on.png");
		
	};
	
	<c:forEach items="${requestScope.memberScrapList}" var="coordiNo" varStatus="i">
		memberScrapList.push(${coordiNo});
	</c:forEach>
	for(var i=0;i<memberScrapList.length;i++){
		$('#'+memberScrapList[i]).children().eq(1).attr("src","/resources/images/icon/saved_on.png");
		
	};
	
	// 좋아요 기능
	$('.likeIcon').click(function() {
		if ($(this).attr('src') === "/resources/images/icon/heart_on.png") {
			var coordiNo=$(this).parent().attr('id');	
			$(this).attr('src', "/resources/images/icon/heart_wf.png");
			$.ajax({
				url:"/coordi/unlikeCoordi.do",
               	data:{coordiNo:coordiNo},
               	type:"get",
               	success:function (){
               		
               	},
               	error:function(){
               		console.log("통신실패");
               	}
				
			});
		} else {
			var coordiNo=$(this).parent().attr('id');			
			$(this).attr('src', "/resources/images/icon/heart_on.png");
			$.ajax({
				url:"/coordi/likeCoordi.do",
               	data:{coordiNo:coordiNo},
               	type:"get",
               	success:function (){
               		
               	},
               	error:function(){
               		location.replace('/member/loginPage.do');
               	}
				
			});
		}
	});
	
	// 스크랩 기능
	$('.scrapIcon').click(function() {
		if ($(this).attr('src') === "/resources/images/icon/saved_on.png") {
			var coordiNo=$(this).parent().attr('id');
			$(this).attr('src', "/resources/images/icon/saved_wf.png");
			$.ajax({
				url:"/coordi/unscrapCoordi.do",
	        	data:{coordiNo:coordiNo},
	        	type:"get",
	        	success:function (){
	        		
	        	},
	        	error:function(){
	        		console.log("통신실패");
	        	}
				
			});
		} else {
			var coordiNo=$(this).parent().attr('id');
			$(this).attr('src', "/resources/images/icon/saved_on.png");
			$.ajax({
				url:"/coordi/scrapCoordi.do",
	        	data:{coordiNo:coordiNo},
	        	type:"get",
	        	success:function (){
	        		
	        	},
	        	error:function(){
	        		
	        		location.replace('/member/loginPage.do');
	        	}
				
			});
		}
	})
	


</script>

</body>

</html>
