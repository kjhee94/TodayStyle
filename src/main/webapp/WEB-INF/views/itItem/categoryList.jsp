<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/itItem/itItemList.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/resources/common/common.js"></script>
</head>
<body>
	<div id="itItemListNumArea">잇템 <span>${list.size()}개</span></div>
				<div class="list-top">
					<div id="itItemListFilterArea">
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
							<input class="search-style" type="text" name="keyword" placeholder="해시태그를 입력하세요">
							<button id="searchBtn" type="button" ><i class="fas fa-search" style="cursor:pointer;"></i></button>
					</div>
				</div>
				<script>
				var keyword;
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
				<c:forEach items="${list }" var="itItem" varStatus="i">
					<div class="itItemImgWrap">
						
							<div class="itItemImgArea">
								<a href="/coordi/ItPost.do">
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
			<script>
				var likeList=new Array();
				var scrapList=new Array();
				<c:forEach items="${likeList}" var="itItemNo" varStatus="i">
					likeList.push(${itItemNo});
				</c:forEach>
				for(var i=0;i<likeList.length;i++){
					$('#'+likeList[i]).children().eq(0).attr("src","/resources/images/icon/heart_on.png");
					
				};
				<c:forEach items="${scrapList}" var="itItemNo" varStatus="i">
				scrapList.push(${itItemNo});
				</c:forEach>
				for(var i=0;i<scrapList.length;i++){
					$('#'+scrapList[i]).children().eq(1).attr("src","/resources/images/icon/saved_on.png");
					
				};
	</script>
	<script>
		$('.categoryName').one('click',function(){
			
			$(this).next().slideToggle();
			e.stopPropagation();
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
		$('.categoryBtnImg').click(function() {
			if ($(this).attr('src') === "/resources/images/icon/up.png") {
				$(this).attr('src', "/resources/images/icon/down.png");
			} else {
				$(this).attr('src', "/resources/images/icon/up.png");
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
		});
	</script>
</body>
</html>