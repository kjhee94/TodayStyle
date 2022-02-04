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
	<link rel="stylesheet" href="/resources/css/myPage/myStyle.css">
    <script src="/resources/common/common.js"></script>

    <style>
       
    </style>

</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div id="content">
        <div id="body">
                <jsp:include page="/WEB-INF/views/myPage/include/profile.jsp" />

            <div class="contents-wrap">
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 코디</div>
                    <div class="contents-num">18</div>
                    <div class="contents-plus"><a href="/mypage/myCoordi.do">전체보기</a></div>
                </div>
                <div class="contents-area">
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                </div>
                <div id="space"></div>
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 잇템</div>
                    <div class="contents-num">18</div>
                    <div class="contents-plus"><a>전체보기</a></div>
                </div>
                <div class="contents-area">
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                    <a>
                        <div class="contents"><img src="/resources/images/default/profile.jpg"></div>
                    </a>
                </div>
            </div>

        </div>


    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/followModal.jsp" />


</body>

</html>
