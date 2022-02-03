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
	<link rel="stylesheet" href="/resources/css/myPage/setting_pwdUpdate.css">
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
                    <a href="/myPage/memberUpdate.do">
                        <div class="contents-title" id="memberUpdate">회원정보 수정</div>
                    </a>
                    <div id="line"></div>
                    <a href="/myPage/pwdUpdate.do">
                        <div class="contents-title" id="pwdUpdate">비밀번호 수정</div>
                    </a>
                </div>
                <div id="floatSpace"></div>
                <div class="rowLine"></div>

                <form>
                    <div class="contents-area">
                        <div class="input-wrap">
                            <div class="titleName">현재 비밀번호</div>
                            <input type="text" class="input-style" placeholder="현재 비밀번호">
                            <div class="check">비밀번호가 일치하지 않습니다.</div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">새 비밀번호</div>
                            <input type="text" class="input-style" placeholder="새 비밀번호">
                            <div class="check">비밀번호는 영문, 숫자를 포함하여 8자리 이상이어야 합니다.</div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">새 비밀번호 확인</div>
                            <input type="text" class="input-style" placeholder="새 비밀번호 확인">
                            <div class="check">비밀번호가 일치하지 않습니다.</div>
                        </div>
                        <div class="rowLine"></div>


                        <div class="btn-style-mint" id="updateBtn"><a>변경</a></div>

                    </div>
                </form>
                <div id="space"></div>

            </div>

        </div>


    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/followModal.jsp" />

    <script>
     
        
        
        // 유효성 검사
        
        

    </script>


</body>

</html>
