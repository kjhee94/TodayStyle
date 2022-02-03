<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/coordiList.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="/resources/common/common.js"></script>
</head>

<body>
	<div id="wrap">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<div id="content">
			<div id="categoryBarArea">
				<div class="category" id="genderArea">
					<div class="categoryName">성별
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="gender-box1" class="box" />
							<label for="gender-box1">여성</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="gender-box2" class="box" />
							<label for="gender-box2">남성</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="gender-box3" class="box" />
							<label for="gender-box3">공용</label>
						</div>
					</div>
				</div>
				
				<div class="category" id="seasonArea">
					<div class="categoryName">계절
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="season-box1" class="box"/>
							<label for="season-box1">봄</label> 
						</div>
						<div class="one-check">
							<input type="checkbox" id="season-box2" class="box" />
							<label for="season-box2">여름</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="season-box3" class="box"/>
							<label for="season-box3">가을</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="season-box4" class="box"/>
							<label for="season-box4">겨울</label>
						</div>
					</div>
				</div>
				
				<div class="category" id="tempArea">
					<div class="categoryName">기온
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="tempBox">4˚이하</div>
						<div class="tempBox">5˚~8˚</div>
						<div class="tempBox">9˚~11˚</div>
						<div class="tempBox">12˚~16˚</div>
						<div class="tempBox">17˚~19˚</div>
						<div class="tempBox">20˚~22˚</div>
						<div class="tempBox">23˚~27˚</div>
						<div class="tempBox">28˚이상</div>
					</div>
				</div>
				<div class="category" id="itemArea">
					<div class="categoryName">카테고리 분류
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="item-box1" class="box" />
							<label for="item-box1">블라우스</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="item-box2" class="box" />
							<label for="item-box2">긴팔티</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="item-box3" class="box" />
							<label for="item-box3">면바지</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="item-box4" class="box" />
							<label for="item-box4">슬랙스</label>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- coordiListAreas -->
			<div id="coordiListArea">
				<div id="coordiListNumArea">코디 전체<span>1000개</span></div>
				<div class="list-top">
					<div id="coordiListFilterArea">
						<select id="filter">
							<option>최신순</option>
							<option>최근 인기순</option>
							<option>역대 인기순</option>
							<option>팔로잉</option>
						</select>
						<i class="fas fa-filter"></i>
					</div>
					<div class="box-search">
						<input class="search-style" type="text" name="keyword" placeholder="검색어를 입력하세요">
						<a href=""><i class="fas fa-search"></i></a>
					</div>
				</div>
				
			
				<div id="coordiListImgArea">
					<div class="grid-sizer"></div>
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist1.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist23.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist2.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist24.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist3.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist7.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist9.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist31.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist22.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist8.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist29.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist28.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
					<div class="coordiImgArea">
						<img class="coordiImg" src="/resources/images/coordi/stylelist27.jpg">
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
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
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
	
	<script>
		$('.categoryName').click(function(){
			$(this).next().slideToggle();
		});
	
		$('.like').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/heart_on.png") {
				$(this).attr('src', "/resources/images/icon/heart_wf.png");
			} else {
				$(this).attr('src', "/resources/images/icon/heart_on.png");
			}
		});
		$('.scrap').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/saved_on.png") {
				$(this).attr('src', "/resources/images/icon/saved_wf.png");
			} else {
				$(this).attr('src', "/resources/images/icon/saved_on.png");
			}
		});
		
		$('.tempBox').click(function(){
			var color=$(this).css("background-color");
			
			if(color==='rgba(0, 0, 0, 0)'){
				$('.tempBox').css('background-color','rgba(0, 0, 0, 0)');
				$(this).css('background-color','rgb(169,212,217)');
				$(this).css('color','#fff');
				$('.tempBox').not(this).css('color','#707070');
			}else{
				$(this).css('background-color','rgba(0, 0, 0, 0)');
				$(this).css('color','#707070');
			}
		});
	</script>
	
	<script>
		$('.coordiImg').hover(function(){
			$(this).css('transition','all 0.2s linear');
			$(this).css('transform','scale(1.05)');
		},function(){
			$(this).css('transition','all 0.2s linear');
			$(this).css('transform','scale(1)');
		})
	</script>
	
	<script>
		$('#coordiListImgArea').masonry({
			// set itemSelector so .grid-sizer is not used in layout
			itemSelector: '.coordiImgArea',
			// use element for option
			columnWidth: '.grid-sizer',
			percentPosition: true
		})
	</script>
</body>
</html>