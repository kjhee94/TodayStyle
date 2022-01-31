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
				<p style="font-size: 25px; color:#707070">코디작성</p>
			</div>
				
			<div id="info-wrapper">
                <input type="checkbox" id="info-check">
                <label for="info-check">
                    <span style="color:#707070;">
                        <em></em><b>필수 입력 정보</b>
                    </span>
                    <span style="color:#C8C8C8">
                        코디와 날씨를 연동하기 위한 정보이니 최대한 꼼꼼하게 작성해주세요<em></em>  
                    </span>
                </label>
				    <div class="info-detail">
				        <div id="temperature">
                           <div class="subject">
                               <p>기온</p>
                           </div>
                            <select class="select">
                                <option>기온 선택</option>
                                <option>0~10</option>
                                <option>11~15</option>
                            </select>
					    </div>
                       
                        <div class="togglebox">
                           <div class="subject">
                               <p>계절</p>
                           </div>
                            <a>
                                <div>봄</div>
                            </a>
                            <a>
                                <div>여름</div>  
                            </a>
                            <a>
                                <div>가을</div>
                            </a>
                            <a>
                                <div>겨울</div>
                            </a>
                        </div>
                        <div class="togglebox">
                            <div class="subject">
                               <p>성별</p>
                           </div>
                            <a>
                                <div>여자</div>
                            </a>
                            <a>
                                <div>남자</div>
                            </a>
                            <a>
                                <div>공용</div>
                            </a>
                        </div>
                        <div id="coordi-info1">
                            <div class="subject">
                               <p>의상정보추가</p>
                            </div>

                            <div class="select-category">
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
                            </div>					

                            <div>
                                <div>
                                   <span>
                                        <select class="select">
                                            <option>상의 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2">브랜드를 입력하세요</textarea>
                                    </span>
                                    <span>
                                        <button class="cancel-button">x</button>
                                    </span>
                                </div>
                                <div>
                                   <span>
                                        <select class="select">
                                            <option>하의 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2">브랜드를 입력하세요</textarea>
                                    </span>
                                    <span>
                                        <button class="cancel-button">x</button>
                                    </span>
                                </div>
                                <div>
                                   <span>
                                        <select class="select">
                                            <option>아우터 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2">브랜드를 입력하세요</textarea>
                                    </span>
                                    <span>
                                        <button class="cancel-button">x</button>
                                    </span>
                                </div>
                                <div>
                                   <span>
                                        <select class="select">
                                            <option>신발 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2">브랜드를 입력하세요</textarea>
                                    </span>
                                    <span>
                                        <button class="cancel-button">x</button>
                                    </span>
                                </div>
                                <div>
                                   <span>
                                        <select class="select">
                                            <option>악세사리 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2">브랜드를 입력하세요</textarea>
                                    </span>
                                    <span>
                                        <button class="cancel-button">x</button>
                                    </span>
                                </div>
                            </div>
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
	                <div id="coordi-info2">
	                    <textarea class="textarea" ></textarea>
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
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>