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
			                    <span>글제목</span>
			                </div>
			                <span>2022.01.15</span>
			            </div>
			            
						<div id="picture">
							<div id="picture-left">
								<img src="/resources/images/itItem/item1.jpg">
							</div>
							<div id="picture-right">
								<div class="img-small focus"><img src="/resources/images/itItem/item1.jpg"></div>
								<div class="img-small"><img src="/resources/images/itItem/item2.jpg"></div>
							    <div class="img-small"><img src="/resources/images/itItem/item2-1.jpg"></div>
							</div>
						</div>
					
						<div id="post-content">
							<p>
								솔직히 이거 모르는 사람 없을 거예요. 진짜 어떤 코디에도 다 잘 어울리고 아 뭐신지,, 하면 무조건 이거!<br>
								다들 신발장에 한 켤레씩은 있죠???  없으시면 당장 구매 추천드립니다. 후회 없으실 거예요!!<br>
								아 참고로 저는 여유롭게 신는편이라 반업 했는데 넉넉하니 좋네용
							</p>
						</div>
					
						<div id="hashtag">
							<span><a href="">#데일리운동화</a></span>
							<span><a href="">#나이키</a></span>
							<span><a href="">#스니커즈</a></span>
							<span><a href="">#운동화추천</a></span>
						</div>
						
		                <div id="box-post-btn">
		               	 	<button class="btn-style-line">목록</button>
		                	<button class="btn-style-mint">수정</button>
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
		                	<div class="cmt-one">
		                		<div class="profile">
		                   			<a href=""><img src="/resources/images/default/profile.jpg"></a>
		                   		</div>
		                   		<div class="cmt-txt">
			                   		<span class="cmt-nick">닉네임</span>
			                   		<span class="cmt-content">댓글 내용입니다</span>
			                   		<div class="cmt-info">
			                   			<span>2022.01.16</span>
			                   			<span>답글</span>
			                   			<span>수정</span>
			                   			<span>삭제</span>
			                   		</div>
		                   		</div>
		                	</div>
		                	<div class="cmt-re">
		                		<div class="cmt-one ">
		                   			<div class="profile">
			                   			<a href=""><img src="/resources/images/default/profile.jpg"></a>
			                   		</div>
			                   		<div class="cmt-txt">
			                   			<span class="cmt-nick">닉네임</span>
				                   		<span class="cmt-re-nick"><a href="">@원댓쓴이</a></span>
				                   		<span class="cmt-content">댓글 내용입니다</span>
				                   		<div class="cmt-info">
				                   			<span>2022.01.16</span>
				                   			<span>답글</span>
				                   			<span>수정</span>
				                   			<span>삭제</span>
				                   		</div>
			                   		</div>
		                   		</div>
		                	</div>
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
		                  <div class="profile">
	                    	  <a>
	                    	  	<img src="/resources/images/default/profile.jpg">
	                    	  </a>
		                  </div>
		                  <span>닉네임</span>
		              </div>
		              <button class="btn-style-line">팔로우</button>
		           </div>
		           
		           <div id="like-scrap">
	                   	<button id="like">
	                   		<a href="">
	                   			<img src="/resources/images/icon/heart.png">
	                   			<span>12</span>
	                   		</a>
	                   	</button>
		                <button id="scrap">
		                	<a>
		                   		<img src="/resources/images/icon/saved.png">
		                   		<span>7</span>
		                   	</a>
		                </button>
					</div>
		           
		           <div id="cloth-info">
						<span class="info-title">의상 정보</span>
			           	<div class="box-style">
			           		<div class="style">
								<div class="img-style">
									<img alt="신발" src="/resources/images/default/shoes.png">
								</div>
								<div class="txt-style">
									<p>Shoes &nbsp·&nbsp 운동화</p>
									<span>FILA</span>
								</div>
							</div>
						</div>
						
						<span class="info-title detail">아이템 상세</span>
						<div class="txt-item">
							<div class="txt-item-list">
								<span class="tit-item">상품명</span>
								<span>나이키 에어포스1</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">색상</span>
								<span>화이트</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">구매 사이즈</span>
								<span>245mm</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">사용자 키</span>
								<span>165cm</span>
							</div>
							<div class="txt-item-list">
								<span class="tit-item">정사이즈</span>
								<span>240mm</span>
							</div>
						</div>
			        </div>
					
				</div>
			</div>
	   	</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>

</body>
</html>