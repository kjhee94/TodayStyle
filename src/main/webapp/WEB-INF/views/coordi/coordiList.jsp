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
<link rel="stylesheet" href="/resources/css/coordi/coordiList.css">
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
							<input type="checkbox" class="gender" id="gender-box1" class="box" />
							<label for="gender-box1">여성</label>
						</div>
						<div class="one-check">
							<input type="checkbox" class="gender"  id="gender-box2" class="box" />
							<label for="gender-box2">남성</label>
						</div>
						<div class="one-check">
							<input type="checkbox" class="gender" id="gender-box3" class="box" />
							<label for="gender-box3">공용</label>
						</div>
					</div>
					<script>
					
					
					</script>
				</div>
				
				<div class="category" id="seasonArea">
					<div class="categoryName">계절
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" class="season" id="season-box1" class="box"/>
							<label for="season-box1">봄</label> 
						</div>
						<div class="one-check">
							<input type="checkbox" class="season" id="season-box2" class="box" />
							<label for="season-box2">여름</label>
						</div>
						<div class="one-check">
							<input type="checkbox" class="season" id="season-box3" class="box"/>
							<label for="season-box3">가을</label>
						</div>
						<div class="one-check">
							<input type="checkbox" class="season" id="season-box4" class="box"/>
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
						<div class="tempBox">5˚-8˚</div>
						<div class="tempBox">9˚-11˚</div>
						<div class="tempBox">12˚-16˚</div>
						<div class="tempBox">17˚-19˚</div>
						<div class="tempBox">20˚-22˚</div>
						<div class="tempBox">23˚-27˚</div>
						<div class="tempBox">28˚이상</div>
					</div>
					
				</div>
				<script>
					$('.tempBox').click(function(){
						var temp=$(this).text();
						console.log(temp);
						switch (temp) {
						case "4˚이하" : 
							$('#item-box1').next().text("패딩"); 
							$('#item-box2').next().text("기모바지"); 
							$('#item-box3').next().text("목도리"); 
							$('#item-box4').next().text("장갑"); 							
							break;
						case "5˚-8˚" : 
							$('#item-box1').next().text("코트"); 
							$('#item-box2').next().text("히트텍"); 
							$('#item-box3').next().text("긴치마"); 
							$('#item-box4').next().text("기모바지"); 							
							break; 
						case "9˚-11˚" : 
							$('#item-box1').next().text("트렌치코트"); 
							$('#item-box2').next().text("야상"); 
							$('#item-box3').next().text("스타킹"); 
							$('#item-box4').next().text("집업"); 							
							break;
						case "12˚-16˚" : 
							$('#item-box1').next().text("자켓"); 
							$('#item-box2').next().text("가디건"); 
							$('#item-box3').next().text("플리스"); 
							$('#item-box4').next().text("조끼"); 								
							break;
						case "17˚-19˚" : 
							$('#item-box1').next().text("니트"); 
							$('#item-box2').next().text("맨투맨"); 
							$('#item-box3').next().text("후드"); 
							$('#item-box4').next().text("바람막이"); 	 							
							break;
						case "20˚-22˚" : 
							$('#item-box1').next().text("블라우스"); 
							$('#item-box2').next().text("긴팔"); 
							$('#item-box3').next().text("슬랙스"); 
							$('#item-box4').next().text("셔츠"); 							
							break;
						case "23˚-27˚" : 
							$('#item-box1').next().text("반팔"); 
							$('#item-box2').next().text("셔츠"); 
							$('#item-box3').next().text("반바지"); 
							$('#item-box4').next().text("미디스커트"); 							
							break;
						default:
							$('#item-box1').next().text("민소매"); 
							$('#item-box2').next().text("반팔"); 
							$('#item-box3').next().text("반바지"); 
							$('#item-box4').next().text("짧은바지"); 							
							break;
							
						}
						
					});
						
					
				</script>
				<div class="category" id="itemArea">
					<div class="categoryName">카테고리 분류
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="categoryContent">
						<div class="one-check">
							<input type="checkbox" class="items" id="item-box1" class="box" />
							<label for="item-box1">블라우스</label>
						</div>
						<div class="one-check">
							<input type="checkbox" class="items" id="item-box2" class="box" />
							<label for="item-box2">긴팔티</label>
						</div>
						<div class="one-check">
							<input type="checkbox" class="items" id="item-box3" class="box" />
							<label for="item-box3">면바지</label>
						</div>
						<div class="one-check">
							<input type="checkbox" class="items" id="item-box4" class="box" />
							<label for="item-box4">슬랙스</label>
						</div>
					</div>
				</div>
			</div>
			<script>
						var genders= new Array();
						var seasons= new Array();
						var gender;
						var season;
						var temp;
						var items=new Array();
						var item;
						$('.items').click(function(){
							if($(this).prop("checked")==true){
								items.push($(this).next().text());
								item=items.join("/");
							}else{
								for(var i = 0; i < items.length; i++) {
									  if(items[i] === $(this).next().text())  {
										  items.splice(i, 1);
										
									  }
									}
								item=items.join("/");
							}
							
							
							$.ajax({
			                	url:"/coordi/categoryCoordiList.do",
			                	data:{item:item,temp:temp,gender:gender,season:season},
			                	type:"get",
			                	success:function (result){
			                		$('#coordiListArea').html(result);
			                	},
			                	error:function(){
			                		console.log("통신실패");
			                	}
			                });
						});
						
						$('.tempBox').click(function(){
							if(temp!=$(this).text()){
								temp=$(this).text();
							}else{
								temp="";
							}
							$('.items').prop("checked",false);
							item="";
							$.ajax({
			                	url:"/coordi/categoryCoordiList.do",
			                	data:{item:item,temp:temp,gender:gender,season:season},
			                	type:"get",
			                	success:function (result){
			                		$('#coordiListArea').html(result);
			                	},
			                	error:function(){
			                		console.log("통신실패");
			                	}
			                });
						});
						
						$('.gender').click(function(){
							
							if($(this).prop("checked")==true){
								genders.push($(this).next().text());
								gender=genders.join("/");
							}else{
								for(var i = 0; i < genders.length; i++) {
									  if(genders[i] === $(this).next().text())  {
										  genders.splice(i, 1);
										
									  }
									}
								gender=genders.join("/");
							}
							
							
							$.ajax({
			                	url:"/coordi/categoryCoordiList.do",
			                	data:{item:item,temp:temp,gender:gender,season:season},
			                	type:"get",
			                	success:function (result){
			                		$('#coordiListArea').html(result);
			                	},
			                	error:function(){
			                		console.log("통신실패");
			                	}
			                });
						});
							$('.season').click(function(){
							
							if($(this).prop("checked")==true){
								seasons.push($(this).next().text());
								season=seasons.join("/");
							}else{
								for(var i = 0; i < seasons.length; i++) {
									  if(seasons[i] === $(this).next().text())  {
										seasons.splice(i, 1);
										
									  }
									}
								season=seasons.join("/");
							}
							
							
							$.ajax({
	    	                	url:"/coordi/categoryCoordiList.do",
	    	                	data:{item:item,temp:temp,gender:gender,season:season},
	    	                	type:"get",
	    	                	success:function (result){
			                		$('#coordiListArea').html(result);
			                	},
	    	                	error:function(){
	    	                		console.log("통신실패");
	    	                	}
	    	                });
						});
					</script>
			
			<!-- coordiListAreas -->
			<div id="coordiListArea">
				<div id="coordiListNumArea">코디 전체<span>${map.get('coordiList').size()}개</span></div>
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
						<form action="">
							<input class="search-style" type="text" name="keyword" placeholder="검색어를 입력하세요">
							<button type="submit"><i class="fas fa-search"></i></button>
						</form>
					</div>
				</div>
				
				<div id="coordiListImgArea">
					<div class="grid-sizer"></div>
					<div id="coordiListWrap">
					<c:forEach items="${requestScope.map.get('coordiList')}" var="coordi" varStatus="i">
					<div class="coordiImgArea">
						<a href="/coordi/coordiPost.do">
							<img class="coordiImg" src="${coordi.filePath}">
						</a>	
							<div id="${coordi.coordiNo}" class="likeScrapArea">
											
											<img class="like" src="/resources/images/icon/heart_wf.png"> 
											<img class="scrap" src="/resources/images/icon/saved_wf.png">
									
						
							</div>
							
							<div class="nickNameArea">
								<div class="profileArea">
									<div class="profile">
										<a href=""><img src="${coordi.profileFilePath}" /></a>
									</div>
								</div>
								<span class="nickName">${coordi.nickName}</span>
							</div>
						
					</div>
					</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script>
		var a=${sessionScope.member.userId}
		console.log(a);
	</script>
	
	
	<script>
		var likeList=new Array();
		var scrapList=new Array();
		<c:forEach items="${requestScope.map.get('likeList')}" var="coordiNo" varStatus="i">
			likeList.push(${coordiNo});
		</c:forEach>
		for(var i=0;i<likeList.length;i++){
			$('#'+likeList[i]).children().eq(0).attr("src","/resources/images/icon/heart_on.png");
			
		};
		<c:forEach items="${requestScope.map.get('scrapList')}" var="coordiNo" varStatus="i">
		scrapList.push(${coordiNo});
		</c:forEach>
		for(var i=0;i<scrapList.length;i++){
			$('#'+scrapList[i]).children().eq(1).attr("src","/resources/images/icon/saved_on.png");
			
		};
	</script>
	<script>
		$('.categoryName').click(function(){
			$(this).next().slideToggle();
		});
	
		$('.like').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/heart_on.png") {
				var coordiNo=$(this).parent().attr('id');	
				$(this).attr('src', "/resources/images/icon/heart_wf.png");
				$.ajax({
					url:"/coordi/unlikeCoordi.do",
                	data:{coordiNo:coordiNo},
                	type:"get",
                	success:function (){
                		
                	},
                	error:function(){
                		console.log("통신실패");
                	}
					
				});
			} else {
				var coordiNo=$(this).parent().attr('id');			
				$(this).attr('src', "/resources/images/icon/heart_on.png");
				$.ajax({
					url:"/coordi/likeCoordi.do",
                	data:{coordiNo:coordiNo},
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
				var coordiNo=$(this).parent().attr('id');
				$(this).attr('src', "/resources/images/icon/saved_wf.png");
				$.ajax({
					url:"/coordi/unscrapCoordi.do",
                	data:{coordiNo:coordiNo},
                	type:"get",
                	success:function (){
                		
                	},
                	error:function(){
                		console.log("통신실패");
                	}
					
				});
			} else {
				var coordiNo=$(this).parent().attr('id');
				$(this).attr('src', "/resources/images/icon/saved_on.png");
				$.ajax({
					url:"/coordi/scrapCoordi.do",
                	data:{coordiNo:coordiNo},
                	type:"get",
                	success:function (){
                		
                	},
                	error:function(){
                		
                		location.replace('/member/loginPage.do');
                	}
					
				});
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
		});
	</script>
	
	<script>
		$('#coordiListImgArea').masonry({
			// set itemSelector so .grid-sizer is not used in layout
			itemSelector: '.coordiImgArea',
			// use element for option
			columnWidth: '.grid-sizer',
			percentPosition: true
		});
	</script>
</body>
</html>