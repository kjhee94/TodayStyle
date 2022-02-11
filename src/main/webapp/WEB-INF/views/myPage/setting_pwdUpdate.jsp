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
                    <a href="/myPage/setting.do">
                        <div class="contents-title" id="memberUpdate">회원정보 수정</div>
                    </a>
                    <div id="line"></div>
                    <a href="/myPage/pwdUpdatePage.do">
                        <div class="contents-title" id="pwdUpdate">비밀번호 수정</div>
                    </a>
                </div>
                <div id="floatSpace"></div>
                <div class="rowLine"></div>

                <form action="/myPage/pwdUpdate.do" method="post">
                    <div class="contents-area">
                        <div class="input-wrap">
                            <div class="titleName">현재 비밀번호</div>
                            <input type="password" name="userPwd" class="input-style" id="userPwd" placeholder="현재 비밀번호">
                            <div class="check" id="userPwdCheck"></div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">새 비밀번호</div>
                            <input type="password" name="newUserPwd" id="newUserPwd" class="input-style" placeholder="새 비밀번호">
                            <div class="check" id="newUserPwdCheck"></div>
                        </div>
                        <div class="rowLine"></div>
                        <div class="input-wrap">
                            <div class="titleName">새 비밀번호 확인</div>
                            <input type="password" name="newUserPwd_re" id="newUserPwd_re" class="input-style" placeholder="새 비밀번호 확인">
                            <div class="check" id="newUserPwdCheck_re"></div>
                        </div>
                        <div class="rowLine"></div>


                        <input type="submit" class="btn-style-mint" id="updateBtn" value="변경">

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
     
        // 현재 비밀번호 확인 (ajax)
        $('#userPwd').blur(function(){
        	
        	var userPwd = $('#userPwd').val();
    		$.ajax({	
                url:"/myPage/userPwdCheck.do",
                data:{"userPwd":userPwd},
                type:"post",
                success:function(result){
                
                   if(result=="false"){
                       $('#userPwdCheck').css('display', 'block');
                       $('#userPwdCheck').css('color', '#FD8A69');
                       $('#userPwdCheck').html('비밀번호가 일치하지 않습니다.');
                       $("input[name='userPwd']").css('border-color','#FD8A69');
                   }else{
                       $('#userPwdCheck').css('display', 'none');
                       $("input[name='userPwd']").css('border-color','#C8C8C8');
                   }
                
                },
                error:function(){
                   alert("오류가 발생하였습니다. 관리자에게 문의바랍니다.");
                }
             });
        	
        });
        
        
        <%-- 새 비밀번호 유효성 검사 --%>
        $("input[name='newUserPwd']").keyup(function(){
          	var regPwd= /^(?=.*[!@#$%^&*()])(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
         	if(regPwd.test($(this).val())){
        	  	$('#newUserPwdCheck').css("display","none");
        	  	$("input[name='newUserPwd']").css("border-color","#C8C8C8");
          	}else{
        	  	$('#newUserPwdCheck').css("color",'#FD8A69');
	          	$('#newUserPwdCheck').html("비밀번호는 영문,숫자,특수부호를 포함하여 8자 이상이어야 합니다.");
	          	$('#newUserPwdCheck').css("display","block");
	          	$("input[name='newUserPwd']").css("border-color","#FD8A69");
         	}
	    });
        
        <%-- 새 비밀번호(re) 일치 검사 --%>
        $("input[name='newUserPwd_re']").keyup(function(){
        	var newUserPwd = $("input[name='newUserPwd']").val();
        	var newUserPwd_re = $("input[name='newUserPwd_re']").val();
        	
         	if(newUserPwd == newUserPwd_re){
        	  	$('#newUserPwdCheck_re').css("display","none");
        	  	$("input[name='newUserPwd_re']").css("border-color","#C8C8C8");
          	}else{
        	  	$('#newUserPwdCheck_re').css("color",'#FD8A69');
	          	$('#newUserPwdCheck_re').html("비밀번호가 일치하지 않습니다.");
	          	$('#newUserPwdCheck_re').css("display","block");
	          	$("input[name='newUserPwd_re']").css("border-color","#FD8A69");
         	}
	    });
        
        
        $('#updateBtn').click(function(){
        	var $userPwd = $("input[name='userPwd']");
        	var $newUserPwd =  $("input[name='newUserPwd']");
        	var $newUserPwd_re =  $("input[name='newUserPwd_re']");
        	
        	if($userPwd.val() == ""){
        		$userPwd.focus();
        		$('#userPwdCheck').css('display', 'block');
                $('#userPwdCheck').css('color', '#FD8A69');
                $('#userPwdCheck').html('비밀번호를 입력해주세요.');
                $("input[name='userPwd']").css('border-color','#FD8A69');
                return false;
        	}
        	if($newUserPwd.val() == ""){
        		$newUserPwd.focus();
        		$('#newUserPwdCheck').css('display', 'block');
                $('#newUserPwdCheck').css('color', '#FD8A69');
                $('#newUserPwdCheck').html('새비밀번호를 입력해주세요.');
                $("input[name='newUserPwd']").css('border-color','#FD8A69');
                return false;
        	}
        	if($newUserPwd_re.val() == ""){
        		$newUserPwd_re.focus();
        		$('#newUserPwdCheck_re').css('display', 'block');
                $('#newUserPwdCheck_re').css('color', '#FD8A69');
                $('#newUserPwdCheck_re').html('새비밀번호 확인을 입력해주세요.');
                $("input[name='newUserPwd_re']").css('border-color','#FD8A69');
                return false;
        	}
        	
        	
        	
        	// 전체 항목 검사
           	var pwd = $("input[name='userPwd']").css("border-color")=="rgb(200, 200, 200)";
           	var n_pwd = $("input[name='newUserPwd']").css("border-color")=="rgb(200, 200, 200)";
           	var n_pwd_re = $("input[name='newUserPwd_re']").css("border-color")=="rgb(200, 200, 200)";
           	if(pwd && n_pwd && n_pwd_re){
           		
           	   	if (window.confirm("비밀번호를 수정하시겠습니까?")) 
           	   	{
               		return true;
           	   	}
           	   	else{
               		return false;
           	   	}
           	}else
           	{
           		alert('모든 항목을 바르게 입력해주세요.');
           		return false;
           	}
        	
        });
        
        
        

    </script>


</body>

</html>
