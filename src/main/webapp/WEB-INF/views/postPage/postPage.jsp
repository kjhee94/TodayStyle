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
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/postPage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
		<div id="wrapper">
		 <div id="left-wrapper">
            <div id="left-top-wrapper">
                <div id="info-bar">
                    <div>
                        <div>
                           	 17˚C~19˚C
                        </div>
                        <div>
                                                겨울
                        </div>
                        <div>
                                                 여성
                        </div>
                    </div>
                    <div>
                          2022.01.15
                    </div>
                </div>
                <div id="picture">
                    <div id="picture-left">
                        	<img src="/resources/images/coordi/stylelist1.jpg" style=" width:100%;height:100%;object-fit:cover;">
                    </div>
                    <div id="picture-right">
                        <div>
                            <div>
                            	<img src="/resources/images/coordi/stylelist1_2.jpg">
                            </div>
                        </div>
                        <div>
                            <div>
                            	<img src="resources/images/coordi/stylelist1_3.jpg">
                            </div>
                        </div>
                        <div>
                            <div>
                            
                            </div>
                        </div>
                        <div>
                            <div>
                            
                            </div>
                        </div>
                        <div>
                            <div>
                            
                            </div>
                        </div>
                        <div>
                            <div>
                            
                            </div>
                        </div>
                    </div>
                </div>
                <div id="picture-info">
                  	  블랙 색상이라 무채색에 찰떡이고 많이 두껍지 않아서 가볍게 입고 다니기 좋더라구요! 
특히 뒷 면에 자수가 너무 귀여워서 입고 다녔을 때 다들 탐내는 후드 디자인이었어요 :) 
레이어드해서 입으면 너무 좋을 것 같고 사이즈는 좀 오버한 핏이라 맞게 입으시려면 한 단계 낮춰서 주문하시는 걸 추천합니다!
                </div>
                <div id="hashtag">
                  	  #데일리룩 #후드티 
                </div>
                <div id="list-update">
                    <div style="justify-content: center; align-content: center; display: flex;flex-direction: column;padding: 0px 15px;margin-right:2px">
                        <button class="btn-style-mint">수정</button>
                    </div>
                    <div style="justify-content: center; align-content: center; display: flex;flex-direction: column;padding: 0px 15px">
                        <button class="btn-style-gray">목록</button>
                    </div>
                </div>                
            </div>
            
            <div id="left-bottom-wrapper">
                <div id="cmt-count">
                   	<div>댓글</div>
                   	<div>3</div>
                </div>
                <div id="cmt-post">
                    <div>
                    	<a>
                    		<div class="profile" style="position:relative;top:20px; right:35px">
                    			<a>
                    				<img src="/resources/images/default/profile.jpg">
                    			</a>
                    		</div>
                    	</a>
                        <input type="text" name="name" value="" placeholder="댓글입력">
                        <input type="button" name="name" value="등록">
                    </div>

                </div>
                <div id="cmt-content">
                  	  댓글
                </div>
                <div id="cmt-page">
                   	 페이지네이션
                </div>
                
            </div>
            
        </div>
        <div id="right-wrapper">
           <div id="user">
              <div>
                  <div class="profile" style="width:30px;height:30px;position:relative;top:8px">
                    	  <a>
                    	  	<img src="/resources/images/default/profile.jpg">
                    	  </a>
                  </div>
                  <div id="user-name" style="width:150px" >
                     	 연신내핵주먹
                  </div>
              </div>
              <div>
                  <button>팔로우</button>
              </div>
           </div>
           <div id="like-scrap">
               <div id="like">
                   	<input type="button" name="like">
                   	<a>
                   		<img src="/resources/images/icon/heart.png">
                   	</a>
                   	<div>
                   		12
                   	</div>
               </div>
           
               <div id="scrap">
                   	<input type="button" name="scrap">
                   	<a>
                   		<img src="/resources/images/icon/saved.png">
                   	</a>
                   	<div>
                   		14
                   	</div>
               </div>
           </div>
           <div id="cloth-info">
              	 의상정보
           </div>
           <div id="clothes">
               <div>
                   	상의
               </div>
               <div>
                   	하의
               </div>
               <div>
                   	신발
               </div>
               <div>
                   	악세서리
               </div>
           </div>       
        </div>
		</div>
   	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>

	
	</script>
</body>
</html>