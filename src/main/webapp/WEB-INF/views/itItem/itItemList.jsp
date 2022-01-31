<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/itItemList.css">
<style>


</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="content">
		<div id="categoryBarArea">
			<div class="category" id="topItemArea">
				<div class="categoryName">상의
					<div class="categoryBtn">
						<img class="categoryBtnImg" src="/resources/images/icon/down.png">
					</div>
				</div>
				<div class="categoryContent">
				<input type="checkbox" id="top-box1" class="box" /><label for="top-box1"></label><span class="name">블라우스</span><br> 
				<input type="checkbox" id="top-box2" class="box" /><label for="top-box2"></label><span class="name">민소매</span><br> 
				<input type="checkbox" id="top-box3" class="box" /><label for="top-box3"></label><span class="name">반팔</span><br> 
				<input type="checkbox" id="top-box4" class="box" /><label for="top-box4"></label><span class="name">셔츠</span><br> 
				<input type="checkbox" id="top-box5" class="box" /><label for="top-box5"></label><span class="name">긴팔</span><br> 
				<input type="checkbox" id="top-box6" class="box" /><label for="top-box6"></label><span class="name">맨투맨</span><br> 
				<input type="checkbox" id="top-box7" class="box" /><label for="top-box7"></label><span class="name">후드</span><br> 
				<input type="checkbox" id="top-box8" class="box" /><label for="top-box8"></label><span class="name">니트</span><br> 
				<input type="checkbox" id="top-box9" class="box" /><label for="top-box9"></label><span class="name">히트텍</span><br> 
				<input type="checkbox" id="top-box10" class="box" /><label for="top-box10"></label><span class="name">원피스</span><br> 
				<input type="checkbox" id="top-box11" class="box" /><label for="top-box11"></label><span class="name">조끼</span><br> 
				</div>

			</div>
			<div class="category" id="bottomItemArea">
				<div class="categoryName">하의
					<div class="categoryBtn">
						<img class="categoryBtnImg" src="/resources/images/icon/down.png">
					</div>
				</div>
				<div class="categoryContent">
				<input type="checkbox" id="bot-box1" class="box" /><label for="bot-box1"></label><span class="name">반바지</span><br> 
				<input type="checkbox" id="bot-box2" class="box" /><label for="bot-box2"></label><span class="name">짧은치마</span><br> 
				<input type="checkbox" id="bot-box3" class="box" /><label for="bot-box3"></label><span class="name">긴치마</span><br> 
				<input type="checkbox" id="bot-box4" class="box" /><label for="bot-box4"></label><span class="name">슬랙스</span><br> 
				<input type="checkbox" id="bot-box5" class="box" /><label for="bot-box5"></label><span class="name">기모바지</span><br> 
				<input type="checkbox" id="bot-box6" class="box" /><label for="bot-box6"></label><span class="name">스타킹</span><br> 
				<input type="checkbox" id="bot-box7" class="box" /><label for="bot-box7"></label><span class="name">레깅스</span><br> 
				<input type="checkbox" id="bot-box8" class="box" /><label for="bot-box8"></label><span class="name">일자바지</span><br> 
				<input type="checkbox" id="bot-box9" class="box" /><label for="bot-box9"></label><span class="name">와이드팬츠</span><br> 
				<input type="checkbox" id="bot-box10" class="box" /><label for="bot-box10"></label><span class="name">스키니</span><br> 
				<input type="checkbox" id="bot-box11" class="box" /><label for="bot-box11"></label><span class="name">부츠컷</span><br> 
				<input type="checkbox" id="bot-box12" class="box" /><label for="bot-box12"></label><span class="name">조거</span><br> 
				<input type="checkbox" id="bot-box13" class="box" /><label for="bot-box13"></label><span class="name">치마바지</span><br> 
				<input type="checkbox" id="bot-box14" class="box" /><label for="bot-box14"></label><span class="name">멜빵</span><br> 
				<input type="checkbox" id="bot-box15" class="box" /><label for="bot-box15"></label><span class="name">미디스커트</span><br> 
				</div>

			</div>
			<div class="category" id="outterItemArea">
				<div class="categoryName">아우터
					<div class="categoryBtn">
						<img class="categoryBtnImg" src="/resources/images/icon/down.png">
					</div>
				</div>
				<div class="categoryContent">
				<input type="checkbox" id="out-box1" class="box" /><label for="out-box1"></label><span class="name">자켓</span><br> 
				<input type="checkbox" id="out-box2" class="box" /><label for="out-box2"></label><span class="name">가디건</span><br> 
				<input type="checkbox" id="out-box3" class="box" /><label for="out-box3"></label><span class="name">야상</span><br> 
				<input type="checkbox" id="out-box4" class="box" /><label for="out-box4"></label><span class="name">트렌치코트</span><br> 
				<input type="checkbox" id="out-box5" class="box" /><label for="out-box5"></label><span class="name">패딩</span><br> 
				<input type="checkbox" id="out-box6" class="box" /><label for="out-box6"></label><span class="name">코트</span><br> 
				<input type="checkbox" id="out-box7" class="box" /><label for="out-box7"></label><span class="name">바람막이</span><br> 
				<input type="checkbox" id="out-box8" class="box" /><label for="out-box8"></label><span class="name">플리스</span><br> 
				<input type="checkbox" id="out-box9" class="box" /><label for="out-box9"></label><span class="name">집업</span><br>
				</div>

			</div>
			<div class="category" id="AccItemArea">
				<div class="categoryName">악세서리
					<div class="categoryBtn">
						<img class="categoryBtnImg" src="/resources/images/icon/down.png">
					</div>
				</div>
				<div class="categoryContent">
				<input type="checkbox" id="acc-box1" class="box" /><label for="acc-box1"></label><span class="name">장갑</span><br> 
				<input type="checkbox" id="acc-box2" class="box" /><label for="acc-box2"></label><span class="name">목도리</span><br> 
				<input type="checkbox" id="acc-box3" class="box" /><label for="acc-box3"></label><span class="name">모자</span><br> 
				<input type="checkbox" id="acc-box4" class="box" /><label for="acc-box4"></label><span class="name">양말</span><br> 
				<input type="checkbox" id="acc-box5" class="box" /><label for="acc-box5"></label><span class="name">벨트</span><br> 
				<input type="checkbox" id="acc-box6" class="box" /><label for="acc-box6"></label><span class="name">시계</span><br> 
				<input type="checkbox" id="acc-box7" class="box" /><label for="acc-box7"></label><span class="name">안경</span><br> 
				<input type="checkbox" id="acc-box8" class="box" /><label for="acc-box8"></label><span class="name">가방</span><br> 
				<input type="checkbox" id="acc-box9" class="box" /><label for="acc-box9"></label><span class="name">귀걸이</span><br> 
				<input type="checkbox" id="acc-box10" class="box" /><label for="acc-box10"></label><span class="name">목걸이</span><br> 
				<input type="checkbox" id="acc-box11" class="box" /><label for="acc-box11"></label><span class="name">팔찌</span><br> 
				<input type="checkbox" id="acc-box12" class="box" /><label for="acc-box12"></label><span class="name">반지</span><br> 
				<input type="checkbox" id="acc-box13" class="box" /><label for="acc-box13"></label><span class="name">발찌</span><br> 
				</div>

			</div>
			<div class="category" id="shoesItemArea">
				<div class="categoryName">신발
					<div class="categoryBtn">
						<img class="categoryBtnImg" src="/resources/images/icon/down.png">
					</div>
				</div>
				<div class="categoryContent">
				<input type="checkbox" id="shoes-box1" class="box" /><label for="shoes-box1"></label><span class="name">신발</span><br> 
				</div>

			</div>
		</div>
		<div id="itItemListArea">
			<div id="itItemListNumArea">잇템 전체 1000개</div>
			<div id="itItemListFilterArea">
				<img id="filterImg" alt="" src="/resources/images/icon/filter.png">
				<select id="filter">
					<option>최신순</option>
					<option>최근 인기순</option>
					<option>역대 인기순</option>
					<option>팔로잉</option>
				</select>
			</div>
			<div id="itItemImgArea">
				<div class="itItemImgWrap">
					<div class="itItemImgArea">
				
					사진
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_w.png"> <img
								class="scrap" src="/resources/images/icon/saved_w.png">
						</div>
					
				
					</div>
					<div class="itItemInfoArea">
						<div class="itItemInfoCategory">아이템카테고리 | 종류</div>
						<div class="itItemInfoTitle">잇템 제목</div>
						<div class="nickNameArea">

								<div class="profileArea">
									<div class="profile">
										<a href=""><img src="/resources/images/default/profile.jpg" /></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
						</div>
					</div>
				</div>	
				
			</div>
		</div>

	</div>
	<script>
		$('.categoryBtn').click(function(){
			$(this).parent().next().slideToggle();
		})

		$('.like').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/heart_on.png") {
				$(this).attr('src', "/resources/images/icon/heart_w.png");
			} else {
				$(this).attr('src', "/resources/images/icon/heart_on.png");
			}

		});
		$('.scrap').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/saved_on.png") {
				$(this).attr('src', "/resources/images/icon/saved_w.png");
			} else {
				$(this).attr('src', "/resources/images/icon/saved_on.png");
			}

		});
		$('.categoryBtnImg').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/up.png") {
				$(this).attr('src', "/resources/images/icon/down.png");
			} else {
				$(this).attr('src', "/resources/images/icon/up.png");
			}

		});
	</script>
</body>
</html>