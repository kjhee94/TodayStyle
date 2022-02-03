<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>

        #profile-wrap {
            width: 12%;
            height: 430px;
            margin-right: 2.23%;
            float: left;
            position: fixed;
        }

        #profile-img {
            width: 150px;
            height: 150px;
            margin: 55px auto 30px;
        }

        #userName {
            margin: 0 auto;
            width: 100%;
            height: 35px;
            text-align: center;
            
        }
        #userName>a{
           font-family: 'Noto Sans KR', sans-serif;
            font-weight: 700;
            font-size: 24px;
            letter-spacing: -0.03em;
            color: #707070;
        }

        #follow-wrap {
            height: 25px;
            margin: 10px auto 20px;
            text-align: center;
        }

        .modal-btn {
            display: inline;
            cursor: pointer;
        }

        .follow {
            font-family: 'Noto Sans KR', sans-serif;
            color: #707070;
            margin-right: 1.30%;
            display: inline-block;
            letter-spacing: -0.03em;
        }

        .followNum {
            font-family: 'Noto Sans KR', sans-serif;
            color: #707070;
            font-weight: 700;
            display: inline-block;
        }

        #followLine {
            display: inline-block;
            margin: 0 4.34%;
            height: 15px;
            width: 0px;
            border-left: 0.5px solid #C8C8C8;
        }

        #profileLine {
            height: 0px;
            width: 100%;
            border-top: 0.5px solid #C8C8C8;
        }

        #icon-wrap {
            display: inline-block;
            margin-top: 30px;
            width: 100%;
            text-align: center;
        }

        .icon-area {
            display: inline-block;
            width: 28.26%;
            cursor: pointer;
            margin-bottom: 20px;
        }

        #comments-wrap {
            margin: 0 4.34%;
        }

        .icon-img {
            width: 30px;
            height: 30px;
            margin-bottom: 10px;
            opacity: 0.7;
        }

        .icon-text {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            color: #707070;
            letter-spacing: -0.03em;
        }
        
</style>

    
    <div id="profile-wrap">
                    <div id="profile-img" class="profile">
                        <a><img src="/resources/images/default/profile.jpg"></a>
                    </div>
                    <div id="userName"><a href="/myPage/myStyle.do">여니여니</a></div>
                    <div id="follow-wrap">
                        <div id="follower-modal-btn" class="modal-btn">
                            <div class="follow">팔로워</div>
                            <div class="followNum">3</div>
                        </div>
                        <div id="followLine"> </div>
                        <div id="following-modal-btn" class="modal-btn">
                            <div class="follow">팔로잉</div>
                            <div class="followNum">7</div>
                        </div>
                    </div>
                    <div id="profileLine"></div>
                    <div id="icon-wrap">
                        <a href="/myPage/scrap.do">
                            <div class="icon-area">
                                <img src="/resources/images/icon/saved.png" class="icon-img">
                                <div class="icon-text">스크랩</div>
                            </div>
                        </a>
                        <a href="/myPage/comments.do">
                            <div id="comments-wrap" class="icon-area">
                                <img src="/resources/images/icon/comment.png" class="icon-img">
                                <div class="icon-text">내댓글</div>
                            </div>
                        </a>
                        <a href="/myPage/setting.do">
                            <div class="icon-area">
                                <img src="/resources/images/icon/setting.png" class="icon-img">
                                <div class="icon-text">설정</div>
                            </div>
                        </a>
                    </div>
                </div>