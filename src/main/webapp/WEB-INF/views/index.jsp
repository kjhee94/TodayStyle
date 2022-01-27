<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- Demo styles -->
<style>

 #content {
      width: 100%;
      overflow: hidden;
   }

   .swiper {
      width: 70%;
      height: 630px;
      overflow: visible;
   }

   .swiper-slide {
      width : 30%;
      height: 100%;
      background-color: gray;
      
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
   }
       
   .swiper-button-next,
   .swiper-button-prev {
      padding: 30px;
      color : #fff;
   }
   .swiper-button-prev {
      left: -20%;
   }
   .swiper-button-next {
      right: -20%;
   }
   
   .swiper-slide a {
       display: block;
       width: 100%;
       height: 100%;
       object-fit: cover;
   }



/* 코디부분 css */
#coordiArea {
	
	width: 100%;
	height: 933px;
}

#coordiMentArea {
	width: 70%;
	height: 41px;
	font-size: 30px;
	margin-top: 82px;
	margin-left:15%;
}

#coordiTempArea {
	width: 70%;
	height: 21px;
	font-size: 16px;
	margin-top: 17px;
	margin-left:15%;
}
#coordiImgArea{
	width: 100%;
	height: 630px;
	margin-top: 17px;
}


/* .swiper {
	width: 100%;
	
}

.swiper-slide {
	width: 428px;
	height: 630px;
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
} 
*/
.coordiImg{
	height: 630px;
}
.itItemImg{
	height: 428px;
}

.nickNameArea{
	position:absolute;
	width:200px;
	bottom:25px;
	left:25px;
	height:50px;
	text-align:left;
}

.profileArea{
	width:50px;
	height:50px;
	display:inline-block;
	
}

.nickName{
	position:relative;
	top:-15px;
	display:inline-block;
	font-size:20px;
	color:white;
}

/* .swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
} */
#coordiBtnArea{
	width: 70%;
	height: 60px;
	margin-top: 40px;
	text-align: center;
	margin-left:15%;
}

/* 잇템 css */
#itItemArea{
	width: 100%;
	height: 753px;
}
#itItemMentArea{
	width: 70%;
	height: 41px;
	font-size: 30px;
	margin-top:102px;
	margin-left:15%;
}
#itItemSubMentArea{
	width: 70%;
	height: 21px;
	font-size: 16px;
	margin-top: 20px;
	margin-left:15%;
}
#itItemImgArea{
	width: 100%;
	height: 428px;
	margin-top: 40px;
	text-align: center;
}

#itItemBtnArea{
	width: 70%;
	height: 60px;
	margin-top: 40px;
	text-align: center;
	margin-left:15%;
}

.itemInfoArea{
	position:absolute;
	bottom:0px;
	width:100%;
	height: 159px;
	background-color:#ffffff;
	opacity:0.73;
}
.itemInfoCategory{
	margin-top:28px;
	width:95%;
	height:18px;
	font-size:14px;
	color:#707070;
	text-align:left;
	margin-left:5%;
}
.itemInfoName{
	margin-top:2px;
	width:95%;
	height:21px;
	font-size:16px;
	color:#707070;
	text-align:left;
	margin-left:5%;
}
.itemInfoUserNameArea{
	margin-top:12px;
	width:95%;
	height:41px;
	font-size:16px;
	color:#707070;
	text-align:left;
	margin-left:5%;
}
.itemInfoProfileArea{
	width:41px;
	height:41px;
	display:inline-block;
}
.itemInfonickName{
	position:relative;
	top:-15px;
	display:inline-block;
	font-size:16px;
	color:#707070;
	text-align:left;
}

/* 랭킹css */
#rankingArea{
	width: 100%;
	height: 696px;
	
}
#rankingMentArea{
	width: 70%;
	height: 41px;
	font-size: 30px;
	margin-top:102px;
	margin-left:15%;
	
}
#rankingImgArea{
	width: 70%;
	height: 362px;
	margin-top: 56px;
	margin-left:15%;
	
}
#ranking{
	width:27%;
	height:100%;
	float:left;
}
#rankingImg{
	width:73%;
	float:left;
	height:100%;
}
.userRank{
	width:100%;
	height:90px;
	border-top:#C8C8C8 1px solid;
	border-bottom:#C8C8C8 1px solid;
}
.rank{
	width:30px;
	height:30px;
	position:relative;
	top:0px;
	left:0px;
	background-color:#A9D4D9;
	color:white;
	
}
.rankProfile{
	width:246px;
	height:50px;
	position: relative;
	left: 40px;
	top:-10px;
}
.rankProfileImg{
	width:50px;
	height:50px;
	display:inline-block;
}
.rankNickName{
	position:relative;
	top:-20px;
	display:inline-block;
	font-size:16px;
	color:#707070;
	text-align:left;
}
.rankFollowing{
	position:relative;
	top:-20px;
	display:inline-block;
	font-size:16px;
	color:#707070;
	text-align:left;
}
.rankCoordiImg{
	width:20%;
	height:337px;
	display:inline-block;
	margin-left: 19px;
	border:1px solid gray;
}

