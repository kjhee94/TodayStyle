<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/index.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/resources/common/common.js"></script>
</head>

<body>
	<script>
		            if(navigator.geolocation) {
		                navigator.geolocation.getCurrentPosition(
		                    function successCallback(position) {
		                        var now = new Date(position.timestamp);// 현재 시각
		                        var latitude = position.coords.latitude;    // 위도
		                        var longitude = position.coords.longitude;   // 경도
		                        var acc = position.coords.accuracy;    // 정확도
		                        var year = now.getFullYear();
		                        var month = now.getMonth() + 1;
		                        if(month<10) month = '0' + month;
		                        var date = now.getDate();
		                        if(date<10) date = '0' + date;
								
								var hour = now.getHours();
							    if(hour<10) hour = '0' + hour;
							    
								
							    var day=year+month+date;
								var time=hour-1+"00";
		                       /*
		                        alert("현재 시간: " + now.toDateString() + "\n"
		                            + "현재 위치(위도: " + latitude + "경도: " + longitude + "\n"
		                            + "정확도: " + acc);
		                        
		                        */
		                        getWeather(latitude,longitude);
		                        
		            			function getWeather(lat,lon){
		                        	fetch('https://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+lon+'&appid=d114b8984a0f6d1a125c960c72035804&units=metric'
		                        			)
		                        			.then(function(response){
		                        				return response.json();
		                        			})
		                        			.then(function(json){
		                        				const temparature = json.main.temp;
		                        				const place = json.name;
		                        				$('#temp').text(Math.round(temparature)+" ˚");
		                        			});
		                        }
		            			
		            			
		                        $.ajax({
		    	                	url:"/rest/setSession.do",
		    	                	data:{latitude:latitude,longitude:longitude},
		    	                	type:"post",
		    	                	success:function (result){
		    	                		$('#address').text(result);
		    	                	},
		    	                	error:function(){
		    	                		console.log("통신실패");
		    	                	}
		    	                	});
		                      
		                    }, function errorCallback() {
		                        alert("실패");
		                    }, options = {
		                        enableHighAccuracy: true,
		                        timeout: 1500,
		                        maximumAge: 5000
		                    }
		                    
		                )
		            } else {
		                alert("Geolocation API를 지원하지 않습니다.");
		            }
		        
   				
		       </script>
	<div id="wrap">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<div id="content">
			<!-- 코디 부분(설명,온도,캐러샐,더보러가기까지) -->
			<div id="coordiArea">
				<div class="main-area">이번주 한파가 시작됩니다 한결 따뜻한 코디를 참고하세요.</div>
				<div class="sub-area">
					<span id="address">서울특별시 은평구 갈현제2동</span>
					<span id="temp">-13</span>
					<span id="season">겨울</span>
					
					
				</div>
				
				<div id="coordiImgArea">
					<!-- Swiper -->
					<div class="swiper mySwiper coordiSwiper">
						<div class="swiper-wrapper">
							<c:forEach items="${requestScope.map.get('coordiList')}" var="coordi" varStatus="i" end="8">
							<div class="swiper-slide">
								<a href="/coordi/coordiPost.do?coordiNo=${coordi.coordiNo}">
									<img class="coordiImg" src="${coordi.filePath}">
									<div class="nickNameArea">
										<div class="profile">
											
									<c:choose>
                                    	<c:when test="${coordi.profileFilePath!=null}">
                                       		<a href="/myPage/userPage.do?userId=${coordi.userId }"><img src="${coordi.profileFilePath}" id="profileImg"></a>
	                                   	</c:when>
	                                    <c:otherwise>
	                                        <a href="/myPage/userPage.do?userId=${coordi.userId }"><img src="/resources/images/default/profile.jpg" id="profileImg"></a>
	                                   	 </c:otherwise>
	                               		</c:choose>
										</div>
										<span class="nickName">${coordi.nickName}</span>
									</div>
								</a>
							</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
				<div class="box-btn"">
					<button class="btn-style-mint"><a href="/coordi/coordiList.do">더 보러 가기</a></button>
				</div>
			</div>
			
			<div id="itItemArea">
				<div class="main-area">오늘의 인기 잇템</div>
				<div class="sub-area">이젠 공유할 수 있다. 나만 알고 싶은 잇-아이템</div>
				<div id="itItemImgArea">
					<!-- Swiper -->
					<div class="swiper mySwiper itemSwiper">
						<div class="swiper-wrapper">
							<c:forEach items="${requestScope.map.get('itItemList')}" var="itItem" varStatus="i" end="8">
							<div class="swiper-slide">
								<a href="/coordi/ItPost.do?itItemNo=${itItem.itItemNo }">
									<img class="itItemImg" src="${itItem.filePath}">
									<div class="itemInfoArea">
										<div class="itemInfoCategory">${itItem.itemName}</div>
										<div class="itemInfoTitle">${itItem.itItemTitle}</div>
										<div class="itemInfoNickNameArea">
											<div class="profile">
												<c:choose>
			                                    	<c:when test="${itItem.profileFilePath!=null}">
			                                       		<a href="/myPage/userPage.do?userId=${itItem.userId }"><img src="${itItem.profileFilePath}" id="profileImg"></a>
				                                   	</c:when>
				                                    <c:otherwise>
				                                        <a href="/myPage/userPage.do?userId=${itItem.userId }"><img src="/resources/images/default/profile.jpg" id="profileImg"></a>
				                                   	 </c:otherwise>
				                               	</c:choose>
											</div>
											<span class="nickName">${itItem.nickName}</span>
										</div>
									</div>
								</a>
							</div>
							</c:forEach>
							
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
				<div class="box-btn"">
					<button class="btn-style-mint"><a href="/itItem/itItemList.do">더 보러 가기</a></button>
				</div>
			</div>
			
			<div id="rankingArea">
				<div class="main-area">인기 계정 랭킹</div>
				<div id="ranking">
					<c:forEach items="${map.get('topFollowList') }" var="member" varStatus="i">
					<div class="userRank" id="${member.userId }" style="cursor:pointer;">
						<div class="rank" id="${i.count%4 }">${i.count }</div>
						<div class="rankProfile">
							<div class="profile">
								<c:choose>
			                      <c:when test="${member.filePath!=null}">
			                         <a href="/myPage/userPage.do?userId=${member.userId }"><img src="${member.filePath}" id="profileImg"></a>
				                  </c:when>
				                     <c:otherwise>
				                       <a href="/myPage/userPage.do?userId=${member.userId }"><img src="/resources/images/default/profile.jpg" id="profileImg"></a>
				                    </c:otherwise>
				                </c:choose>
							</div>
							<span class="rankNickName">${member.nickname } ·</span>
							<span class="rankFollowing">팔로잉 <span>${member.follow }</span></span>
						</div>
					</div>
					</c:forEach>
					
				</div>
				<div id="rankingImgArea">
					
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
	<!-- Initialize Swiper -->
	<script>
		var index=0;
		var timer =setInterval(function(){
			index++;
			var id=index%4;
			var userId=$('#'+id).parent().attr('id');
			sendRequest(userId);
			$('.userRank').css('background-color','rgba(0,0,0,0)');
			$('#'+id).parent().css('background-color','rgba(169,212,217,0.15)');
		},3000);	
		function sendRequest(userId){
			$.ajax({
				url:"/coordi/topCoordiList.do",
            	data:{userId:userId},
            	type:"get",
            	success:function (result){
            		$('#rankingImgArea').html(result);
            	},
            	error:function(){
            		console.log("통신실패");
			}
		})
		}
		
		$('.userRank').click(function(){
			$('.userRank').css('background-color','rgba(0,0,0,0)');
			var userId=$(this).attr('id');
			clearInterval(timer);
			$(this).css('background-color','rgba(169,212,217,0.15)');
			$.ajax({
				url:"/coordi/topCoordiList.do",
            	data:{userId:userId},
            	type:"get",
            	success:function (result){
            		$('#rankingImgArea').html(result);
            	},
            	error:function(){
            		console.log("통신실패");
			}
		})
		});
	</script>
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