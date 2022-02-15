<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>

<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">

    <meta charset="UTF-8">
    <title>오늘 뭐 입지? - 회원정보 수정</title>
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
<div id="wrap">
	

	<c:if test="${sessionScope.member!=null }">

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
                <div id="withDrawBtn"><a href="/myPage/withdrawPage.do">탈퇴하기</a></div>
                <div class="rowLine"></div>

                <form action="/myPage/memberUpdate.do" method="post" id="memberUpdateForm" enctype="multipart/form-data">
                    <div class="contents-area">
                        <div class="input-wrap">
                            <div class="titleName">이름</div>
                            <input type="text" class="input-style" name="userName" value="${sessionScope.member.userName }">
                            <div class="check" id="userNameCheck"></div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">닉네임</div>
                            <input type="text" class="input-style" id="nickName" name="nickname" maxlength="8" value="${sessionScope.member.nickname }">
                            <div class="check" id="userNickNameCheck"></div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">이메일</div>
                            <input type="email" class="input-style" name="userEmail" value="${sessionScope.member.userEmail }">
                            <input type="hidden" name="emailCheckData" value="인증하기">
                            <div id="emailCheckBtn" class="btn-style-mint">인증하기</div>
                            <div class="check" id="userEmailCheck"></div>
                            <div id="emailCheck-area">
                            	<div id="emailCheck-text" class="emailCheck">이메일로 전송된 인증코드를 입력해주세요</div>
                            	<input type="text" placeholder="인증코드 6자리 입력" id="emailCheck-input" class="emailCheck input-style"><div id="emailCheck-btn" class="emailCheck btn-style-mint">확인</div>
                            	<div id="emailCheck-time" class="emailCheck"></div><div id="emailCheck-resend" class="emailCheck">이메일 재전송</div>
                            </div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">성별</div>
                            
                            <c:if test="${sessionScope.member.gender=='여자' }">
	                            <input type="radio" name="gender" value="여자" class="radioBtn" id="female" checked>
	                            <label for="female" class="radioLabel">여자</label>
	                            <input type="radio" name="gender" value="남자" class="radioBtn" id="male">
	                            <label for="male" class="radioLabel">남자</label>
	                            <input type="radio" name="gender" value="비공개" class="radioBtn" id="non">
	                            <label for="non" class="radioLabel">비공개</label>
                            </c:if>
                            <c:if test="${sessionScope.member.gender=='남자' }">
	                            <input type="radio" name="gender" value="여자" class="radioBtn" id="female">
	                            <label for="f_femaleradioBtn" class="radioLabel">여자</label>
	                            <input type="radio" name="gender" value="남자" class="radioBtn" id="male" checked>
	                            <label for="male" class="radioLabel">남자</label>
	                            <input type="radio" name="gender" value="비공개" class="radioBtn" id="non">
	                            <label for="non" class="radioLabel">비공개</label>
                            </c:if>
                            <c:if test="${sessionScope.member.gender=='비공개' }">
	                            <input type="radio" name="gender" value="여자" class="radioBtn" id="female">
	                            <label for="female" class="radioLabel">여자</label>
	                            <input type="radio" name="gender" value="남자" class="radioBtn" id="male">
	                            <label for="male" class="radioLabel">남자</label>
	                            <input type="radio" name="gender" value="비공개" class="radioBtn" id="non" checked> 
	                            <label for="non" class="radioLabel">비공개</label>
                            </c:if>
                            
                            
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">프로필이미지</div>
                        </div>
                        <div id="selectProfile-wrap">
                            <div id="profileImg-area">
                            	<c:choose>
	                            	<c:when test="${requestScope.ProfileImg!=null}">
	                            		<img src="${requestScope.ProfileImg.filePath}" id="profileImg">
	                            	</c:when>
	                            	<c:otherwise>
	                            		<img src="/resources/images/default/profile.jpg" id="profileImg">
	                            	</c:otherwise>
                            	</c:choose>
                                
                                <div id="profileImg-plusBtn">
                                    <label for="selectProfileImg">+</label>
                                    <input type="file" name="profileImg" id="selectProfileImg" accept="image/*" onchange="loadFile(this)">
                                </div>
                                <div id="defaultImg">기본 이미지로 변경</div>
                                <input type="hidden" name="defaultImg" value="x">
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
    
    <jsp:include page="/WEB-INF/views/myPage/include/followerModal.jsp" />
    <jsp:include page="/WEB-INF/views/myPage/include/followingModal.jsp" />

   

	</c:if>

    <script>
    
    	var code = "";	// 이메일 인증번호 저장
    	
    	
    	
    	if($("input[name='emailCheckData']").val()=="인증하기"){  // 인증을 안 했을 경우 클릭 이벤트
		   	// 이메일 인증
		   	// 중복 검사 후 인증 번호 전송
		   	$('#emailCheckBtn').click(function(){
		   		
		   		if($("input[name='emailCheckData']").val()=="인증하기")
		   		{
		   			var email = $("input[name='userEmail']").val(); // 입력한 이메일
		   			
		       		
		       		$.ajax({	
		                   url:"/myPage/emailCheck.do",
		                   data:{"email":email},
		                   type:"post",
		                   success:function(data){
		                   	
		                   	if(data=="0") // 이메일 중복 체크 (중복일 경우==0)
		                   	{
		                   		$('#userEmailCheck').css('display', 'block');
		                           $('#userEmailCheck').css('color', '#FD8A69');
		                           $('#userEmailCheck').html('사용중인 이메일 입니다.');
		                           $("input[name='userEmail']").css('border-color','#FD8A69');
		                   	}
		                   	else
		                   	{
		                   		$('#userEmailCheck').css('display', 'none');
		                           $("input[name='userEmail']").css('border-color','#C8C8C8');
		                           
		                   		// 인증번호 전송에 성공했다면 인증번호 입력창 열기
		                           $('#emailCheck-area').css('display','block'); 
		                           code = data;
		                           //alert(code);
		                   	}
		                   	
		                   },
		                   error:function(){
		                      alert("오류가 발생하였습니다. 관리자에게 문의바랍니다.");
		                   }
		                });
		   		}
		   		
		   	});
    	
    		// 이메일 재전송
    		$('#emailCheck-resend').click(function(){
    			var email = $("input[name='userEmail']").val(); // 입력한 이메일
	       		
	       		$.ajax({	
	                   url:"/myPage/emailCheck.do",
	                   data:{"email":email},
	                   type:"post",
	                   success:function(data){
	                   	
	                   	if(data!="0")
	                   	{
	                   		alert('이메일이 재전송 되었습니다.');
	                   		code = data;
	                   		//alert('data : ' +code);
	                   	}
	                   },
	                   error:function(){
	                      alert("오류가 발생하였습니다. 관리자에게 문의바랍니다.");
	                   }
	                });
    		});
    	
    	}
    	
    	// 인증번호 확인 
    	$('#emailCheck-btn').click(function(){
    		var inputCode = $('#emailCheck-input').val();
    		if(inputCode == code)
    		{
    			// 인증번호와 입력한 번호가 일치 하면 
    			$('#emailCheck-area').css('display','none');  // 인증번호 입력창 닫기
    			$('#emailCheckBtn').html('인증완료');  //  버튼 내용 변경
    			$('#emailCheckBtn').attr('class','btn-style-line');  // 버튼 스타일 변경
    			$('#emailCheckBtn').css('cursor','default');  // 커서 변경
    			$("input[name='userEmail']").attr('readonly','true');  // 이메일 입력창 비활성화
    			$("input[name='emailCheckData']").attr('value','인증완료');  // hidden 인풋 value 변경
    		}else
    		{
    			// 일치하지 않을 경우 알림창
    			alert('인증번호가 일치하지 않습니다.');
    		}
    	});
    	
    	// 이메일 인증 시간 설정
    	var timer = null;
		var isRunning = false;

		$('#emailCheckBtn').click(function(){
			var display = $("#emailCheck-time");
		    // 유효시간 설정
		    var leftSec = 180;

		    if (isRunning){
		    	clearInterval(timer);
		      	display.html("");
		      	startTimer(leftSec, display);
		    }else{
		    	startTimer(leftSec, display);
		    }
			
		  });
		      
		  function startTimer(count, display) {  
			  var minutes, seconds;
			  timer = setInterval(function () {
				  minutes = parseInt(count / 60, 10);
				  seconds = parseInt(count % 60, 10);

				  minutes = minutes < 10 ? "0" + minutes : minutes;
				  seconds = seconds < 10 ? "0" + seconds : seconds;

				  display.html(minutes + "분" + seconds+"초 남았습니다.");
		    
		      
				  // 타이머 끝
				  if (--count < 0) {
					  clearInterval(timer);
		       
					  display.html("시간초과");
					  $('#emailCheck-area').css('display','none');  // 인증번호 입력창 닫기
					  return;
					  $("button").attr("disabled", true); // 이건 뭘까?
					  sRunning = false;
					  }
		    
			  }, 1000);
			  isRunning = true;
		}
    	
    	
    	
    	
        // 프로필 사진 추가 : 마우스 hover시 추가 버튼 나오기
        $(function() {
            $('#profileImg-area').hover(function() {
                $('#profileImg-area>img').css('filter', 'blur(1px)');
                $('#profileImg-area>img').css('opacity', '0.7');
                $('#profileImg-plusBtn').css('display','block');
				$('#defaultImg').css('display','block');

            }, function() {
                $('#profileImg-area>img').css('filter', '');
                $('#profileImg-area>img').css('opacity', '');
                $('#profileImg-plusBtn').css('display','none');
                $('#defaultImg').css('display','none');
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
                  $("input[name='defaultImg']").attr('value','x');
               }
               reader.readAsDataURL(input.files[0]);
            }
        }
        
        // 프로필 기본 이미지로 변경
        $(function(){
        	$('#defaultImg').click(function(){
        		$('#profileImg').attr('src', '/resources/images/default/profile.jpg');
        		$("input[name='defaultImg']").attr('value','o');
        	});
        });
        
        
        
        // 유효성 검사, 중복 검사(ajax)
        <%-- 이름 유효성 검사 --%>
        $("input[name='userName']").keyup(function() {
            var regName = /^[가-힣]+$/;
            if (regName.test($(this).val())) {
                $('#userNameCheck').css('display', 'none');
                $("input[name='userName']").css('border-color','#C8C8C8');
            } else {
                $('#userNameCheck').css('display', 'block');
                $('#userNameCheck').css('color', '#FD8A69');
                $('#userNameCheck').html('한글만 입력이 가능합니다.');
                $("input[name='userName']").css('border-color','#FD8A69');
            }
        });
        <%-- 닉네임 유효성 검사 --%>
        $("input[name='nickname']").keyup(function() {
            var regName = /^[가-힣]{2,8}$/;
            if (regName.test($(this).val())) {
                $('#userNickNameCheck').css('display', 'none');
                $("input[name='nickname']").css('border-color','#C8C8C8');
            } else {
                $('#userNickNameCheck').css('display', 'block');
                $('#userNickNameCheck').css('color', '#FD8A69');
                $('#userNickNameCheck').html('2-8글자의 한글로 입력해주세요');
                $("input[name='nickname']").css('border-color','#FD8A69');
            }
        });
        <%-- 닉네임 중복 검사 --%>
        $("input[name='nickname']").blur(function(){
        	
        	var nickNameBorderColor = $("input[name='nickname']").css('border-color');
        	if(nickNameBorderColor=='rgb(200, 200, 200)'){
        		var nickname = $("input[name='nickname']").val();
        		$.ajax({	
                    url:"/myPage/nickNameCheck.do",
                    data:{"nickname":nickname},
                    type:"get",
                    success:function(result){
                       if(result=="true"){
                           $('#userNickNameCheck').css('display', 'block');
                           $('#userNickNameCheck').css('color', '#FD8A69');
                           $('#userNickNameCheck').html('중복된 닉네임입니다.');
                           $("input[name='nickname']").css('border-color','#FD8A69');
                       }else{
                           $('#userNickNameCheck').css('display', 'none');
                           $("input[name='nickname']").css('border-color','#C8C8C8');
                       }
                    },
                    error:function(){
                       alert("오류가 발생하였습니다. 관리자에게 문의바랍니다.");
                    }
                 });
        	}
        	
        	
        });
        
        
        
        <%-- 이메일 유효성 검사 --%>
        $("input[name='userEmail']").keyup(function() {
            var regName = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
            if (regName.test($(this).val())) {
                $('#userEmailCheck').css('display', 'none');
                $("input[name='userEmail']").css('border-color','#C8C8C8');
            } else {
                $('#userEmailCheck').css('display', 'block');
                $('#userEmailCheck').css('color', '#FD8A69');
                $('#userEmailCheck').html('올바른 이메일 형식으로 입력해주세요.');
                $("input[name='userEmail']").css('border-color','#FD8A69');
            }
        });
        <%--이메일 중복검사--%>
        $("input[name='userEmail']").blur(function(){
    	  var email = $("input[name='userEmail']").val();
    	  $.ajax({
    		 url:"/myPage/mailCheck.do",
    		 data:{"email":email},
    		 type:"get",
    		 success:function(result){
    			 if(result=="true"){
    				 $('#userEmailCheck').css('display', 'block');
                     $('#userEmailCheck').css('color', '#FD8A69');
                     $('#userEmailCheck').html('사용중인 이메일 입니다.');
                     $("input[name='userEmail']").css('border-color','#FD8A69');
    			 }
    		 },
    		 error:function(){
    			 console.log("통신 실패");
    			 
    		 }
    	  });
       });
        
        
        <%-- 전체 항목 검사 --%>
        $('#updateBtn').click(function(){
        	var name = $("input[name='userName']").css("border-color")=="rgb(200, 200, 200)";
        	var nickname = $("input[name='nickname']").css("border-color")=="rgb(200, 200, 200)";
        	var name = $("input[name='userEmail']").css("border-color")=="rgb(200, 200, 200)";
        	if(name&&nickname&&name){
        		$('#memberUpdateForm').submit();
        	}else
        	{
        		alert('모든 항목을 바르게 입력해주세요.');
        	}
        });
        

    </script>

</div>
</body>

</html>
