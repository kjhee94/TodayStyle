<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/css/coordi/coordiList.css">
<script src="/resources/common/common.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
</head>
<body>
		<div id="coordiListNumArea">코디 <span>${list.size()}개</span></div>
				<div class="list-top">
					<div id="coordiListFilterArea">
						<select id="filter">
							<c:choose>
								<c:when test="${filter eq '최신순' }">
									<option value="최신순" selected>최신순</option>
									<option value="좋아요순" >좋아요순</option>
									<option value="스크랩순">스크랩순</option>
								</c:when>
								<c:when test="${filter eq '스크랩순' }">
									<option value="최신순">최신순</option>
									<option value="좋아요순">좋아요순</option>
									<option value="스크랩순" selected>스크랩순</option>
								</c:when>
								<c:otherwise>
									<option value="최신순" >최신순</option>
									<option value="좋아요순" selected>좋아요순</option>
									<option value="스크랩순">스크랩순</option>
								</c:otherwise>
							</c:choose>
						</select>
						<i class="fas fa-filter"></i>
					</div>
					<script>
					var filter="최신순";
						$('#filter').change(function(){
							var filter=$('#filter option:selected').text();
							console.log(filter);
							$.ajax({
								url:"/coordi/categoryCoordiList.do",
	    	                	data:{item:item,temp:temp,gender:gender,season:season,filter:filter,keyword:keyword},
	    	                	type:"get",
	    	                	success:function (result){
			                		$('#coordiListArea').html(result);
			                	},
	    	                	error:function(){
	    	                		console.log("통신실패");
	    	                	}
								
							});
							
						})
					</script>
					<div class="box-search">
							<input class="search-style" type="text" name="keyword" placeholder="검색어를 입력하세요">
							<button id="searchBtn" type="button" ><i class="fas fa-search" style="cursor:pointer;"></i></button>
					</div>
				</div>
				<script>
				var keyword;
					$('#searchBtn').click(function(){
						keyword =$('.search-style').val();
						$.ajax({
							url:"/coordi/categoryCoordiList.do",
    	                	data:{item:item,temp:temp,gender:gender,season:season,filter:filter,keyword:keyword},
    	                	type:"get",
    	                	success:function (result){
		                		$('#coordiListArea').html(result);
		                	},
    	                	error:function(){
    	                		console.log("통신실패");
    	                	}
							
						});
					})
				</script>
				
				<div id="coordiListImgArea">
					<div class="grid-sizer"></div>
					<div id="coordiListWrap">
		<c:forEach items="${requestScope.list}" var="coordi" varStatus="i">
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
										<c:choose>
	                                    	<c:when test="${coordi.profileFilePath!=null}">
	                                       		<a href="/myPage/userPage.do?userId=${coordi.userId }"><img src="${coordi.profileFilePath}" id="profileImg"></a>
		                                   	</c:when>
		                                    <c:otherwise>
		                                        <a href="/myPage/userPage.do?userId=${coordi.userId }"><img src="/resources/images/default/profile.jpg" id="profileImg"></a>
		                                   	 </c:otherwise>
	                               		</c:choose>
									</div>
								</div>
								<span class="nickName">${coordi.nickName}</span>
							</div>
						
					</div>
		</c:forEach>
		</div>
					
				</div>
		<script>
		var likeList=new Array();
		var scrapList=new Array();
		<c:forEach items="${requestScope.likeList}" var="coordiNo" varStatus="i">
			likeList.push(${coordiNo});
		</c:forEach>
		for(var i=0;i<likeList.length;i++){
			$('#'+likeList[i]).children().eq(0).attr("src","/resources/images/icon/heart_on.png");
			
		};
		<c:forEach items="${requestScope.scrapList}" var="coordiNo" varStatus="i">
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
		$('.coordiImg').hover(function(){
			$(this).css('transition','all 0.2s linear');
			$(this).css('transform','scale(1.05)');
		},function(){
			$(this).css('transition','all 0.2s linear');
			$(this).css('transform','scale(1)');
		});
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