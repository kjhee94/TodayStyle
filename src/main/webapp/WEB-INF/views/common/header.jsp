<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<header>
		<div id="hContainer">
			<div id="logo">
				<a href="/"><img alt="오늘 뭐 입지 로고" src="/resources/images/logo.png"></a>
			</div>
			<div class="box-menu">
				<nav>
					<ul id="gnb-list">
						<li><a href="/coordi/coordiList.do">오늘의 코디</a></li>
						<li><a href="/beststyle/weekBestPage.do">베스트 코디</a></li>
						<li><a href="/itItem/itItemList.do">오늘의 잇템</a></li>
						<li><a href="/board/NoticePage.do">고객센터</a></li>
					</ul>
				</nav>
				<div id="member">
					<div class="link-member">
						<c:choose>
							<c:when test="${sessionScope.member!=null }">
								<div class="box-mypage">
									<div class="profile">
										<img src="/resources/images/default/profile.jpg"/>
									</div>
									<div class="box-mypage-link">
										<a href="/myPage/myStyle.do">나의 코디</a>
										<a href="/myPage/scrapCoordi.do">스크랩북</a>
										<a href="/myPage/commentsCoordi.do">나의 댓글</a>
										<a href="/myPage/setting.do">설정</a>
										<a href="/member/logout.do">로그아웃</a>
									</div>
								</div>
								<div class="box-write">
									<button class="btn-style-mint">글 작성</button>
									<div class="box-write-link">
										<a href="/coordi/coordiInsert.do">코디 작성</a>
										<a href="/coordi/ItInsert.do">잇템 작성</a>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<a href="/member/loginPage.do">로그인</a>
								<a href="/member/joinPage.do">회원가입</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div id="sideBar">
		<div class="box-sideBar">
			<a href="">
				<div class="box-sidebar-img">
					<img alt="" src="/resources/images/icon/location.png">
				</div>
				<span>VIEW</span>
			</a>
		</div>
		<div class="box-sideBar">
			<a href="">
				<div class="box-sidebar-img">
					<img alt="" src="/resources/images/icon/chat.png">
				</div>
				<span>CHAT</span>
			</a>
		</div>
		<div class="box-sideBar page-top">
			<a style="cursor:pointer;" onclick="window.scrollTo(0,0);">
				<i class="fas fa-chevron-up"></i>
				<span>TOP</span>
			</a>
		</div>
	</div>
	