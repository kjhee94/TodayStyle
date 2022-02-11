<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPage/followModal.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>

</style>
    
    
    
    
    <div id="following-modal" class="follow-modal">
        <div class="modal-wrap">
            <div class="modal-title-wrap">
                <div class="modal-title">팔로잉</div>
                <div id="following-modal-close-btn" class="modal-close">X</div>
            </div>
            
            <c:choose>
	            <c:when test="${!requestScope.followingList.isEmpty() }">
		            <c:forEach items="${requestScope.followingList }" var="fList" varStatus="i">
			            <div class="follow-list-wrap">
			                <div class="follow-oneId-wrap">
			                    <div class="follow-name-wrap">
			                        <div class="follow-profile profile">
				                        <c:choose>
				                            <c:when test="${fList.filepath!=null}">
				                            	<a><img src="${fList.filepath}"></a>
				                            </c:when>
				                            <c:otherwise>
				                            	<a><img src="/resources/images/default/profile.jpg"></a>
				                            </c:otherwise>
			                            </c:choose>
			                        </div>
			                        <div class="follow-name">${fList.nickname}</div>
			                    </div>
			                    <div class="following-btn" id="${fList.userId }">팔로잉</div>
			                </div>
			            </div>
		            </c:forEach>
	            </c:when>
            
            <c:otherwise>
            <div class="follow-list-wrap">
                <div class="follow-oneId-wrap">
                    <div class="follow-name-wrap">
                        <div class="follow-profile profile"><a><img src="/resources/images/default/profile.jpg"></a></div>
                        <div class="follow-name">berryberry_8</div>
                    </div>
                    <div class="follow-btn">팔로우</div>
                </div>
            </div>
            </c:otherwise>
            
            </c:choose>
            
            
            
            

        </div>
    </div>
    
    

    <script>
        // modal
        $(function() {
            $('#following-modal-btn').click(function() {
                $('body').css('overflow', 'hidden'); // 스크롤 제어

                var div = $('#following-modal');
                div.css("position", "absolute");
                // 모달창 열리는 위치 현재 화면의 위치로 지정
                div.css("top", Math.max(0, (($(window).height() - div.outerHeight()) / 2) + $(window).scrollTop()) + "px");
                div.css("left", Math.max(0, (($(window).width() - div.outerWidth()) / 2) + $(window).scrollLeft()) + "px");
                
                // 모달창 띄우기
                div.fadeIn();
                
            });
            $('#following-modal-close-btn').click(function() {
                // 모달창 닫기
                $('#following-modal').fadeOut();
                // 스크롤 제어 해제
                $('body').css('overflow', 'auto');
            });
            $(document).mouseup(function(e) {

                var container = $('#following-modal');

                if (container.has(e.target).length === 0) {

                    container.css('display', 'none');
                    $('body').css('overflow', 'auto');

                }

            });

        });
        
        // user 페이지 이동
        $(function(){
           $('.follow-name-wrap').click(function(){
                location.replace('/myPage/userPage.do');
           }); 
        });
        
        // 팔로잉 버튼
        $('.following-btn').click(function(){
        	if($(this).html() === "팔로잉")
        	{
        		var userId = $(this).attr('id');
        		$(this).attr('class','follow-btn');
        		$(this).html('팔로우');
        		$.ajax({
    				url:"/myPage/unFollow.do",
    	        	data:{unfollowUserId:userId},
    	        	type:"get",
    	        	success:function (){
    	        		
    	        	},
    	        	error:function(){
    	        		console.log("통신실패");
    	        	}
    				
    			});
        	}
        	else
        	{
        		var userId = $(this).attr('id');
        		$(this).attr('class','following-btn');
        		$(this).html('팔로잉');
        		$.ajax({
    				url:"/myPage/follow.do",
    	        	data:{followUserId:userId},
    	        	type:"get",
    	        	success:function (){
    	        		
    	        	},
    	        	error:function(){
    	        		console.log("통신실패");
    	        	}
    				
    			});
        	}
        });
        
        

    </script>
    