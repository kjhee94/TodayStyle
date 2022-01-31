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
<link rel="stylesheet" href="/resources/css/insertStyle.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
	<div id="title">
				<p>잇템작성</p>
			</div>
				
			<div id="info-wrapper">
                <input type="checkbox" id="info-check">
                <label for="info-check">
                    <span style="color:#707070">
                        <em></em><b>필수 입력 정보</b>
                    </span>
                    <span style="color:#C8C8C8">
                        잇템을 추천하기 위한 정보이니 최대한 꼼꼼하게 작성해주세요<em></em>  
                    </span>
                </label>
				    <div class="info-detail">

                       
                        <div class="togglebox">
                            <p class="subject">성별</p>
                            <a>
                                <div>여성</div>
                            </a>
                            <a>
                                <div>남성</div>  
                            </a>
                            <a>
                                <div>공용</div>
                            </a>
  
                        </div>

                        <div id="insert-item">
                            <div>
                               <p class="subject">
                                   <span>
                                       아이템 정보 추가
                                   </span>
                                   <span style="font-size: 14px;color:#C8C8C8">  
                                       한 가지만 추가가 가능합니다.
                                   </span>
                                </p>
                            </div>


                            <div class="togglebox">
                                    <a>
                                        <div>상의</div>
                                    </a>
                                    <a>
                                        <div>하의</div>
                                    </a>
                                    <a>
                                        <div>아우터</div>
                                    </a>
                                    <a>
                                        <div>신발</div>
                                    </a>
                                    <a>
                                        <div>악세사리</div>
                                    </a>
                            </div>
                            <div>
                                <span>
                                    <select class="select">
                                        <option>상의 카테고리 선택</option>
                                    </select>
                                </span>
                                <span>
                                    <textarea placeholder="브랜드를 입력하세요" class="textarea2"></textarea>
                                </span>
                            </div>
                        </div>	
                        
                        						
                        <div id="item-info">
                            
                               <div class="subject">
                                   <p>
                                       <span>아이템 상세정보</span>
                                       
                                   </p>
                               </div>
                                <div>
                                   <span>
                                       <p>상품명</p>
                                   </span>
                                    <span>
                                        <textarea placeholder="상품명 또는 상품 코드를 입력하세요"class="textarea2"></textarea>
                                    </span>
                                </div>
                                <div>
                                   <span>
                                       <p>색상</p>
                                   </span>
                                    <span>
                                        <textarea placeholder="구매한 색상을 입력하세요"class="textarea2"></textarea>
                                    </span>
                                </div>
                                <div>
                                  <span>구매 사이즈</span>
                                   <span>
                                        <textarea placeholder="구매한 사이즈를 입력하세요" class="textarea2"></textarea>
                                    </span>
                                </div>
                         </div> 
                           
                           
                            <div id="user-info">
                               <div class="subject">
                                   <p>
                                       <span>사용자 정보</span>
                                   </p>
                               </div>
                                <div>
                                   <span>
                                       <p>키</p>
                                   </span>
                                    <span>
                                        <textarea placeholder="키를 입력하세요" class="textarea2"></textarea>
                                    </span>
                                </div>
                                <div>
                                   <span>정사이즈</span>
                                    <span>
                                        <textarea placeholder="평소에 착용하는 사이즈를 입력하세요" class="textarea2"></textarea>
                                    </span>
                                </div>
                            </div>
				    
                    </div>
			
				
				
			<div id="picture-wrapper">
	            <div id="insert-picture">
                    <input type="file" accept=".jpg, .png id=file-input" id="file-input">
                    <label for="file-input">
                        <span class="insert-box">
                            <em></em>
                            <p>
                                <span style="font-size: 15px">
                                    사진을 등록해주세요<br>
                                </span>
                                <span style="font-size: 11px">
                                    (*최대 10장까지)
                                </span>
                            </p>
                            
                        </span>
                        
                    </label>
	                
	            </div>
	            <div id="insert-info">
	                <div id="coordi-info">
	                    <textarea placeholder="코디설명을 입력하세요" class="textarea" ></textarea>
	                </div>
	                <div id="hashtag">
	                    해시태그
	                </div>
	            </div>
			</div>
			
			<div id="coordi-post">
				<button id="post-button">등록</button>
			</div>
		
       </div>
    </div>
	
	
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>