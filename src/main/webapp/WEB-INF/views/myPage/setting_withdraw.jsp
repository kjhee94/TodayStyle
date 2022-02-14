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
    <title>오늘 뭐 입지? - 회원탈퇴</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/common/common.css">
    <link rel="stylesheet" href="/resources/common/header.css">
	<link rel="stylesheet" href="/resources/common/footer.css">
	<link rel="stylesheet" href="/resources/css/myPage/setting_withdraw.css">
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
                    <a href="">
                        <div class="contents-title" id="memberUpdate">회원 탈퇴</div>
                    </a>
                </div>
                <div id="floatSpace"></div>
                <div class="withdraw" id="withdrawTitle">회원 탈퇴 신청에 앞서 아래 내용을 반드시 확인해주세요.</div>
                <div id="content-box">
                    <div class="withdraw-guide-title">회원탈퇴 시 처리내용</div>
                    <div class="withdraw withdraw-guide">
                        소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의 공급에 관한 기록은 5년, 소비자의 불만 또는
                        분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.</div>
                    <div class="withdraw-guide-title">회원탈퇴 시 게시물 관리</div>
                    <div class="withdraw withdraw-guide">
                        회원탈퇴 후 오늘뭐입지 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집
                        및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.</div>
                </div>
                <input type="checkbox" id="checkbox"> <label for="checkbox">위 내용을 모두 확인하였습니다.</label>
                <div id="essential">필수</div>
                <div class="btn-style-mint btn" id="cancelBtn"><a href="/myPage/setting.do">취소</a></div>
                <div class="btn-style-line btn" id="withdrawBtn"><a>탈퇴</a></div>

            </div>

            <div id="space"></div>

        </div>

    </div>


    

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <jsp:include page="/WEB-INF/views/myPage/include/followerModal.jsp" />
    <jsp:include page="/WEB-INF/views/myPage/include/followingModal.jsp" />

    <script>
        $('#withdrawBtn').click(function(){
        	
        	var checked = $('#checkbox').is(':checked');
        	if(checked==false)
        	{
        		$('#essential').html('필수 동의 항목입니다.');
        		$('#essential').css('color','#FD8A69');
        		$('#withdrawTitle').css('color','#FD8A69');
        		$('#checkbox').css('border-color','#FD8A69');
        	}
        	if(checked==true)
        	{
        		$('#essential').html('필수');
        		$('#essential').css('color','#A9D4D9');
        		$('#withdrawTitle').css('color','#707070');
        		$('#checkbox').css('border-color','#C8C8C8');
        		
        		if(window.confirm('회원 탈퇴시 복구가 불가능함을 알려드립니다.') && window.confirm('탈퇴를 진행하시겠습니까?'))
        		{
        			location.replace('/myPage/withdraw.do');
        		}
        		
        	}
        	
        });

    </script>


</body>

</html>
