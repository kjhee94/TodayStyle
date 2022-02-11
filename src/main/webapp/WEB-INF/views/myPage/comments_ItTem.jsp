<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
<link rel="stylesheet" href="/resources/css/myPage/comments.css">
    <script src="/resources/common/common.js"></script>

    <style>

    </style>

</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div id="content">
        <div id="body">
            <div id="profile-wrapwrap">
                <jsp:include page="/WEB-INF/views/myPage/include/profile.jsp" />
            </div>
            <div class="contents-wrap">
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 댓글</div>
                    <div class="contents-num">18</div>
                </div>
                
                <div id="btn-wrap">
                	<a href = "/myPage/commentsCoordi.do"><div class="btn-style-line btn" id="coordiBtn">코디</div></a>
                	<a href = "/myPage/commentsItTem.do"><div class="btn-style-mint btn" id="ittemBtn">잇템</div></a>
                </div>
                <div class="space"></div>
                <div class="line"></div>
                
                <div class="contents-area">
                    <div class="contents-wrapping">
                    	<div class="contents-outLine">
                        	<a>
                            	<div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                        	</a>
                    	</div>
                    	<div class="comment-wrapping">
                        	<div class="comment-date textStyle">2022.01.26</div>
                        	<div class="comment textStyle">코디 잘 보고 가요❤️ 가능하시면 제 게시물도 놀러와주세요:) 그리고 혹시 신발 상품코드 알 수 있을까요? </div>
                        	<div class="comment-title-wrapping">
                        		<div class="comment-title textStyle">3년이나 쓰고 이제 갈아탑니다 좋아요 이쁘고</div><div class="comments-num textStyle">[8]</div>
                        	</div>
                        </div>
                        <div class="btn-style-mint deleteBtn"><a>삭제</a></div>
					</div>
                </div>
                
                <div class="line"></div>
                
                <div class="contents-area">
                    <div class="contents-wrapping">
                    	<div class="contents-outLine">
                        	<a>
                            	<div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                        	</a>
                    	</div>
                    	<div class="comment-wrapping">
                        	<div class="comment-date textStyle">2022.01.26</div>
                        	<div class="comment textStyle">코디 잘 보고 가요❤️ 가능하시면 제 게시물도 놀러와주세요:) 그리고 혹시 신발 상품코드 알 수 있을까요? </div>
                        	<div class="comment-title-wrapping">
                        		<div class="comment-title textStyle">3년이나 쓰고 이제 갈아탑니다 좋아요 이쁘고</div><div class="comments-num textStyle">[8]</div>
                        	</div>
                        </div>
                        <div class="btn-style-mint deleteBtn"><a>삭제</a></div>
					</div>
                </div>
                <div class="space"></div>

            </div>

        </div>


    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/followerModal.jsp" />
    <jsp:include page="/WEB-INF/views/myPage/include/followingModal.jsp" />


</body>

</html>
