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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/index.css?after">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- Demo styles -->
<style>

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div id="content" style="">
		<!-- 코디 부분(설명,온도,캐러샐,더보러가기까지) -->
		<div id="coordiArea">
			<div id="coordiMentArea">이번주 한파가 시작됩니다 한결 따뜻한 코디를 참고하세요.</div>
			<div id="coordiTempArea">서울특별시 은평구 갈현제2동 | -13도 | 겨울</div>
			<div id="coordiImgArea">
				<!-- Swiper -->
				<div class="coordiSwiper mySwiper">
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
				<div class="itemSwiper mySwiper">
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