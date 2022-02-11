<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPage/followModal.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>

</style>
    
    
    
    
    <div id="follower-modal" class="follow-modal">
        <div class="modal-wrap">
            <div class="modal-title-wrap">
                <div class="modal-title">팔로워</div>
                <div id="follower-modal-close-btn" class="modal-close">X</div>
            </div>
            
            <c:choose>
	            <c:when test="${!requestScope.followerList.isEmpty() }">
		            <c:forEach items="${requestScope.followerList }" var="fList" varStatus="i">
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
			                    
			                    <c:set var="doneLoop" value="false"/>
		                    	<c:forEach items="${requestScope.followingList }" var="fgList" varStatus="i">
		                    		
		                    		<c:if test="${not doneLoop}">
			                    		<c:choose>
				                    		<c:when test="${fList.userId.equals(fgList.userId)}">
				                    			<div class="following-btn fBtn" id="${fList.userId }">팔로잉</div>
				                    			<c:set var="doneLoop" value="true" />
				                    		</c:when>
				                    		<c:otherwise>
				                    			<c:if test="${i.last}">
				                    				<div class="follow-btn fBtn" id="${fList.userId }">팔로우</div>
				                    			</c:if>
				                    			
				                    		</c:otherwise>
			                    		</c:choose>
		                    		</c:if>
		                    	</c:forEach>
			                    
			                    
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
            $('#follower-modal-btn').click(function() {
                //$('body').css('overflow', 'hidden'); // 스크롤 제어

                var div = $('#follower-modal');
                div.css("position", "fixed");
                // 모달창 열리는 위치 현재 화면의 위치로 지정
                div.css("top", Math.max(0, (($(window).height() - div.outerHeight()) / 2) + $(window).scrollTop()) + "px");
                div.css("left", Math.max(0, (($(window).width() - div.outerWidth()) / 2) + $(window).scrollLeft()) + "px");
                
                // 모달창 띄우기
                div.fadeIn();
                
            });
            $('#follower-modal-close-btn').click(function() {
                // 모달창 닫기
                $('#follower-modal').fadeOut();
                // 스크롤 제어 해제
                //$('body').css('overflow', 'auto');
				

            });
            $(document).mouseup(function(e) {

                var container = $('#follower-modal');

                if (container.has(e.target).length === 0) {

                    container.css('display', 'none');
                    //$('body').css('overflow', 'auto');
                }

            });

        });
        
        
        
        $(function(){
           $('.follow-name-wrap').click(function(){
                location.replace('/myPage/userPage.do');
           }); 
        });
        
        

        // 팔로잉 버튼
        $('.fBtn').click(function(){
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
        		$(this).attr('class','following-btn fBtn');
        		$(this).html('팔로잉');
        		$.ajax({
    				url:"/myPage/follow.do",
    	        	data:{followUserId:userId},
    	        	type:"get",
    	        	success:function (){
    	        		alert('aa');
    	        	},
    	        	error:function(){
    	        		console.log("통신실패");
    	        	}
    				
    			});
        	}
        });
        
        <%--
        // 팔로우 버튼
        $('.follow-btn').click(function(){
        	if($(this).html() === "팔로잉")
        	{
        		var userId = $(this).attr('id');
        		$(this).attr('class','follow-btn fBtn');
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
    	        		alert('aa');
    	        	},
    	        	error:function(){
    	        		console.log("통신실패");
    	        	}
    				
    			});
        	}
        });
        --%>

    </script>
    