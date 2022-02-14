<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/common/footer.css">
<link rel="stylesheet" href="/resources/css/postPage/postPage.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/resources/common/common.js"></script>
</head>

<body>

	<div id="wrap">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
		<div id="content">
			<div id="wrapper">
				<div id="left-wrapper">
					<div id="left-top-wrapper">
						<div id="info-bar">
			                <div>
			                    <span>${requestScope.map.pi.itItemTitle}</span>
			                </div>
			                <span>${requestScope.map.pi.postTime}</span>
			            </div>
			            
						<div id="picture">
							<div id="picture-left" class="img-big">
								<img src="${requestScope.map.imgList.get(0).filePath}">
							</div>
							<!-- <div id="picture-right">
								<div class="img-small focus"><img src="/resources/images/itItem/item1.jpg"></div>
								<div class="img-small"><img src="/resources/images/itItem/item2.jpg"></div>
							    <div class="img-small"><img src="/resources/images/itItem/item2-1.jpg"></div>
							</div> -->
						</div>
					
						<div id="post-content">
							<p>${requestScope.map.pi.itContent}</p>
						</div>
					
						<div id="hashtag">
							<c:forTokens var="hashTag" items="${requestScope.map.pi.hashtag}" delims=",">
								<span><a href="">#${hashTag}</a></span>
							</c:forTokens>
						</div>
						
		                <div id="box-post-btn">
		               	 	<button class="btn-style-line"><a href="/itItem/itItemList.do">목록</a></button>
		                	<button class="btn-style-mint"><a href="">수정</a></button>
		                </div>
					</div>
		            
		            <div id="left-bottom-wrapper">
		                <div id="cmt-count">
		                   	댓글<span>${requestScope.map.cmtList.size() }</span>
		                </div>
		                
	                    <div class="cmt-input">
	                   		<div class="profile">
	                   			<img src="/resources/images/default/profile.jpg">
	                   		</div>
	                   		<div class="input-comment">
	                   			<input class="input-style" type="text" name="comment" value="" placeholder="댓글을 입력해주세요">
	                        	<input id="commentInsertBtn" type="button" name="name" value="등록">
	                   		</div>
	                    </div>
	                    
		                <div id="cmt-list">
			                <c:choose>
								<c:when test="${!requestScope.map.list.isEmpty() }">
				                	<c:forEach items="${requestScope.map.cmtList }" var="cl">
					                	<div class="cmt-one">
					                		<div class="profile">
					                   			<a href="/myPage/userPage.do?userId=${cl.cmtWriter}">
					                   				<c:choose>
					                                    <c:when test="${cl.profileFilePath!=null}">
					                                        <img src="${cl.profileFilePath}" id="profileImg">
					                                    </c:when>
					                                    <c:otherwise>
					                                        <img src="/resources/images/default/profile.jpg" id="profileImg">
					                                    </c:otherwise>
					                               </c:choose>
					                   			</a>
					                   		</div>
					                   		<div class="cmt-txt">
						                   		<span class="cmt-nick"><a href="/myPage/userPage.do">${cl.nickName}</a></span>
						                   		<span class="cmt-content">${cl.cmtContent}</span>
						                   		<div class="cmt-info">
						                   			<span>${cl.cmtTime}</span>
						                   			<span>답글</span>
						                   			<span>삭제</span>
						                   		</div>
					                   		</div>
					                	</div>
				                	</c:forEach>
			                	</c:when>
			                	<c:otherwise>
			                		<span>현재 댓글이 없습니다</span>
			                	</c:otherwise>
		                	</c:choose>
		                </div>
		                
		                <!-- 댓글 페이지네이션
		                <div id="page_wrap">
							<ul class="page_ul">
								<li><a href=''><i class='fas fa-chevron-left'></i></a></li>
								<li><a href='' class='page_active'>1</a></li>
								<li><a href=''>2</a></li>
								<li><a href=''>3</a></li>
								<li><a href=''>4</a></li>
								<li><a href=''>5</a></li>
								<li><a href=''><i class='fas fa-chevron-right'></i></a></li>
			 				</ul>
					    </div>
					     -->
		            </div>
		            <script>
	                    	$('#commentInsertBtn').click(function(){
	                    		var comment = $('.input-style').val();
	                    		var itItemNo=$('#like-scrap').attr('class');
	                    		$.ajax({
			    					url:"/itItem/insertComment.do",
			                    	data:{comment:comment,itItemNo:itItemNo},
			                    	type:"get",
			                    	success:function (result){
			                    		$('#left-bottom-wrapper').html(result);
			                    	},
			                    	error:function(){
			                    		console.log("통신실패");
			                    		location.replace('/member/loginPage.do');
			                    	}
			    					
			    				});
	                    	})
	                    </script>
		        </div>
		        
		         <div id="right-wrapper">
		           <div id="user-info">
		              <div id="user-box" class="${requestScope.map.pi.userId}">
						<a href="/myPage/userPage.do?userId=${requestScope.map.pi.userId}">
							<div class="profile">
								<c:choose>
                                    <c:when test="${requestScope.map.pi.profileFilePath!=null}">
                                        <img src="${requestScope.map.pi.profileFilePath}" id="profileImg">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/images/default/profile.jpg" id="profileImg">
                                    </c:otherwise>
                               </c:choose>
							</div>
							<span>${requestScope.map.pi.nickName}</span>
						</a>
		              </div>
		              <c:choose>
		              	<c:when test="${map.followBtn.equals('팔로잉') }">
		              		<button id="followBtn" class="btn-style-line " style="background-color:#A9D4D9; color:#fff;">팔로잉</button>
		              	</c:when>
		              	<c:otherwise>
		              		<button id="followBtn" class="btn-style-line ">팔로우</button>
		              	</c:otherwise>
		              </c:choose>
		              
		           </div>
		           <script>
		           		$('#followBtn').click(function(){
		           			var text=$(this).text();
		           			var followUserId=$(this).prev().attr('class');
		           			console.log(followUserId);
		           			if(text=='팔로우'){
		           				$(this).text('팔로잉');
		           				$(this).css('background-color','#A9D4D9');
		           				$(this).css('color','#fff');
		           				$.ajax({
			    					url:"/myPage/follow.do",
			                    	data:{followUserId:followUserId},
			                    	type:"get",
			                    	success:function (){
			                    		
			                    	},
			                    	error:function(){
			                    		console.log("통신실패");
			                    		location.replace('/member/loginPage.do');
			                    	}
			    					
			    				});
		           			}else{
		           				var unfollowUserId=$(this).prev().attr('class');
		           				$(this).text('팔로우');
		           				$(this).css('background-color','#fff');
		           				$(this).css('color','#707070');
		           				$.ajax({
			    					url:"/myPage/unFollow.do",
			                    	data:{unfollowUserId:unfollowUserId},
			                    	type:"get",
			                    	success:function (){
			                    		
			                    	},
			                    	error:function(){
			                    		console.log("통신실패");
			                    	}
			    					
			    				});
		           			}
		           			
		           			
		           		})
		           </script>
		           <div id="like-scrap" class="${requestScope.map.pi.itItemNo }">
	                   	<button id="like">
	                   		<c:choose>
	                   			<c:when test="${map.likeResult>0}">
	                   				<img src="/resources/images/icon/heart_on.png">
	                   			</c:when>
	                   			<c:otherwise>
	                   				<img src="/resources/images/icon/heart.png">
	                   			</c:otherwise>
	                   		</c:choose>
	                   		
                   			
                   			<span>${requestScope.map.ItItemLike}</span>
	                   	</button>
		                <button id="scrap">
		                	<c:choose>
	                   			<c:when test="${map.scrapResult>0}">
	                   				<img src="/resources/images/icon/saved_on.png"">
	                   			</c:when>
	                   			<c:otherwise>
	                   				<img src="/resources/images/icon/saved.png">
	                   			</c:otherwise>
	                   		</c:choose>
	                   		
	                   		<span>${requestScope.map.ItItemScrap}</span>
		                </button>
					</div>
		           	<script>
		           	$('#like').click(function() {
		           		var itItemNo=$(this).parent().attr('class');
		           		var likeNum=$(this).children().eq(1).text();
		           		console.log(itItemNo);
		    			if ($(this).children().eq(0).attr('src') === "/resources/images/icon/heart_on.png") {
		    				$(this).children().eq(0).attr('src', "/resources/images/icon/heart.png");
		    				
		    				$(this).children().eq(1).text(likeNum-1);
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
		    				$(this).children().eq(0).attr('src', "/resources/images/icon/heart_on.png");
		    				$(this).children().eq(1).text(++likeNum);
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
		    		$('#scrap').click(function() {
		    			var itItemNo=$(this).parent().attr('class');
		    			var scrapNum=$(this).children().eq(1).text();
		    			if ($(this).children().eq(0).attr('src') === "/resources/images/icon/saved_on.png") {
		    				
		    				$(this).children().eq(0).attr('src', "/resources/images/icon/saved.png");
		    				$(this).children().eq(1).text(scrapNum-1);
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
		    				
		    				$(this).children().eq(0).attr('src', "/resources/images/icon/saved_on.png");
		    				$(this).children().eq(1).text(++scrapNum);
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
		           <div id="cloth-info">
						<span class="info-title">의상 정보</span>
			           	<div class="box-style">
			           		<div class="style">
			           			<c:if test="${requestScope.map.pi.categoryCode.substring(0,1) eq 'T'}">
									<div class="img-style">
										<img alt="상의" src="/resources/images/default/top.png">
									</div>
									<div class="txt-style">
										<p>Top &nbsp·&nbsp ${requestScope.map.pi.categoryName}</p>
										<span>${requestScope.map.pi.brand}</span>
									</div>
								</c:if>
								<c:if test="${requestScope.map.pi.categoryCode.substring(0,1) eq 'B'}">
									<div class="img-style">
										<img alt="하의" src="/resources/images/default/bottom.png">
									</div>
									<div class="txt-style">
										<p>Bottom &nbsp·&nbsp ${requestScope.map.pi.categoryName}</p>
										<span>${requestScope.map.pi.brand}</span>
									</div>
								</c:if>
								<c:if test="${requestScope.map.pi.categoryCode.substring(0,1) eq 'O'}">
									<div class="img-style">
										<img alt="아우터" src="/resources/images/default/outer.png">
									</div>
									<div class="txt-style">
										<p>Outer &nbsp·&nbsp ${requestScope.map.pi.categoryName}</p>
										<span>${requestScope.map.pi.brand}</span>
									</div>
								</c:if>
								<c:if test="${requestScope.map.pi.categoryCode.substring(0,1) eq 'S'}">
									<div class="img-style">
										<img alt="신발" src="/resources/images/default/shoes.png">
									</div>
									<div class="txt-style">
										<p>Shoes &nbsp·&nbsp ${requestScope.map.pi.categoryName}</p>
										<span>${requestScope.map.pi.brand}</span>
									</div>
								</c:if>
								<c:if test="${requestScope.map.pi.categoryCode.substring(0,1) eq 'A'}">
									<div class="img-style">
										<img alt="악세사리" src="/resources/images/default/acc.png">
									</div>
									<div class="txt-style">
										<p>Acc &nbsp·&nbsp ${requestScope.map.pi.categoryName}</p>
										<span>${requestScope.map.pi.brand}</span>
									</div>
								</c:if>
							</div>
						</div>
						
						<span class="info-title detail">아이템 상세</span>
						<div class="txt-item">
							<div class="txt-item-list">
								<span class="tit-item">상품명</span>
								<span>${requestScope.map.pi.itName}</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">색상</span>
								<span>${requestScope.map.pi.itColor}</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">구매 사이즈</span>
								<span>${requestScope.map.pi.itSize}</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">사용자 키</span>
								<span>${requestScope.map.pi.userHeight}</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">정사이즈</span>
								<span>${requestScope.map.pi.userSize}</span>
							</div>
						</div>
			        </div>
					
				</div>
			</div>
	   	</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
	
	<script>
		$(".img-small").click(function() {
			var img = $(this).html();
			
			$(".img-big").html(img);
			
			$(this).addClass("focus");
			$(".img-small").not(this).removeClass("focus");
		})
	</script>

</body>
</html>