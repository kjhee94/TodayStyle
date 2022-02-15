<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>

<head>

<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">

    <meta charset="UTF-8">
    <title>오늘 뭐 입지? - 회원설정/비밀번호 확인</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/common/common.css">
    <link rel="stylesheet" href="/resources/common/header.css">
	<link rel="stylesheet" href="/resources/common/footer.css">
	<link rel="stylesheet" href="/resources/css/myPage/setting_pwdCheck.css">
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
                    <a href="/myPage/setting.do">
                        <div class="contents-title" id="memberUpdate">회원정보 수정</div>
                    </a>
                    <div id="line"></div>
                    <a href="/myPage/pwdUpdatePage.do">
                        <div class="contents-title">비밀번호 수정</div>
                    </a>
                </div>

				<form action="/myPage/setting.do" method="post" id="pwdCheckForm">
	                <div class="contents-area">
	                    <div id="contents-data-wrap">
	                        <div id="contents-comment">정보 보호를 위해 비밀번호를 다시 한번 입력해주세요 : ) </div>
	                        <input type="password" class="input-style" name="userPwd" placeholder="비밀번호">
	                        <div class="btn-style-mint" id="pwdCheckBtn"><a>확인</a></div>
	                    </div>
	                </div>
                </form>

                <div id="space"></div>

            </div>

        </div>


    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/followerModal.jsp" />
    <jsp:include page="/WEB-INF/views/myPage/include/followingModal.jsp" />

	<script>
	
		$('#pwdCheckBtn').click(function(){
			$('#pwdCheckForm').submit();
		});
		
	</script>

</body>

</html>
