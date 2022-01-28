<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<style>
/* div {
	border: 1px solid black;
	box-sizing: border-box;
}
 */
#content {
	padding-top: 40px;
}

/* 카테고리바 css */
#categoryBarArea {
	float: left;
	width: 16%;
	height: 1455px;
}

.category {
	width: 100%;
	border-top: 1px solid #707070;
	line-height: 170%;
}

.categoryName {
	width: 100%;
	height: 55px;
	padding-top: 17px;
	font-size: 16px;
	color: #707070;
}

#genderArea {
	height: 183px;
}

#seasonArea {
	height: 210px;
}

#tempArea {
	height: 200px;
}

.name {
	position:relative;
	margin-left: 5px;
	font-size: 15px;
	color: #707070;
	top:-3px;
}

.box+label {
	display: inline-block;
	width: 18px;
	height: 18px;
	border: 1px solid #9F9F9F;
	cursor: pointer;
	border-radius: 2px;
}

.box:checked+label {
	background-color: #A9D4D9;
}

.box {
	display: none;
}

.tempBox {
	width: 56px;
	height: 30px;
	border: 1px solid #9F9F9F;
	cursor: pointer;
	display: inline-block;
	border-radius: 2px;
	margin-top: 5px;
	color: #707070;
	font-size: 15px;
	text-align: center;
	background-color:rgba(0, 0, 0, 0);
}
/* 코디리스트 css */
#coordiListArea {
	float: left;
	width: 84%;
	height: 1455px;
	padding-left: 50px;
}

#coordiListNumArea {
	font-size: 18px;
	color: #707070;
	font-weight: bold;
	height: 59px;
}

#coordiListFilterArea {
	height: 40px;
	color: #707070;
	font-weight: medium;
	font-size: 18px;
}

#filterImg {
	display: inline-block;
	weight: 13px;
	height: 13px;
}

select::-ms-expand {
	display: none;
}

#filter {
	-o-appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: none;
	font-size: 18px;
	color: #707070;
	font-weight: medium;
}

#coordiListImgArea {
	
}
/* 코디이미지 이미지들어간후에 height 삭제 */
.coordiImgArea {
	border-radius: 2px;
	width: 240px;
	height: 400px;
	margin-right: 18px;
	margin-bottom: 30px;
	display: inline-block;
	position: relative;
	cursor: pointer;
	background-color:#707070;
}

.nickNameArea {
	position: absolute;
	width: 200px;
	bottom: 25px;
	left: 25px;
	height: 35px;
	text-align: left;
}

.profileArea {
	width: 35px;
	height: 35px;
	display: inline-block;
}

.nickName {
	position: relative;
	top: -10px;
	display: inline-block;
	font-size: 16px;
	color: white;
}

.likeScrapArea {
	position: absolute;
	top: 15px;
	right: 10px;
	width: 30px;
	height: 80px;
}

.like {
	width: 30px;
	height: 30px;
	margin-bottom: 20px;
	cursor: pointer;
}

.scrap {
	width: 30px;
	height: 30px;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div id="content">
		<div id="categoryBarArea">
			<div class="category" id="genderArea">
				<div class="categoryName">성별</div>

				<input type="checkbox" id="gender-box1" class="box" />
				<label for="gender-box1"></label><span class="name">여성</span><br> 
				<input type="checkbox" id="gender-box2" class="box" />
				<label for="gender-box2"></label><span class="name">남성</span><br> 
				<input type="checkbox" id="gender-box3" class="box" />
				<label for="gender-box3"></label><span class="name">공용</span><br>

			</div>
			<div class="category" id="seasonArea">
				<div class="categoryName">계절</div>
				<input type="checkbox" id="season-box1" class="box" /><label
					for="season-box1"></label><span class="name">봄</span><br> <input
					type="checkbox" id="season-box2" class="box" /><label
					for="season-box2"></label><span class="name">여름</span><br> <input
					type="checkbox" id="season-box3" class="box" /><label
					for="season-box3"></label><span class="name">가을</span><br> <input
					type="checkbox" id="season-box4" class="box" /><label
					for="season-box4"></label><span class="name">겨울</span><br>
			</div>
			<div class="category" id="tempArea">
				<div class="categoryName">기온</div>
				<div class="tempBox">4˚이하</div>
				<div class="tempBox">5˚~8˚</div>
				<div class="tempBox">9˚~11˚</div>
				<div class="tempBox">12˚~16˚</div>
				<div class="tempBox">17˚~19˚</div>
				<div class="tempBox">20˚~22˚</div>
				<div class="tempBox">23˚~27˚</div>
				<div class="tempBox">28˚이상</div>
			</div>
			<div class="category" id="itemArea">
				<div class="categoryName">카테고리 분류</div>
				<input type="checkbox" id="item-box1" class="box" /><label
					for="item-box1"></label><span class="name">블라우스</span><br> <input
					type="checkbox" id="item-box2" class="box" /><label
					for="item-box2"></label><span class="name">긴팔티</span><br> <input
					type="checkbox" id="item-box3" class="box" /><label
					for="item-box3"></label><span class="name">면바지</span><br> <input
					type="checkbox" id="item-box4" class="box" /><label
					for="item-box4"></label><span class="name">슬랙스</span><br>
			</div>
		</div>
		<div id="coordiListArea">
			<div id="coordiListNumArea">코디 1000개</div>
			<div id="coordiListFilterArea">
				<img id="filterImg" alt="" src="/resources/images/icon/filter.png">
				<select id="filter">
					<option>최신순</option>
					<option>최근 인기순</option>
					<option>역대 인기순</option>
					<option>팔로잉</option>
				</select>
			</div>
			<div id="coordiListImgArea">
				<div class="coordiImgArea">
					사진
					<div class="likeScrapArea">
						<img class="like" src="/resources/images/icon/heart.png"> <img
							class="scrap" src="/resources/images/icon/saved.png">
					</div>
					<div class="nickNameArea">

						<div class="profileArea">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg" /></a>
							</div>
						</div>
						<span class="nickName">닉네임</span>
					</div>
				</div>
				<div class="coordiImgArea">사진</div>
				<div class="coordiImgArea">사진</div>
				<div class="coordiImgArea">사진</div>
				<div class="coordiImgArea">사진</div>
			</div>
		</div>

	</div>
	<script>
		
		$('.like').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/heart_on.png") {
				$(this).attr('src', "/resources/images/icon/heart.png");
			} else {
				$(this).attr('src', "/resources/images/icon/heart_on.png");
			}

		});
		$('.scrap').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/saved_on.png") {
				$(this).attr('src', "/resources/images/icon/saved.png");
			} else {
				$(this).attr('src', "/resources/images/icon/saved_on.png");
			}

		});
		
		$('.tempBox').click(function(){
			var color=$(this).css("background-color");
			console.log(color);
			if(color==='rgba(0, 0, 0, 0)'){
				$(this).css('background-color','rgb(169,212,217)');
			}else{
				$(this).css('background-color','rgba(0, 0, 0, 0)');
				
			}
			
		})
	</script>
</body>
</html>