/* div {
	border: 1px black solid;
	box-sizing: border-box;
	
} */
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="content" style="">
		<!-- 코디 부분(설명,온도,캐러샐,더보러가기까지) -->
		<div id="coordiArea">
			<div id="coordiMentArea">이번주 한파가 시작됩니다 한결 따뜻한 코디를 참고하세요</div>
			<div id="coordiTempArea">서울특별시 은평구 갈현제2동 | -13도 | 겨울</div>
			<div id="coordiImgArea">
				<!-- Swiper -->
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide coordiImg">Slide 1
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 2
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 3
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 4
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 5
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 6
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 7
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 8
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
						<div class="swiper-slide coordiImg">Slide 9
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a><img src="/resources/images/default/profile.jpg"/></a>
									</div>
								</div>
								<span class="nickName">닉네임</span>
							</div>
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div id="coordiBtnArea"><button class="btn-style-mint"><a>더 보러 가기</a></button></div>
		</div>
		
		<div id="itItemArea">
			<div id="itItemMentArea">오늘의 인기 잇템</div>
			<div id="itItemSubMentArea">이젠 공유할 수 있다. 나만 알고 싶은 잇-아이템</div>
			<div id="itItemImgArea">
				<!-- Swiper -->
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide itItemImg">Slide 1
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 2
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 3
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 4
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 5
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 6
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 7
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 8
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
						<div class="swiper-slide itItemImg">Slide 9
							<div class="itemInfoArea" style="visibility:hidden;">
								<div class="itemInfoCategory">카테고리</div>
								<div class="itemInfoName">옷이름</div>
								<div class="itemInfoUserNameArea">
									<div class="itemInfoProfileArea">
										<div class="profile">
											<a><img src="/resources/images/default/profile.jpg"/></a>
										</div>
									</div>
									<span class="itemInfonickName">닉네임</span>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div id="itItemBtnArea"><button class="btn-style-mint"><a>더 보러 가기</a></button></div>
		</div>
		<div id="rankingArea">
			<div id="rankingMentArea">인기 계정 랭킹</div>
			<div id="rankingImgArea">
				<div id="ranking">
					<div class="userRank">
						<div class="rank">1</div>
						<div class="rankProfile">
							<div class="rankProfileImg">
								<div class="profile">
									<a><img src="/resources/images/default/profile.jpg"/></a>
								</div>
							</div>
							<span class="rankNickName">닉네임</span>
							<span class="rankFollowing">팔로잉</span>
						</div>
					</div>
					<div class="userRank">
						<div class="rank">2</div>
						<div class="rankProfile">
							<div class="rankProfileImg">
								<div class="profile">
									<a><img src="/resources/images/default/profile.jpg"/></a>
								</div>
							</div>
							<span class="rankNickName">닉네임</span>
							<span class="rankFollowing">팔로잉</span>
						</div>
					</div>
					<div class="userRank">
						<div class="rank">3</div>
						<div class="rankProfile">
							<div class="rankProfileImg">
								<div class="profile">
									<a><img src="/resources/images/default/profile.jpg"/></a>
								</div>
							</div>
							<span class="rankNickName">닉네임</span>
							<span class="rankFollowing">팔로잉</span>
						</div>
					</div>
					<div class="userRank">
						<div class="rank">4</div>
						<div class="rankProfile">
							<div class="rankProfileImg">
								<div class="profile">
									<a><img src="/resources/images/default/profile.jpg"/></a>
								</div>
							</div>
							<span class="rankNickName">닉네임</span>
							<span class="rankFollowing">팔로잉</span>
						</div>
					</div>
				</div>
				<div id="rankingImg">
					<div class="rankCoordiImg"></div>
					<div class="rankCoordiImg"></div>
					<div class="rankCoordiImg"></div>
					<div class="rankCoordiImg"></div>
				</div>
		</div>
	</div>
	<!-- Swiper JS -->
			<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

			<!-- Initialize Swiper -->
			<script>
				var swiper = new Swiper(".mySwiper", {
					slidesPerView : 3,
					spaceBetween : 30,
					slidesPerGroup : 3,
					loop : true,
					loopFillGroupWithBlank : true,
					navigation : {
						nextEl : ".swiper-button-next",
						prevEl : ".swiper-button-prev"
					}
				});
			</script>
			<script>
				$('.itItemImg').hover(function(){
					$(this).children().css("visibility","visible");
				},function(){
					$(this).children().css("visibility","hidden");
				});
				
			</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>