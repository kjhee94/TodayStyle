<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/myPage/profile.css">


<style>

</style>

    
    <div id="profile-wrap">
                    <div id="profile-img" class="profile">
                        <a>
                        	<c:choose>
	                            <c:when test="${requestScope.filepath!=null}">
	                            	<img src="${requestScope.filepath}">
	                            </c:when>
	                            <c:otherwise>
	                            	<img src="/resources/images/default/profile.jpg">
	                            </c:otherwise>
                            </c:choose>
                        </a>
                    </div>
                    <div id="userName"><a href="/myPage/myStyle.do">${requestScope.nickname }</a></div>
                    <div id="follow-wrap">
                        <div id="follower-modal-btn" class="modal-btn">
                            <div class="follow">팔로워</div>
                            <div class="followNum">${requestScope.followerNum }</div>
                        </div>
                        <div id="followLine"> </div>
                        <div id="following-modal-btn" class="modal-btn">
                            <div class="follow">팔로잉</div>
                            <div class="followNum">${requestScope.followingNum }</div>
                        </div>
                    </div>
                    <div id="profileLine"></div>
                    <div id="icon-wrap">
                        <a href="/myPage/scrapCoordi.do">
                            <div class="icon-area">
                                <img src="/resources/images/icon/saved.png" class="icon-img">
                                <div class="icon-text">스크랩</div>
                            </div>
                        </a>
                        <a href="/myPage/commentsCoordi.do">
                            <div id="comments-wrap" class="icon-area">
                                <img src="/resources/images/icon/comment.png" class="icon-img">
                                <div class="icon-text">내댓글</div>
                            </div>
                        </a>
                        <a href="/myPage/setting.do">
                            <div class="icon-area">
                                <img src="/resources/images/icon/setting.png" class="icon-img">
                                <div class="icon-text">설정</div>
                            </div>
                        </a>
                    </div>
                </div>