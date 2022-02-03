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

    <style>
        #body {
            width: 100%;
            overflow: hidden;
            cursor: default;
        }
        
        .contents-wrap {
            width: 80.59%;
            border-left: 1px solid #C8C8C8;
            margin-left: 20%;
            float: left;
        }

        .contents-title-wrap {
            width: 96.24%;
            height: 50px;
            margin-left: 2.77%;
            margin-right: 0.92%;
        }

        .contents-title {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            font-weight: 700;
            color: #707070;
            float: left;

        }

        .contents-num {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            font-weight: 700;
            color: #A9D4D9;
            float: left;
            margin-left: 5px;
        }

        .contents-plus>a {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            font-weight: 500;
            color: #A9D4D9;
            float: right;
            margin-top: 20px;
            cursor: pointer;
        }

        .contents-area {
            width: 98.14%;
            margin-left: 1.85%;
            overflow: hidden;
        }

        .contents {
            width: 23.11%;
            margin: 0.94%;
            border-radius: 10px;
            float: left;
            overflow: hidden;
            position: relative;
        }

        .contents:after {
            content: "";
            display: block;
            padding-bottom: 100%;
        }

        .contents>img {
            position: absolute;
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        #space {
            width: 100%;
            height: 50px;
        }



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