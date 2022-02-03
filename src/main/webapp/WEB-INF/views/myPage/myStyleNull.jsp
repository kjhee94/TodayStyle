<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        #body{
            width: 100%;
            overflow: hidden;
        }
        #profile-wrap-wrap{
            width: 17.16%;
            height: 430px;
        }
        #profile-wrap{
            width: 230px;
            height: 430px;
            float: left;
            margin-right: 2.23%;
        }
        #profile-img{
            width:150px;
            height: 150px;
            margin: 55px 45px 30px;
        }
        #userName{ 
            margin: 0 auto;
            width: 100%;
            height: 35px;
            text-align: center;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 700;
            font-size: 24px;
            color: #707070;
        }
        #follow-wrap{
            height: 25px;
            margin: 10px auto 20px;
            text-align: center;
        }
        .follow{
            font-family: 'Noto Sans KR', sans-serif;
            color: #707070;
            margin-right: 3px;
            display: inline-block;
            letter-spacing:-0.03em;
        }
        .followNum{
            font-family: 'Noto Sans KR', sans-serif;
            color: #707070;
            font-weight: 700;
            display: inline-block;
        }
        #followLine{
            display: inline-block;
            margin: 0 10px;
            height: 15px;
            width: 0px;
            border-left: 0.5px solid #C8C8C8;
        }
        #profileLine{
            height: 0px;
            width: 100%;
            border-top: 0.5px solid #C8C8C8;
        }
        #icon-wrap{
            display: inline-block;
            margin-top: 30px;
            width: 100%;
            text-align: center;
        }
        .icon-area{
            display: inline-block;
            width: 65px;
        }
        #comments-wrap{
            margin: 0 10px;
        }
        .icon-img{
            width: 30px;
            height: 30px;
            margin-bottom: 10px;
        }
        .icon-text{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            color: #707070;
            letter-spacing:-0.03em;
        }
        
        .contents-wrap{
            width: 80.59%;
            height: ;
            border-left: 1px solid #C8C8C8;
            float: left;
        }
        
        .contents-title-wrap{
            width: 96.24%;
            height: 50px;
            margin-left: 2.77%;
            margin-right: 0.92%;
        }
        .contents-title{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            font-weight: 700;
            color: #707070;
            float: left;
            
        }
       .contents-num{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            font-weight: 700;
            color: #A9D4D9;
            float: left;
            margin-left: 5px;
        }
        .contents-plus>a{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            font-weight: 500;
            color: #A9D4D9;
            float: right;
            margin-top: 20px;
            cursor: pointer;
        }
        .contents-area{
            width: 98.14%;
            margin-left: 1.85%;
            overflow: hidden;
            border: 1px dashed #C8C8C8;
            border-radius: 5px;
            
            text-align: center;
            padding-top: 10%;
            padding-bottom: 10%;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            color: #C8C8C8;
            cursor: pointer;
            
        }
        .contents-area:hover{
            color: #A9D4D9;
        }
        
        .contents{
            width: 23.11%;
            margin: 0.94%;
            border-radius: 10px;
            float: left;
            overflow: hidden;
            position: relative;
        }
        
        .contents:after{
             content: "";
             display: block;
             padding-bottom: 100%;
        }
        .contents>img{
            position: absolute;
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        #space{
            width: 100%;
            height: 50px;
        }
        
        
    </style>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
        <div id="body">
        	<div id="profile-wrapwrap">
            <div id="profile-wrap">
                <div id="profile-img" class="profile">
                    <a><img src="/resources/images/default/profile.jpg"></a>
                </div>
                <div id="userName">여니여니</div>
                <div id="follow-wrap">
                    <a>
                        <div class="follow">팔로워</div>
                        <div class="followNum">3</div>
                    </a>
                    <div id="followLine">  </div>
                    <a>
                        <div class="follow">팔로잉</div>
                        <div class="followNum">7</div>
                    </a>
                </div>
                <div id="profileLine"></div>
                <div id="icon-wrap">
                    <a>
                        <div class="icon-area">
                            <img src="/resources/images/icon/saved.png" class="icon-img">
                            <div class="icon-text">스크랩</div>
                        </div>
                    </a>
                    <a>
                        <div id="comments-wrap" class="icon-area">
                            <img src="/resources/images/icon/comment.png" class="icon-img">
                            <div class="icon-text">내댓글</div>
                        </div>
                    </a>
                    <a>
                        <div class="icon-area">
                            <img src="/resources/images/icon/setting.png" class="icon-img">
                            <div class="icon-text">설정</div>
                        </div>
                    </a>
                </div>
            </div>
            </div>
            <div class="contents-wrap">
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 코디</div>
                    <div class="contents-num">0</div>
                    <div class="contents-plus"><a>전체보기</a></div>
                </div>
                <a>
                	<div class="contents-area"> 코디를 추가해주세요 :)</div>
                </a>   
                
                <div id="space"></div>
                <div class="contents-title-wrap">
                    <div class="contents-title">나의 잇템</div>
                    <div class="contents-num">18</div>
                    <div class="contents-plus"><a>전체보기</a></div>
                </div>
                <a>
                	<div class="contents-area">잇템을 추가해주세요 :)</div>
            	</a>
            </div>
            
        </div>
    
    
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>