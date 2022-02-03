<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%-- jQuery 라이브러리 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>베스트</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/beststyle/best.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>  
<script src="/resources/common/common.js"></script>
</head>

<body>
	<div id="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
		<div id="content">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">이번주 베스트</li>
				<li class="tab-link" data-tab="tab-2">역대 베스트</li>
			</ul>
			<div id="tab-1" class="tab-content current">
				<span>2021.01.17 ~ 2012.01.23  기준</span>
				<div class="img-coordi-area">
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist29.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>1</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist1.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>2</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist2.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>3</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist3.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>4</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist10.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>5</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist5.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>6</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist6.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>7</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist7.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>8</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
				</div>
			</div>
	
	
			<div id="tab-2" class="tab-content">
				<div class="img-coordi-area">
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist31.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>1</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist2.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>2</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist19.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>3</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist20.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>4</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist32.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>5</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist29.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>6</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist28.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>7</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
					
					<div class="img-coordi-box">
						<img src="/resources/images/coordi/stylelist27.jpg">
						<div class="rank">
							<i class="fas fa-bookmark"></i>
							<span>8</span>
						</div>
						
						<div class="likeScrapArea">
							<img class="like" src="/resources/images/icon/heart_wf.png"> 
							<img class="scrap" src="/resources/images/icon/saved_wf.png">
						</div>
						
						<div class="box-nick">
							<div class="profile">
								<a href=""><img src="/resources/images/default/profile.jpg"/></a>
							</div>
							<span class="nickName">닉네임</span>
						</div>
					</div>
				</div>
			</div>

			<script>
				$(document).ready(function(){
					$("ul.tabs li").click(function() {
						var tabId = $(this).attr("data-tab");
		
						$("ul.tabs li").removeClass("current");
						$(".tab-content").removeClass("current");
		
						$(this).addClass("current");
						$("#" + tabId).addClass("current");
					})
		
				
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
			</script>
		</div>
	
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
</body>
</html>