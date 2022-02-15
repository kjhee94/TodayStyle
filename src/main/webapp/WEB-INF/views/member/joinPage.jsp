<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지? - 회원가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/css/member/joinPage.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
</head>
<body>
<style>
 
        #emailCheck-area{
            width: 400px;
            height: 134px;
            background-color: #FAFAFA;
          
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 12px;
          	padding: 15px;
            
            display: none;
            margin-bottom: 30px;
        }
        .emailCheck{
            font-family: 'Noto Sans KR', sans-serif;
            letter-spacing: -0.03em;
        }
        #emailCheck-text{
            font-size: 12px;
            color: #707070;
        }
        #emailCheck-input{
            width: 275px;
            height: 50px;
            background-color: #fff;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        #emailCheck-btn{
            width: 80px;
            height: 50px;
            text-align: center;
            display: inline-block;
            margin-left: 15px;
        }
        #emailCheck-time{
            font-size: 12px;
            color: #FD8A69;
            display: inline-block;
        }
        #emailCheck-resend{
            font-size: 12px;
            color: #C8C8C8;
            display: inline-block;
            margin-left: 105px;
            cursor: pointer;
        }
       </style>

	<div id="content">
		<form id="joinForm"  method="post">
		
			<div id="logo">
				<a href="/" id="logo"><img alt="오늘 뭐 입지 로고" src="/resources/images/logo.png"></a>
			</div>
		
			<div class="input-top">
	        <span class="title">아이디</span>
	        <span class="explain">영문,숫자 5자 이상의 아이디를 입력해주세요</span>
	        </div>
	        <div>
	        <input type="text" id="userid" class="input-style" name="userId" placeholder="아이디"/>
	        </div>
	        <div id="id" class="validity"></div>
        	
        	<div class="input-top">
	        <span class="title">비밀번호</span>
	        <span class="explain">영문,숫자,특수문자를 포함한 8자 이상의 비밀번호를 입력해주세요</span>
	        </div>
	        <div>
	        <input type="password" class="input-style" name="userPwd" id="userpwd" placeholder="비밀번호"/>
	        </div>
	        <div id="pwd" class="validity"></div>
	        <input type="password" class="input-style" name="userpwd_re" id="userpwd_re" placeholder="비밀번호 확인">
	        <div id="pwd_re" class="validity"></div>
        	
        	<div class="input-top">
	        <span class="title">이름</span>
	        </div>
	        <input class="input-style" name="userName" id="userName" placeholder="이름"/>
	        <div id="name" class="validity"></div>
        	
        	<div class="input-top">
	        <span class="title">닉네임</span>
	        <span class="explain">다른 유저와 겹치지 않는 별명을 입력해주세요(2~8자 한글만)</span>
	        </div>
	        <input type="text" class="input-style" name="nickname" id="nickname" maxlength="8" placeholder="닉네임"/>
	        <div id="nick" class="validity">
	        
	        </div>
       		
       		<div class="input-top">
	        <span class="title">이메일</span>
	        </div>
	        <input type="text" class="input-style" name="userEmail" id="userEmail" placeholder="이메일"/>
	        <div id="email" class="validity">
	        
	        </div>
	        
	       
	        
             
	        <button type="button" class="btn-style-mint btn-certified" id="mail_check_button"><a>이메일 인증</a></button>
	         <button type="button" class="btn-style-mint btn-certified" id="mail_check_button2" style="display:none"><a>인증 완료</a></button>
	        <div id="emailCheck-area">
                  <div id="emailCheck-text" class="emailCheck">이메일로 전송된 인증코드를 입력해주세요</div>
                  <div class="mail_check_input_box" id="mail_check_input_box_false">
                 
                   	<input type="text" placeholder="인증코드 6자리 입력" id="emailCheck-input"  class="emailCheck input-style"><div id="emailCheck-btn" class="emailCheck btn-style-mint">확인</div>
                  
                  </div>
                  	<div id="emailCheck-time" class="emailCheck"></div><button type="button" id="emailCheck-resend" class="emailCheck">이메일 재전송</button>
             </div>
        
       		<span class="title">성별</span>
       		<div class="box-radio">
		        <div><input type="radio" id="female" name="gender" value="여자"><label for="female">여자</label></div>
		        <div><input type="radio" id="male" name="gender" value="남자"><label for="male">남자</label></div>
		        <div><input type="radio" id="non" name="gender" value="비공개" checked><label for="non">비공개</label></div>
			</div>
       
        	<span class="title">약관동의</span>
       		<div class="box-agree">
       			<div class="whole"><input type="checkbox" id="allcheckbox"><label for="allcheckbox">전체동의</label></div>
		       	<div class="box-checkbox">
		       		<div><input type="checkbox" id="agree1" name="agree" value="1"><label for="agree1">이용약관 <span class="small">(필수)</span></label></div>
		       		<div><input type="checkbox" id="agree2" name="agree" value="2"><label for="agree2">개인정보 처리방침 <span class="small">(필수)</span></label></div>
		       		<div><input type="checkbox" id="agree3" name="agree" value="3"><label for="agree3">마케팅 수신동의 <span class="small un">(선택)</span></label></div>
		    	</div>
	       	</div>
	        <button class="btn-style-mint btn-certified" id="joinBtn">가입 하기</button>
    	</form>
    </div>
    
    <script>
     //이메일전송 인증번호 저장위한 코드
    /* 인증번호 이메일 전송 */
    var code;
    $(document).ready(function() {
    	
    	
    $("#mail_check_button").click(function(){// 이메일 인증 입력창 나타나기
    	 var email = $("#userEmail").val();  // 입력한 이메일
    	 $("input[name='userEmail']").attr('readonly','true');  // 이메일 입력창 비활성화
    	if(email!="" && ($('#userEmail').css("border-color")=="rgb(200, 200, 200)")){
    	 $('#emailCheck-area').css('display','block');
       
        var cehckBox = $("#emailCheck-input");        // 인증번호 입력란
        var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
        
        $.ajax({
        	   url:"/member/emailCheck.do",
	             data:{"email":email},
	             type:"GET",
	             success:function(data){
	            	
	            	 code = data;
	            	 
	             }         
        }) 
    	}else if(email==""){
    		alert("이메일을 작성해주세요.")
    		return false;
    	}
    	 
    	 if($('#userEmail').css("border-color")=="rgb(253, 138, 105)"){
       	 alert("잘못된 이메일입니다.");
    	 return false;
       	}
    })  
    	 
    $("#emailCheck-resend").click(function(){
    	 var email = $("#userEmail").val();  // 입력한 이메일
         var cehckBox = $("#emailCheck-input");        // 인증번호 입력란
         var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
         alert('이메일이 재전송 되었습니다.');
         $.ajax({
         	   url:"/member/emailCheck.do",
 	             data:{"email":email},
 	             type:"GET",
 	             success:function(data){
 	            	
 	            	
 	            	code = data;
 	            	 
 	             }         
         }) 
    });
    /* 인증번호 비교 */
    $("#emailCheck-btn").click(function(){
    	var inputCode = $("#emailCheck-input").val();       // 입력코드    
    
    	
        if(inputCode==code){                            // 일치할 경우
        	 $('#userEmail').css("border-color","#C8C8C8");  
        	$('#emailCheck-area').css("display","none");
        	$('#mail_check_button2').attr('disabled','disabled');
        	$('#mail_check_button').css('display','none');
        	$('#mail_check_button2').css('display','block');
        	  $("input[name='userEmail']").attr('readonly','true');  // 이메일 입력창 비활성화
        	$('#mail_check_button2').css('background-color','#C8C8C8');
        	
        } else {                                            // 일치하지 않을 경우
        	$('#userEmail').css("border-color","#FD8A69");
        }    
        
        
    });
    });
    
    </script>
    <script>
	
		  var timer = null;
		  var isRunning = false;

		  $('#mail_check_button').click(function(){
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
		        $('#emailCheck-area').css("display","none");
		        return;
		        $("button").attr("disabled", true);
		        isRunning = false;
		      }
		    
		    }, 1000);
		    isRunning = true;
		  }
	
	</script>
    <script>
		$('#allcheckbox').click(function() {
			if ($(this).prop('checked')) {
				$('input[name=agree]').prop('checked', true);
			} else {
				$('input[name=agree]').prop('checked', false);
			}
		});
	</script>
	<script>

	$(document).ready(function() {
		
		<%-- ID 유효성 검사 --%>
	     $("input[name='userId']").keyup(function(){
	          var regId=/^[a-zA-Z0-9]{5,15}$/;
	          if(regId.test($(this).val())){
	        	  $('#id').css("display","none");
	        	  $('#userid').css("border-color","#C8C8C8");
	        	 
	          }else{
	             $('#id').css("color",'#FD8A69');
	             $('#id').html("아이디는 영문,숫자 5자 이상이어야 합니다.");
	             $('#id').css("display","block");
	             $('#userid').css("border-color","#FD8A69");
	          }
	       });
	     
	     <%-- Pwd 유효성 검사 --%>
	       $("input[name='userPwd']").keyup(function(){
	          var regPwd= /^(?=.*[!@#$%^&*()])(?=.*[a-zA-Z])(?=.*[0-9]).{8,15}$/;
	          if(regPwd.test($(this).val())){
	        	  $('#pwd').css("display","none");
	        	  $('#userpwd').css("border-color","#C8C8C8");
	          }else{
	        	  $('#pwd').css("color",'#FD8A69');
		          $('#pwd').html("영문,숫자,특수문자를 포함하여 8자 이상이어야 합니다.");
		          $('#pwd').css("display","block");
		          $('#userpwd').css("border-color","#FD8A69");
	          }
	       });
	       
	       <%-- Pwd 재검사 --%>
	       $("input[name='userpwd_re']").keyup(function(){
	          if($(this).val()==$("input[name='userPwd']").val()){
	        	  $('#pwd_re').css("display","none");
	        	  $('#userpwd_re').css("border-color","#C8C8C8");
	          }else{
	        	  $('#pwd_re').css("color",'#FD8A69');
		          $('#pwd_re').html("비밀번호가 일치하지 않습니다.");
		          $('#pwd_re').css("display","block");
		          $('#userpwd_re').css("border-color","#FD8A69");
	          }
	       });
	       
	       <%-- 이름 유효성 검사 --%>
	       $("input[name='userName']").keyup(function(){
	          var regName=/^[가-힣]+$/;
	          if(regName.test($(this).val())){
	        	  $('#name').css("display","none");
	        	  $('#userName').css("border-color","#C8C8C8");
	          }else{
	        	  $('#name').css("color",'#FD8A69');
		          $('#name').html("한글만 가능합니다.");
		          $('#name').css("display","block");
		          $('#userName').css("border-color","#FD8A69");
	          }
	       });
	       
	       <%--닉네임 유효성 검사 --%>
	       $("input[name='nickname']").keyup(function(){
		          var regName=/^[가-힣]{2,8}$/;
		          if(regName.test($(this).val())){
		        	  $('#nick').css("display","none");
		        	  $('#nickname').css("border-color","#C8C8C8");
		          }else{
		        	  $('#nick').css("color",'#FD8A69');
			          $('#nick').html("한글만 2자 이상 입력해주세요.");
			          $('#nick').css("display","block");
			          $('#nickname').css("border-color","#FD8A69");
		          }
		       });
	       
	       <%--이메일 유효성 검사 --%>
	       $("input[name='userEmail']").keyup(function(){
		          var regName=/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		          if(regName.test($(this).val())){
		        	  $('#email').css("display","none");
		        	  $('#userEmail').css("border-color","#C8C8C8");
		        	 
		          }else{
		        	  $('#email').css("color",'#FD8A69');
			          $('#email').html("이메일 형식이 올바르지 않습니다.");
			          $('#email').css("display","block");
			          $('#userEmail').css("border-color","#FD8A69");
		          }
		       });
	       
	       
	       
	       <%-- Id 중복 검사 --%>
	       $("#userid").blur(function(){
	          var userid=$('#userid').val();
	          $.ajax({
	             url:"/member/idCheck.do",
	             data:{"userid":userid},
	             type:"get",
	             success:function(result){
	                if(result=="true"){
	                	alert('중복된 ID입니다. 다른 ID를 입력해주세요.');
	                	 $('#id').css("color",'#FD8A69');
	    	             $('#id').html("중복된 ID입니다. 다른 ID를 입력해주세요.");
	    	             $('#id').css("display","block");
	    	             $('#userid').css("border-color","#FD8A69");
	                }
	             },
	             error:function(){
	            	 console.log("ajax 통신 실패");
	             }
	          });
	          
	       });
		
	       <%--이메일 중복검사--%>
	       $('#userEmail').blur(function(){
	    	  var userEmail = $('#userEmail').val();
	    	  $.ajax({
	    		 url:"/member/mailCheck.do",
	    		 data:{"userEmail":userEmail},
	    		 type:"get",
	    		 success:function(result){
	    			 if(result=="true"){
	    				 alert('중복된 이메일입니다. 다른 이메일을 입력해주세요.');
	    				 $('#email').css("color",'#FD8A69');
				          $('#email').html("중복된 이메일입니다. 다른 이메일을 입력해주세요.");
				          $('#email').css("display","block");
				          $('#userEmail').css('border-color',"#FD8A69")
	    			 }
	    		 },
	    		 error:function(){
	    			 console.log("ajax통신 실패");
	    			 
	    		 }
	    	  });
	       });
		
	       
	       <%-- 닉네임 중복 검사 --%>
	       $("#nickname").blur(function(){
	          var nickname=$('#nickname').val();
	          $.ajax({
	             url:"/member/nicknameCheck.do",
	             data:{"nickname":nickname},
	             type:"get",
	             success:function(result){
	                if(result=="true"){
	                	alert('중복된 닉네임입니다. 다른 닉네임을 입력해주세요.');
	                	 $('#nick').css("color",'#FD8A69');
				          $('#nick').html("중복된 닉네임입니다. 다른 닉네임을 입력해주세요.");
				          $('#nick').css("display","block");
				          $('#nickname').css("border-color","#FD8A69");
	                }
	             },
	             error:function(){
	            	 console.log("ajax 통신 실패");
	             }
	          });
	   
	       });
	       
	       
	       
	       <%-- 전체 항목 검사 --%>
	       $("#joinBtn").click(function(){
	    	   var userId = $('#userid').val();
				var userPwd = $('#userpwd').val();
				var userPwdRe = $('#userpwd_re').val();
				var userName = $('#userName').val();
				var userEmail = $('#userEmail').val();
				var userNickname = $('#nickname').val();
	            if(userId == ""){
	                alert("아이디를 입력해주세요."); 
	                $('#userid').css("border-color","#FD8A69");
	                return false; 
	            }
	            if(userPwd==""){
	            	alert("비밀번호를 입력해주세요.");
	            	$('#userpwd').css("border-color","#FD8A69");
	            	return false;
	            }
	            if(userPwdRe==""){
	            	alert("비밀번호 확인을 입력해주세요.")
	            	$('#userPwdRe').css("border-color","#FD8A69");
	            	return false;
	            }
	            if(userName==""){
	            	alert('이름을 입력하세요.')
	            	$('#userName').css("border-color","#FD8A69");
	            	return false;
	            }
	            if(userNickname == ""){
	            	alert("닉네임을 입력하세요.")
	            	$('#nickname').css("border-color","#FD8A69");
	            	return false;
	            }
	            
	            if(userEmail==""){
	            	alert("이메일을 입력하세요.");
	            	$('#userEmail').css("border-color","#FD8A69");
	            	return false;
	            }
	            if($('input:checkbox[id="agree1"]').is(':checked')==false){
	            	alert("이용약관을 체크해주세요");
	            	return false;
	            	
	            	
	            }
	            if($('input:checkbox[id="agree2"]').is(':checked')==false){
	            	alert("개인정보 처리방침을 체크해주세요");
	            	return false;
	            }
	            
	    	  var id = $('#userid').css("border-color")=="rgb(200, 200, 200)";
	    	   var pwd= $('#userpwd').css("border-color")=="rgb(200, 200, 200)";
	    	   var pwdRe =  $('#userpwd_re').css("border-color")=="rgb(200, 200, 200)";
	    	  var name =  $('#userName').css("border-color")=="rgb(200, 200, 200)";
	    	 var nickname =  $('#nickname').css("border-color")=="rgb(200, 200, 200)";
	    	 var email =  $('#userEmail').css("border-color")=="rgb(200, 200, 200)";
	    	var emailBtn= $('#mail_check_button2').css('background-color')=="rgb(200, 200, 200)";

	    	if($('#mail_check_button2').css('background-color')=="rgb(169, 212, 217)")
	    		{
	    		alert('이메일 인증을 해주세요');
	    		return false;
	    		}
	    	 if(id&&pwd&&pwdRe&&name&&nickname&&email&&emailBtn){
	    		 $('#joinForm').attr("action","/member/joinMember.do");
	             $('#joinDo').submit();
	          }else{
	       
	             alert("회원가입 실패");
	             return false;
	          }
	       });
	      
	});

		
	</script>
</body>
</html>