<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/index.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/resources/common/common.js"></script>
<!-- Demo styles -->
<style>

</style>
</head>
<body>

	<div id="wrap">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<div id="content">
			<!-- 코디 부분(설명,온도,캐러샐,더보러가기까지) -->
			<div id="coordiArea">
				<div class="main-area">이번주 한파가 시작됩니다 한결 따뜻한 코디를 참고하세요.</div>
				<div class="sub-area">
					<span>서울특별시 은평구 갈현제2동</span>
					<span>-13도</span>
					<span>겨울</span>
				</div>
				
				<div id="coordiImgArea">
					<!-- Swiper -->
					<div class="swiper mySwiper coordiSwiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist29.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist3.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist27.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist28.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist1_2.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist2.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist10.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist31.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="coordiImg" src="/resources/images/coordi/stylelist23.jpg">
									<div class="nickNameArea">
										<div class="profile">
											<a href=""><img src="/resources/images/default/profile.jpg"/></a>
										</div>
										<span class="nickName">닉네임</span>
									</div>
								</a>
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
				<div class="box-btn"">
					<button class="btn-style-mint"><a>더 보러 가기</a></button>
				</div>
			</div>
			
			<div id="itItemArea">
				<div class="main-area">오늘의 인기 잇템</div>
				<div class="sub-area">이젠 공유할 수 있다. 나만 알고 싶은 잇-아이템</div>
				<div id="itItemImgArea">
					<!-- Swiper -->
					<div class="swiper mySwiper itemSwiper">
						<div class="swiper-wrapper">
						
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item1.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item3.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item6.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item8.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item11.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item12.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item5.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item4.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
							<div class="swiper-slide">
								<a href="">
									<img class="itItemImg" src="/resources/images/itItem/item7.jpg">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">카테고리</div>
										<div class="itemInfoTitle">제목</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<a href=""><img src="/resources/images/default/profile.jpg"/></a>
											</div>
											<span class="nickName">닉네임</span>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
				<div class="box-btn"">
					<button class="btn-style-mint"><a>더 보러 가기</a></button>
				</div>
			</div>
			
			<div id="rankingArea">
				<div class="main-area">인기 계정 랭킹</div>
				<div id="ranking">
					<div class="userRank">
						<div class="rank">1</div>
						<div class="rankProfile">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="rankNickName">닉네임 ·</span>
							<span class="rankFollowing">팔로잉 <span>468</span></span>
						</div>
					</div>
					<div class="userRank">
						<div class="rank">2</div>
						<div class="rankProfile">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="rankNickName">닉네임 ·</span>
							<span class="rankFollowing">팔로잉 <span>468</span></span>
						</div>
					</div>
					<div class="userRank">
						<div class="rank">3</div>
						<div class="rankProfile">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="rankNickName">닉네임 ·</span>
							<span class="rankFollowing">팔로잉 <span>468</span></span>
						</div>
					</div>
					<div class="userRank">
						<div class="rank">4</div>
						<div class="rankProfile">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="rankNickName">닉네임 ·</span>
							<span class="rankFollowing">팔로잉 <span>468</span></span>
						</div>
					</div>
				</div>
				<div id="rankingImgArea">
					<div class="rankCoordiImg"><img alt="" src="/resources/images/coordi/stylelist1.jpg"></div>
					<div class="rankCoordiImg"><img alt="" src="/resources/images/coordi/stylelist2.jpg"></div>
					<div class="rankCoordiImg"><img alt="" src="/resources/images/coordi/stylelist3.jpg"></div>
					<div class="rankCoordiImg"><img alt="" src="/resources/images/coordi/stylelist27.jpg"></div>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
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
		//$(".swiper-slide").hover(function() {
		//	$(this).find(".itemInfoArea").slideToggle(200);
		//});
		
		$(".swiper-slide").hover(function() {
			$(this).find(".itemInfoArea").fadeIn(200);
		}, function() {
			$(this).find(".itemInfoArea").fadeOut(200);
		});
	</script>
	
</body>
</html>