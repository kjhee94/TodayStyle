<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/myPage/profile.css">
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>


<style>

</style>

    
    <div id="profile-wrap">
                    <div id="profile-img" class="profile">
                        <a>
                        	<c:choose>
	                            <c:when test="${requestScope.memberProfileFilepath!=null}">
	                            	<img src="${requestScope.memberProfileFilepath}">
	                            </c:when>
	                            <c:otherwise>
	                            	<img src="/resources/images/default/profile.jpg">
	                            </c:otherwise>
                            </c:choose>
                        </a>
                    </div>
                    <div id="userName"><a href="/myPage/myStyle.do">${requestScope.memberNickname}</a></div>
                    <div id="follow-wrap">
                        <div id="follower-modal-btn" class="modal-btn">
                            <div class="follow">팔로워</div>
                            <div class="followNum">${requestScope.memberFollowerNum}</div>
                        </div>
                        <div id="followLine"> </div>
                        <div id="following-modal-btn" class="modal-btn">
                            <div class="follow">팔로잉</div>
                            <div class="followNum">${requestScope.memberFollowingNum}</div>
                        </div>
                    </div>
                    <div id="profileLine"></div>
                    <div id="icon-wrap">
                    	<c:choose>
                    		<c:when test="${requestScope.followBtn.equals('팔로잉') }">
                    			<div id="${requestScope.memberUserId }" class="btn-style-mint user-follow-btn">팔로잉</div>
                    		</c:when>
                    		<c:when test="${requestScope.followBtn.equals('팔로우') }">
                    			<div id="${requestScope.memberUserId }" class="btn-style-line user-follow-btn">팔로우</div>
                    		</c:when>
                    	</c:choose>
                        
                    </div>
                </div>
                
                <script>
                	$('.user-follow-btn').click(function(){
                		var userId = $('.user-follow-btn').attr('id');
                		if($('.user-follow-btn').html()==="팔로잉")
                		{
                			$('.user-follow-btn').attr('class','btn-style-line user-follow-btn');
                			$('.user-follow-btn').html("팔로우");
                			$.ajax({
                				url:"/myPage/unFollow.do",
                	        	data:{unfollowUserId:userId},
                	        	type:"get",
                	        	success:function (){
                	        		location.reload();
                	        	},
                	        	error:function(){
                	        		console.log("통신실패");
                	        	}
                				
                			});
                		}else
                		{
                			$('.user-follow-btn').attr('class','btn-style-mint user-follow-btn');
                			$('.user-follow-btn').html("팔로잉");
                			$.ajax({
                				url:"/myPage/follow.do",
                	        	data:{followUserId:userId},
                	        	type:"get",
                	        	success:function (){
                	        		location.reload();
                	        	},
                	        	error:function(){
                	        		console.log("통신실패");
                	        	}
                				
                			});
                		}
                	});
                </script>