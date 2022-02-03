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
    <script src="/resources/common/common.js"></script>

    <style>
        #body {
            width: 100%;
            overflow: hidden;

            cursor: default;
        }


        #profile-wrap {
            width: 230px;
            height: 430px;
            float: left;
            margin-right: 2.23%;
        }

        #profile-img {
            width: 150px;
            height: 150px;
            margin: 55px 45px 30px;
        }

        #userName {
            margin: 0 auto;
            width: 100%;
            height: 35px;
            text-align: center;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 700;
            font-size: 24px;
            letter-spacing: -0.03em;
            color: #707070;
        }

        #follow-wrap {
            height: 25px;
            margin: 10px auto 20px;
            text-align: center;
        }

        .modal-btn {
            display: inline;
            cursor: pointer;
        }

        .follow {
            font-family: 'Noto Sans KR', sans-serif;
            color: #707070;
            margin-right: 3px;
            display: inline-block;
            letter-spacing: -0.03em;
        }

        .followNum {
            font-family: 'Noto Sans KR', sans-serif;
            color: #707070;
            font-weight: 700;
            display: inline-block;
        }

        #followLine {
            display: inline-block;
            margin: 0 10px;
            height: 15px;
            width: 0px;
            border-left: 0.5px solid #C8C8C8;
        }

        #profileLine {
            height: 0px;
            width: 100%;
            border-top: 0.5px solid #C8C8C8;
        }

        #icon-wrap {
            display: inline-block;
            margin-top: 30px;
            width: 100%;
            text-align: center;
        }
        #follow-btn{
            width: 150px;
            height: 50px;
            margin: 0 auto;
        }

        .contents-wrap {
            width: 80.59%;
            height: ;
            border-left: 1px solid #C8C8C8;
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


        /* 모달 */
        .follow-modal {
            position: absolute;
            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            display: none;

            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-wrap {
            position: relative;
            top: 50%;
            left: 50%;
            transform: translateX(-50%) translateY(-50%);

            width: 500px;
            height: ;
            text-align: center;

            background-color: white;
            border-radius: 10px;

            padding: 20px 25px;
        }

        .modal-title-wrap {
            width: 450px;
            height: 30px;
            margin-bottom: 30px;
        }

        .modal-title {
            float: left;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: -0.03em;
            color: #707070;
        }

        .modal-close {
            float: right;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            font-weight: ;
            color: #C8C8C8;
            cursor: pointer;
        }

        .follow-list-wrap {
            width: 440px;
            height: 40px;
            margin: 10px auto;
        }

        .follow-name-wrap {
            cursor: pointer;
        }

        .follow-profile {
            width: 40px;
            height: 40px;
            float: left;
            margin-right: 10px;
            border: 2px solid #707070;
        }

        .follow-name {
            float: left;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            letter-spacing: -0.03em;
            color: #707070;
            line-height: 40px;
        }

        .follow-btn {
            width: 60px;
            height: 35px;
            float: right;
            line-height: 35px;
            text-align: center;
            border: 0.5px solid #C8C8C8;
            background-color: #fff;
            border-radius: 10px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            font-weight: 500;
            letter-spacing: -0.03em;
            color: #707070;
            cursor: pointer;
        }

    </style>

</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div id="content">
        <div id="body">
            <div id="profile-wrapwrap">
                <div id="profile-wrap">
                    <div id="profile-img" class="profile">
                        <a><img src="/resources/images/default/profile.jpg"></a>
                    </div>
                    <div id="userName">연신내핵주먹</div>
                    <div id="follow-wrap">
                        <div id="follower-modal-btn" class="modal-btn">
                            <div class="follow">팔로워</div>
                            <div class="followNum">3</div>
                        </div>
                        <div id="followLine"> </div>
                        <div id="following-modal-btn" class="modal-btn">
                            <div class="follow">팔로잉</div>
                            <div class="followNum">7</div>
                        </div>
                    </div>
                    <div id="profileLine"></div>
                    <div id="icon-wrap">
                        <div id="follow-btn" class="btn-style-mint">팔로우</div>
                    </div>
                </div>
            </div>
            <div class="contents-wrap">
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 코디</div>
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


    <div id="follower-modal" class="follow-modal">
        <div class="modal-wrap">
            <div class="modal-title-wrap">
                <div class="modal-title">팔로워</div>
                <div id="follower-modal-close-btn" class="modal-close">X</div>
            </div>
            <div class="follow-list-wrap">
                <div class="follow-oneId-wrap">
                    <div class="follow-name-wrap">
                        <div class="follow-profile profile"><a><img src="/resources/images/default/profile.jpg"></a></div>
                        <div class="follow-name">berryberry_8</div>
                    </div>
                    <div class="follow-btn">팔로우</div>
                </div>
            </div>
            <div class="follow-list-wrap">
                <div class="follow-oneId-wrap">
                    <div class="follow-name-wrap">
                        <div class="follow-profile profile"><a><img src="/resources/images/default/profile.jpg"></a></div>
                        <div class="follow-name">EHEH</div>
                    </div>
                    <div class="follow-btn">팔로우</div>
                </div>
            </div>
            <div class="follow-list-wrap">
                <div class="follow-oneId-wrap">
                    <div class="follow-name-wrap">
                        <div class="follow-profile profile"><a><img src="/resources/images/default/profile.jpg"></a></div>
                        <div class="follow-name">슈키슈차</div>
                    </div>
                    <div class="follow-btn">팔로우</div>
                </div>
            </div>

        </div>
    </div>



    <script>
        // modal
        $(function() {
            $('#follower-modal-btn').click(function() {
                $('body').css('overflow', 'hidden'); // 스크롤 제어

                var div = $('#follower-modal');
                div.css("position", "absolute");
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
                $('body').css('overflow', 'auto');
            });
            $(document).mouseup(function(e) {

                var container = $('#follower-modal');

                if (container.has(e.target).length === 0) {

                    container.css('display', 'none');
                    $('body').css('overflow', 'auto');

                }

            });

        });
        
        
        
        $(function(){
           $('.follow-name-wrap').click(function(){
                location.replace('/myPage/userPage.do');
           }) 
        });

    </script>

</body>

</html>
