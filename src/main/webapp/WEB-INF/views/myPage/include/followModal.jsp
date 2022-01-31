<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>

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
           }); 
        });

    </script>
    