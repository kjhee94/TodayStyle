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
	<link rel="stylesheet" href="/resources/css/myPage/setting_memberUpdate.css">
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
                        <div class="contents-title">비밀번호 수정</div>
                    </a>
                </div>
                <div id="withDrawBtn"><a href="/myPage/withdraw.do">탈퇴하기</a></div>
                <div class="rowLine"></div>

                <form>
                    <div class="contents-area">
                        <div class="input-wrap">
                            <div class="titleName">이름</div>
                            <input type="text" class="input-style" value="김연희">
                            <div class="check">이름을 입력해주세요.</div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">닉네임</div>
                            <input type="text" class="input-style" value="여니여니">
                            <div class="check">이름을 입력해주세요.</div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">이메일</div>
                            <input type="email" class="input-style" value="yeonee@naver.com">
                            <div id="emailCheckBtn" class="btn-style-mint">인증하기</div>
                            <div class="check">이름을 입력해주세요.</div>
                            <div id="emailCheck-area">
                            	<div id="emailCheck-text" class="emailCheck">이메일로 전송된 인증코드를 입력해주세요</div>
                            	<input type="text" placeholder="인증코드 6자리 입력" id="emailCheck-input" class="emailCheck input-style"><div id="emailCheck-btn" class="emailCheck btn-style-mint">확인</div>
                            	<div id="emailCheck-time" class="emailCheck">9분 30초 남았습니다.</div><div id="emailCheck-resend" class="emailCheck">이메일 재전송</div>
                            </div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">성별</div>
                            <input type="radio" name="gender" class="radioBtn" id="f_radioBtn">
                            <label for="f_radioBtn" class="radioLabel">여자</label>
                            <input type="radio" name="gender" class="radioBtn" id="m_radioBtn">
                            <label for="m_radioBtn" class="radioLabel">남자</label>
                            <input type="radio" name="gender" class="radioBtn" id="n_radioBtn">
                            <label for="n_radioBtn" class="radioLabel">비공개</label>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">프로필이미지</div>
                        </div>
                        <div id="selectProfile-wrap">
                            <div id="profileImg-area">
                                <img src="/resources/images/default/profile.jpg" id="profileImg">
                                <div id="profileImg-plusBtn">
                                    <label for="selectProfileImg">+</label>
                                    <input type="file" id="selectProfileImg" accept="image/*" onchange="loadFile(this)">

                                </div>
                            </div>

                        </div>
                        <div class="rowLine"></div>


                        <div class="btn-style-mint" id="updateBtn"><a>수정</a></div>

                    </div>
                </form>
                <div id="space"></div>

            </div>

        </div>


    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/followModal.jsp" />

    <script>
        
        // 이메일 인증 입력창 나타나기
        $('#emailCheckBtn').click(function(){
           $('#emailCheck-area').css('display','block');
        });
        $('#emailCheck-btn').click(function(){
           $('#emailCheck-area').css('display','none');
        });
        
        
        
        // 프로필 사진 추가 : 마우스 hover시 추가 버튼 나오기
        $(function() {
            $('#profileImg-area').hover(function() {
                $('#profileImg-area>img').css('filter', 'blur(1px)');
                $('#profileImg-area>img').css('opacity', '0.7');
                $('#profileImg-plusBtn').css('display','block');


            }, function() {
                $('#profileImg-area>img').css('filter', '');
                $('#profileImg-area>img').css('opacity', '');
                $('#profileImg-plusBtn').css('display','none');

            });
        });
        
        
        // 프로필 사진 추가하고 미리보기
        $(function(){
            $('#selectProfileImg').on('change',function(){
                readURL(this);
                // input 태그에서 파일의 경로가 바뀌면 파일의 경로 읽고, 
                // readURL 함수 실행
            });
        });
        function readURL(input){
            if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                  $('#profileImg').attr('src', e.target.result);
               }
               reader.readAsDataURL(input.files[0]);
            }
        }
        
        
        
        // 유효성 검사
        
        

    </script>


</body>

</html>
