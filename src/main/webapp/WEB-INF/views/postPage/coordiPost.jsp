<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			                    <span>17˚C~19˚C</span>
			                    <span>겨울</span>
			                    <span>여성</span>
			                </div>
			                <span>${requestScope.date }</span>
			            </div>
			            
						<div id="picture">
							<div id="picture-left" class="img-big">
								<img src="/resources/images/coordi/stylelist23.jpg">
							</div>
							<div id="picture-right">
								<div class="img-small focus"><img src="/resources/images/coordi/stylelist23.jpg"></div>
								<div class="img-small"><img src="/resources/images/coordi/stylelist24.jpg"></div>
							    <div class="img-small"><img src="/resources/images/coordi/stylelist25.jpg"></div>
							</div>
						</div>
					
						<div id="post-content">
							<p>
								블랙 색상이라 무채색에 찰떡이고 많이 두껍지 않아서 가볍게 입고 다니기 좋더라구요!<br>
								특히 뒷 면에 자수가 너무 귀여워서 입고 다녔을 때 다들 탐내는 후드 디자인이었어요 :)<br> 
								레이어드해서 입으면 너무 좋을 것 같고 사이즈는 좀 오버한 핏이라 맞게 입으시려면 한 단계 낮춰서 주문하시는 걸 추천합니다!<br>
							</p>
						</div>
					
						<div id="hashtag">
							<span><a href="">#데일리룩</a></span>
							<span><a href="">#후드티</a></span>
							<span><a href="">#후드</a></span>
							<span><a href="">#볼캡</a></span>
							<span><a href="">#볼캡코디</a></span>
							<span><a href="">#슬랙스</a></span>
						</div>
						
		                <div id="box-post-btn">
		               	 	<button class="btn-style-line"><a href="/coordi/coordiList.do">목록</a></button>
		                	<button class="btn-style-mint"><a href="/coordi/coordiUpdate.do">수정</a></button>
		                </div>
					</div>
		            
		            <div id="left-bottom-wrapper">
		                <div id="cmt-count">
		                   	댓글<span>3</span>
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

		                	
		                </div>
		                
		                <!-- 댓글 페이지네이션 -->
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
		            </div>
		        </div>
		        
		         <div id="right-wrapper">
		           <div id="user-info">
		              <div id="user-box">
						<a href="/myPage/userPage.do">
							<div class="profile">
								<img src="/resources/images/default/profile.jpg">
							</div>
							<span>닉네임</span>
						</a>
		              </div>
		              <button class="btn-style-line" id="user-follow-btn">팔로우</button>
		           </div>
		           
		                  <c:choose>
		        <c:when test="${requestScope.followBtn.equals('팔로잉') }">
		           <div id="${requestScope.memberUserId }" class="btn-style-mint user-follow-btn">팔로잉</div>
		        </c:when>
		        <c:when test="${requestScope.followBtn.equals('팔로우') }">
		           <div id="${requestScope.memberUserId }" class="btn-style-line user-follow-btn">팔로우</div>
		        </c:when>
		     </c:choose>
     
     
		           
		           <div id="like-scrap">
	                   	<button id="like">
                   			<img src="/resources/images/icon/heart.png">
                   			<span>12</span>
	                   	</button>
		                <button id="scrap">
	                   		<img src="/resources/images/icon/saved.png">
	                   		<span>7</span>
		                </button>
					</div>
		           
					<div id="cloth-info">
						<span class="info-title">아이템 정보</span>
			           	<div class="box-style">
							<div class="style">
								<div class="img-style">
									<img alt="상의" src="/resources/images/default/top.png">
								</div>
								<div class="txt-style">
									<p>Top &nbsp·&nbsp 후드</p>
									<span>꼼파뇨</span>
								</div>
							</div>
							<div class="style">
								<div class="img-style">
									<img alt="하의" src="/resources/images/default/bottom.png">
								</div>
								<div class="txt-style">
									<p>Bottom &nbsp·&nbsp 슬랙스</p>
									<span>나인브라더스</span>
								</div>
							</div>
							<div class="style">
								<div class="img-style">
									<img alt="신발" src="/resources/images/default/shoes.png">
								</div>
								<div class="txt-style">
									<p>Shoes &nbsp·&nbsp 운동화</p>
									<span>FILA</span>
								</div>
							</div>
							<div class="style">
								<div class="img-style">
									<img alt="악세사리" src="/resources/images/default/acc.png">
								</div>
								<div class="txt-style">
									<p>Acc &nbsp·&nbsp 안경</p>
									<span>젠틀몬스터</span>
								</div>
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
			var img2 = $(".img-big").html();
			
			$(".img-big").html(img);
			
			$(this).addClass("focus");
			$(".img-small").not(this).removeClass("focus");
		})
		

		
		
		
                   $('#user-follow-btn').click(function(){
                      var userId = $('#user-follow-btn').attr('id');
                      if($('#user-follow-btn').html()==="팔로잉")
                      {
                         $('#user-follow-btn').attr('class','btn-style-line user-follow-btn');
                         $('#user-follow-btn').html("팔로우");
                         $.ajax({
                            url:"/myPage/unFollow.do",
                              data:{unfollowUserId:userId},
                              type:"get",
                              success:function (){
                                 location.reload();
                              },
                              error:function(){
                                 console.log("통신실패");
                              }
                            
                         });
                      }else
                      {
                         $('#user-follow-btn').attr('class','btn-style-mint user-follow-btn');
                         $('#user-follow-btn').html("팔로잉");
                         $.ajax({
                            url:"/myPage/follow.do",
                              data:{followUserId:userId},
                              type:"get",
                              success:function (){
                                 location.reload();
                              },
                              error:function(){
                                 console.log("통신실패");
                              }
                            
                         });
                      }
                   });
		//댓글 불러오기
		 
		function getCommentList(){
		    
		    $.ajax({
		        type:'GET',
		        url : "<c:url value='/coordi/commentList.do'/>",
		        dataType : "json",
		        data:$("#commentForm").serialize(),
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		        success : function(data){
		            
		            var html = "";
		            var cCnt = data.length;
		            
		            if(data.length > 0){
		                
		                for(i=0; i<data.length; i++){
		                    html += "<div>";
		                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
		                    html += data[i].comment + "<tr><td></td></tr>";
		                    html += "</table></div>";
		                    html += "</div>";
		                }
		                
		            } else {
		                
		                html += "<div>";
		                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		                html += "</table></div>";
		                html += "</div>";
		                
		            }
		            
		            $("#cCnt").html(cCnt);
		            $("#commentList").html(html);
		            
		        },
		        error:function(request,status,error){
		            
		       }
		        
		    });
		}
		


	</script>

</body>
</html>