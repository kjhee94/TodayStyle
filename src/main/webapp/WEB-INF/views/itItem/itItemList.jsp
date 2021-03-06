<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지? - 오늘의 잇템</title>
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/itItem/itItemList.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/resources/common/common.js"></script>
</head>

<body>

	<div id="wrap">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<div id="content">
			<div id="categoryBarArea">
				<div class="category" id="topItemArea">
					<div class="categoryName">상의
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="top-box1" class="box" />
							<label for="top-box1">블라우스</label> 
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box2" class="box" />
							<label for="top-box2">민소매</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box3" class="box" />
							<label for="top-box3">반팔</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box4" class="box" />
							<label for="top-box4">셔츠</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box5" class="box" />
							<label for="top-box5">긴팔</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box6" class="box" />
							<label for="top-box6">맨투맨</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box7" class="box" />
							<label for="top-box7">후드</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box8" class="box" />
							<label for="top-box8">니트</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box9" class="box" />
							<label for="top-box9">히트텍</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box10" class="box" />
							<label for="top-box10">원피스</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="top-box11" class="box" />
							<label for="top-box11">조끼</label>
						</div>
					</div>
				</div>
				<div class="category" id="bottomItemArea">
					<div class="categoryName">하의
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="bot-box1" class="box" />
							<label for="bot-box1">반바지</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box2" class="box" />
							<label for="bot-box2">짧은치마</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box3" class="box" />
							<label for="bot-box3">긴치마</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box4" class="box" />
							<label for="bot-box4">슬랙스</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box5" class="box" />
							<label for="bot-box5">기모바지</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box6" class="box" />
							<label for="bot-box6">스타킹</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box7" class="box" />
							<label for="bot-box7">레깅스</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box8" class="box" />
							<label for="bot-box8">일자바지</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box9" class="box" />
							<label for="bot-box9">와이드팬츠</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box10" class="box" />
							<label for="bot-box10">스키니</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box11" class="box" />
							<label for="bot-box11">부츠컷</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box12" class="box" />
							<label for="bot-box12">조거</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box13" class="box" />
							<label for="bot-box13">치마바지</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box14" class="box" />
							<label for="bot-box14">멜빵</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="bot-box15" class="box" />
							<label for="bot-box15">미니스커트</label>
						</div>
					</div>
				</div>
				<div class="category" id="outterItemArea">
					<div class="categoryName">아우터
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="out-box1" class="box" />
							<label for="out-box1">자켓</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box2" class="box" />
							<label for="out-box2">가디건</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box3" class="box" />
							<label for="out-box3">야상</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box4" class="box" />
							<label for="out-box4">트렌치코트</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box5" class="box" />
							<label for="out-box5">패딩</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box6" class="box" />
							<label for="out-box6">코트</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box7" class="box" />
							<label for="out-box7">바람막이</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box8" class="box" />
							<label for="out-box8">플리스</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="out-box9" class="box" />
							<label for="out-box9">집업</label>
						</div>
					</div>
				</div>
				<div class="category" id="AccItemArea">
					<div class="categoryName">악세서리
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="acc-box1" class="box" />
							<label for="acc-box1">장갑</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box2" class="box" />
							<label for="acc-box2">목도리</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box3" class="box" />
							<label for="acc-box3">모자</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box4" class="box" />
							<label for="acc-box4">양말</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box5" class="box" />
							<label for="acc-box5">벨트</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box6" class="box" />
							<label for="acc-box6">시계</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box7" class="box" />
							<label for="acc-box7">안경</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box8" class="box" />
							<label for="acc-box8">가방</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box9" class="box" />
							<label for="acc-box9">귀걸이</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box10" class="box" />
							<label for="acc-box10">목걸이</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box11" class="box" />
							<label for="acc-box11">팔찌</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box12" class="box" />
							<label for="acc-box12">반지</label>
						</div>
						<div class="one-check">
							<input type="checkbox" id="acc-box13" class="box" />
							<label for="acc-box13">발찌</label>
						</div>
					</div>
				</div>
				<div class="category" id="shoesItemArea">
					<div class="categoryName">신발
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" id="shoes-box1" class="box" />
							<label for="shoes-box1">신발</label>
						</div>
					</div>
				</div>
			</div>
			<script>
			var itemArray=new Array();
			var item;
				$('.box').off().on('click',function(){
					if($(this).prop("checked")==true){
						itemArray.push($(this).next().text());
						item=itemArray.join("/");
					}else{
						for(var i = 0; i < itemArray.length; i++) {
							  if(itemArray[i] === $(this).next().text())  {
								  itemArray.splice(i, 1);
								
							  }
							}
						item=itemArray.join("/");
					}
					$.ajax({
						url:"/itItem/categoryItItemList.do",
	                	data:{item:item,filter:filter},
	                	type:"get",
	                	success:function (result){
	                		$('#itItemListArea').html(result);
	                	},
	                	error:function(){
	                		console.log("통신실패");
	                	}
					
					});
				
				});
			</script>
			
			<div id="itItemListArea">
				<div id="itItemListNumArea">잇템 전체 <span>${map.get('itItemList').size()}개</span></div>
				<div class="list-top">
					<div id="itItemListFilterArea">
						<select id="filter">
							<option value="최신순">최신순</option>
							<option value="좋아요순">좋아요순</option>
							<option value="스크랩순">스크랩순</option>
						</select>
						<i class="fas fa-filter"></i>
					</div>
					<script>
					var filter="최신순";
						$('#filter').change(function(){
							var filter=$('#filter option:selected').text();
							$.ajax({
								url:"/itItem/categoryItItemList.do",
	    	                	data:{item:item,filter:filter,keyword:keyword},
	    	                	type:"get",
	    	                	success:function (result){
			                		$('#itItemListArea').html(result);
			                	},
	    	                	error:function(){
	    	                		console.log("통신실패");
	    	                	}
								
							});
							
						})
					</script>
					<div class="box-search">
							<input class="search-style" type="text" name="keyword" placeholder="해시태그를 입력하세요" value="${map.get('hashTag')}">
							<button id="searchBtn" type="button" ><i class="fas fa-search" style="cursor:pointer;"></i></button>
					</div>
				</div>
				<script>
				var keyword=$('.search-style').val();
					$('#searchBtn').click(function(){
						keyword =$('.search-style').val();
						$.ajax({
							url:"/itItem/categoryItItemList.do",
    	                	data:{item:item,filter:filter,keyword:keyword},
    	                	type:"get",
    	                	success:function (result){
		                		$('#itItemListArea').html(result);
		                	},
    	                	error:function(){
    	                		console.log("통신실패");
    	                	}
							
						});
					})
				</script>
				
				<div id="itItemImgArea">
				<c:forEach items="${map.get('itItemList') }" var="itItem" varStatus="i">
					<div class="itItemImgWrap">
						
							<div class="itItemImgArea">
								<a href="/coordi/ItPost.do?itItemNo=${itItem.itItemNo }">
								<img class="itItemImg" src="${itItem.filePath}">
								</a>
								<div id="${itItem.itItemNo}" class="likeScrapArea">
									<img class="like" src="/resources/images/icon/heart_w.png"> 
									<img class="scrap" src="/resources/images/icon/saved_w.png">
								</div>
							</div>
							<div class="itItemInfoArea">
								<div class="itItemInfoCategory"><span>${itItem.itemName}</span><span>${itItem.itItemName }</span></div>
								<div class="itItemInfoTitle">${itItem.itItemTitle }</div>
								<div class="nickNameArea">
									<div class="profileArea">
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
									</div>
									<span class="nickName">${itItem.nickName }</span>
								</div>
							</div>
						
					</div>
				</c:forEach>
					
				
				</div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
	<script>
		var likeList=new Array();
		var scrapList=new Array();
		<c:forEach items="${requestScope.map.get('likeList')}" var="itItemNo" varStatus="i">
			likeList.push(${itItemNo});
		</c:forEach>
		for(var i=0;i<likeList.length;i++){
			$('#'+likeList[i]).children().eq(0).attr("src","/resources/images/icon/heart_on.png");
			
		};
		<c:forEach items="${requestScope.map.get('scrapList')}" var="itItemNo" varStatus="i">
		scrapList.push(${itItemNo});
		</c:forEach>
		for(var i=0;i<scrapList.length;i++){
			$('#'+scrapList[i]).children().eq(1).attr("src","/resources/images/icon/saved_on.png");
			
		};
	</script>
	<script>
		$('.categoryName').off('click').on('click',function(){
			if($(this).next().css('display')=='none'){
				$(this).next().slideDown();
			}else{
				$(this).next().slideUp();
			}
			
		})

		$('.like').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/heart_on.png") {
				var itItemNo=$(this).parent().attr('id');
				console.log(itItemNo);
				$(this).attr('src', "/resources/images/icon/heart_wf.png");
				$.ajax({
					url:"/itItem/unlikeItItem.do",
                	data:{itItemNo:itItemNo},
                	type:"get",
                	success:function (){
                		
                	},
                	error:function(){
                		console.log("통신실패");
                	}
					
				});
			} else {
				var itItemNo=$(this).parent().attr('id');			
				$(this).attr('src', "/resources/images/icon/heart_on.png");
				$.ajax({
					url:"/itItem/likeItItem.do",
                	data:{itItemNo:itItemNo},
                	type:"get",
                	success:function (){
                		                	},
                	error:function(){
                		location.replace('/member/loginPage.do');
                	}
					
				});
			}
		});
		$('.scrap').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/saved_on.png") {
				var itItemNo=$(this).parent().attr('id');
				$(this).attr('src', "/resources/images/icon/saved_wf.png");
				$.ajax({
					url:"/itItem/unscrapItItem.do",
                	data:{itItemNo:itItemNo},
                	type:"get",
                	success:function (){
                		
                	},
                	error:function(){
                		console.log("통신실패");
                	}
					
				});
			} else {
				var itItemNo=$(this).parent().attr('id');
				$(this).attr('src', "/resources/images/icon/saved_on.png");
				$.ajax({
					url:"/itItem/scrapItItem.do",
                	data:{itItemNo:itItemNo},
                	type:"get",
                	success:function (){
                		
                	},
                	error:function(){
                		
                		location.replace('/member/loginPage.do');
                	}
					
				});
			}
		});
		
	</script>
	<script>
		$('.itItemImg').hover(function(){
			
			$(this).css('transition','all 0.2s linear');
			$(this).css('transform','scale(1.05)');
			
		},function(){
			$(this).css('transition','all 0.2s linear');
			$(this).css('transform','scale(1.0)');
		})
	</script>
</body>
</html>