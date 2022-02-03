<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/myPage/followModal.css">


<style>

</style>
    
    
    
    
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
                   <a href="/myPage/userPage.do">
                    <div class="follow-name-wrap">
                        <div class="follow-profile profile"><a><img src="/resources/images/default/profile.jpg"></a></div>
                        <div class="follow-name">EHEH</div>
                    </div>
                    </a>
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
           }); 
        });

    </script>
    