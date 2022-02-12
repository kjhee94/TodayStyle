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
<script src="/resources/API/talk.js"></script>
<link rel="stylesheet" href="/resources/css/insertStyle.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/resources/js/postInsert.js"></script>
</head>
<body>
	
	<div id="wrap" style="overflow:auto">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div id="content">
		<form action='<c:url value='/postCoordi/coordiPost'/>' id="insertForm" name="insertForm" method="post" >
		<div id="title">
			<p style="font-size: 25px; color:#707070">코디작성</p>
		</div>
				
		<div id="info-wrapper">
                <input type="checkbox" id="info-check">
                <label for="info-check">
                    <span style="color:#707070;">
                        <span style="padding:5px"><img src="/resources/images/icon/pen.png" style="width:15px; height:15px"></span><b>필수 입력 정보</b>
                    </span>
                    <span style="color:#C8C8C8">
                        	코디와 날씨를 연동하기 위한 정보이니 최대한 꼼꼼하게 작성해주세요<img src="/resources/images/icon/down.png" style="width:15px; height:15px; opacity:0.5; float:right">  
                    </span>
                </label>
                
				<div class="info-detail">
				    <div id="temperature">
                        <div class="subject">
                            <p>기온</p>
                         </div>
                         
                         <select class="select" name="temperature">
                            <option>
                            	기온 선택             
                           	</option>
                            
                               <option>4°이하</option>
                               <option>5°~8°</option>
                               <option>9°~11°</option>
                               <option>12°~16°</option>
                               <option>17°~19°</option>
                               <option>20°~22°</option>
                               <option>23°~27°</option>
                               <option>28°이상</option>
                         </select>
					</div>
                       
                    <div class="togglebox">
                           <div class="subject">
                               <p>계절</p>
                           </div>
	                       <a>
	                           	  <input type="button" value="봄" class="weather"/>
	                       </a>
	                       <a>
									<input type="button" value="여름" class="weather"/> 
	                       </a>
	                        <a>
	                        		<input type="button" value="가을" class="weather"/>
	                       </a>
	                        <a>
									<input type="button" value="겨울" class="weather"/>
	                       </a>
                     </div>
                     <div class="togglebox">
                           <div class="subject">
                               <p>성별</p>
                           </div>
	                       <a>
								<input type="button" value="여자" class="gender"/>
	                       </a>
	                        <a>
								<input type="button" value="남자" class="gender"/>
	                        </a>
	                        <a>
								<input type="button" value="공용" class="gender"/>
	                       </a>
                     </div>
                     <div id="coordi-info1">
                            <div class="subject">
                               <p>의상 정보 추가</p>
                            </div>

                            <div class="select-category">
                               <div class="togglebox">
                        	   <a>
                                 		<input type="button" value="상의" class="top-btn"/>
                               </a>
                               <a>
										<input type="button" value="하의" class="bottom-btn"/>

                               </a>
                               <a>
										<input type="button" value="아우터" class="outer-btn"/>
                               </a>
                               <a>
										<input type="button" value="신발" class="shoes-btn"/>
                               </a>
                               <a>
										<input type="button" value="악세사리" class="acc-btn"/>
                               </a>
                                </div>
                            </div>					

                            <div id="select-category2">
                                <div class="top" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>상의 카테고리 선택</option>
                                            <option>블라우스</option>
                                            <option>반팔</option>
                                            <option>셔츠</option>
                                            <option>긴팔</option>
                                            <option>맨투맨</option>
                                            <option>후드</option>
                                            <option>니트</option>
                                            <option>히트텍</option>
                                            <option>원피스</option>
                                            <option>조끼</option>
                                        </select>
                                    </span>
                                    <span>
                                    	<input type="text" placeholder="브랜드를 입력하세요" class="textarea2" style="margin-bottom:29px"/>
                                    </span>
                                    <span>
                                        <input type="button" class="top-cancel-btn" value="x" style="position:relative; bottom:4px"></input>
                                    </span>
                                </div>
                                <div class="bottom" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>하의 카테고리 선택</option>
                                            <option>반바지</option>
                                            <option>짧은치마</option>
                                            <option>긴치마</option>
                                            <option>슬랙스</option>
                                            <option>기모바지</option>
                                            <option>스타킹</option>
                                            <option>레깅스</option>
                                            <option>일자바지</option>
                                            <option>와이드팬츠</option>
                                            <option>스키니</option>
                                            <option>부츠컷</option>
                                            <option>조거</option>
                                            <option>치마바지</option>
                                            <option>멜빵</option>
                                            <option>미디스커트</option>
                                        </select>
                                    </span>
                                    <span>
                                        <input type="text" placeholder="브랜드를 입력하세요" class="textarea2" style="margin-bottom:29px"/>
                                    </span>
                                    <span>
                                        <input type="button" class="bottom-cancel-btn" value="x" style="position:relative; bottom:4px"></input>
                                    </span>
                                </div>
                                <div class="outer" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>아우터 카테고리 선택</option>
                                            <option>자켓</option>
                                            <option>가디건</option>
                                            <option>야상</option>
                                            <option>트렌치코트</option>
                                            <option>패딩</option>
                                            <option>코트</option>
                                            <option>바람막이</option>
                                            <option>플리스</option>
                                            <option>집업</option>
                                        </select>
                                    </span>
                                    <span>
                                         <input type="text" placeholder="브랜드를 입력하세요" class="textarea2" style="margin-bottom:29px"/>
                                    </span>
                                    <span>
                                        <input type="button" class="outer-cancel-btn" value="x" style="position:relative; bottom:4px"></input>
                                    </span>
                                </div>
                                <div class="shoes" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>신발</option>
                                            
                                        </select>
                                    </span>
                                    <span>
                                        <input type="text" placeholder="브랜드를 입력하세요" class="textarea2" style="margin-bottom:29px"/>
                                    </span>
                                    <span>
                                        <input type="button" class="shoes-cancel-btn" value="x" style="position:relative; bottom:4px"></input>
                                    </span>
                                </div>
                                <div class="acc" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>악세사리 카테고리 선택</option>
                                            <option>장갑</option>
                                            <option>목도리</option>
                                            <option>모자</option>
                                            <option>양말</option>
                                            <option>벨트</option>
                                            <option>시계</option>
                                            <option>안경</option>
                                            <option>가방</option>
                                            <option>귀걸이</option>
                                            <option>목걸이</option>
                                            <option>팔찌</option>
                                            <option>반지</option>
                                            <option>발찌</option>
                                        </select>
                                    </span>
                                    <span>
                                        <input type="text" placeholder="브랜드를 입력하세요" class="textarea2" style="margin-bottom:29px"/>
                                    </span>
                                    <span>
                                        <input type="button" class="acc-cancel-btn" value="x" style="position:relative; bottom:4px"></input>
                                    </span>
                                </div>
                            </div>
                        </div>
				    </div> 
           </div>
			
				
				
			<div id="picture-wrapper">
	            <div id="insert-picture">
                   
                	<label for="uploadFile">
                        <div id="input_wrap" class="input_wrap" onclick="onclick=document.all.file.click()">
		                    <div style="vertical-align:middle;padding:180px 0px 180px 0px">
			                    <span style="color:#707070">
			                        <span style="padding:5px"><img src="/resources/images/icon/camera.png" style="width:15px; height:15px">
			                    </span>
			                    <span>
		                        	사진을 등록해주세요<pre>
		                        	</pre>(*최대 10장까지)
	                        	</span>
	                        </div>
                        </div>
                       	<div class="imgs_wrap">	
                       		<div id="preview">
                       		
                       		</div>
	                    </div>
	                   
						<input style="display: none" type="file" name="uploadFile" id="uploadFile" multiple/>
				              	
                    
	            </div>
	            <div id="insert-info">
	                <div id="coordi-info2">
	                    <textarea placeholder="코디설명을 입력하세요" class="textarea" ></textarea>
	                </div>
	                
					<div class="tr_hashTag_area">
							<div class="form-group">
							    <input type="hidden" value="" name="tag" id="rdTag" />
							</div>
							<ul id="tag-list">
							<div class="form-group" style="display:inline">
								<input type="text" id="tag" size="7" placeholder="# 키워드" value="" style="border:none;width:70px;height:25px;border-radius:20px;background-color:#F5F5F5;padding-left:15px"/>
							</div>
							</ul>
					</div>
	            </div>
			</div>
			</form>
			<div id="coordi-post">
				<input type="submit" class="btn-style-mint" value="등록"></input>
			</div>
			
   		</div>
   	
   	
	<script>
			$('.weather').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.weather').not(this).css('background-color','rgba(0, 0, 0, 0)');
					$('.weather').not(this).css('color','#707070');
					$(this).css('color','#FFFFFF')
					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)');
					$(this).css('color','#707070')
				}
			})
			
			$('.gender').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.gender').not(this).css('background-color','rgba(0, 0, 0, 0)');
					$('.gender').not(this).css('color','#707070');
					$(this).css('color','#FFFFFF')
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$(this).css('color','#707070')
				}
			})

			$('.top-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.top').show(200);
					$(this).css('color','#FFFFFF')
					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.top').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('.bottom-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.bottom').show(200);
					$(this).css('color','#FFFFFF')
					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.bottom').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('.outer-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.outer').show(200);
					$(this).css('color','#FFFFFF')
					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.outer').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('.shoes-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.shoes').show(200);
					$(this).css('color','#FFFFFF')
					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.shoes').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('.acc-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.acc').show(200);
					$(this).css('color','#FFFFFF')
					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.acc').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			//상의 취소버튼
			$('.top-cancel-btn').click(function(){
					$('.top-btn').css('background-color','rgba(0, 0, 0, 0)');
					$('.top').hide(200);
					$('.top-btn').css('color','#707070')
			})
			
			//하의 취소버튼
			$('.bottom-cancel-btn').click(function(){
					$('.bottom-btn').css('background-color','rgba(0, 0, 0, 0)');
					$('.bottom').hide(200);
					$('.bottom-btn').css('color','#707070')
			})
			
			//아우터 취소버튼
			$('.outer-cancel-btn').click(function(){
					$('.outer-btn').css('background-color','rgba(0, 0, 0, 0)');
					$('.outer').hide(200);
					$('.outer-btn').css('color','#707070')
			})
			
			//신발 취소버튼
			$('.shoes-cancel-btn').click(function(){
					$('.shoes-btn').css('background-color','rgba(0, 0, 0, 0)');
					$('.shoes').hide(200);
					$('.shoes-btn').css('color','#707070')
			})
			
			//악세사리 취소버튼
			$('.acc-cancel-btn').click(function(){
					$('.acc-btn').css('background-color','rgba(0, 0, 0, 0)');
					$('.acc').hide(200);
					$('.acc-btn').css('color','#707070')
			})
			
			
			//해시태그
			 $(document).ready(function () {
	        var tag = {};
	        var counter = 0;

	        // 입력한 값을 태그로 생성한다.
	        function addTag (value) {
	            tag[counter] = value;
	            counter++; // del-btn 의 고유 id 가 된다.
	        }

	        // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	        function marginTag () {
	            return Object.values(tag).filter(function (word) {
	                return word !== "";
	            });
	        }
	    
	        // 서버에 제공
	        $("#tag-form").on("submit", function (e) {
	            var value = marginTag(); // return array
	            $("#rdTag").val(value); 

	            $(this).submit();
	        });

	        $("#tag").on("keypress", function (e) {
	            var self = $(this);

	            //엔터나 스페이스바 눌렀을때 실행
	            if (e.key === "Enter" || e.keyCode == 32) {

	                var tagValue = self.val(); // 값 가져오기

	                // 해시태그 값 없으면 실행X
	                if (tagValue !== "") {

	                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
	                    var result = Object.values(tag).filter(function (word) {
	                        return word === tagValue;
	                    })
	                
	                    // 해시태그가 중복되었는지 확인
	                    if (result.length == 0) { 
	                        $("#tag-list").append("<li class='tag-item' style='cursor:pointer; display:inline;border:none;width:90px;height:35px;border-radius:20px;background-color:#F5F5F5;margin:5px;color:#C8C8C8'>#  "+tagValue+"<span class='del-btn' idx='"+counter+" style='color:#FFFFFF'>  </span></li>");
	                        addTag(tagValue);
	                        self.val("");
	                    } else {
	                        
	                    }
	                }
	                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
	            }
	        });

	        // 삭제 버튼 
	        // 인덱스 검사 후 삭제
	        $(document).on("click", ".del-btn", function (e) {
	            var index = $(this).attr("idx");
	            tag[index] = "";
	            $(this).parent().remove();
		        });
			});
			
			
			
			
			
			

			//사진업로드
			 $(document).ready(function (e){
				    $("input[type='file']").change(function(e){

				      //div 내용 비워주기
				      $('#preview').empty();

				      var files = e.target.files;
				      var arr =Array.prototype.slice.call(files);
				      
				      //업로드 가능 파일인지 체크
				      for(var i=0;i<files.length;i++){
				        if(!checkExtension(files[i].name,files[i].size)){
				          return false;
				        }
				      }
				      
				      preview(arr);
				      
				      readImage(this);
				      
				      
				    });//file change
				    
				    function checkExtension(fileName,fileSize){

				      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
				      var maxSize = 20971520;  //20MB
				      
				      if(fileSize >= maxSize){
				        alert('파일 사이즈 초과');
				        $("input[type='file']").val("");  //파일 초기화
				        return false;
				      }
				      
				      if(regex.test(fileName)){
				        alert('업로드 불가능한 파일이 있습니다.');
				        $("input[type='file']").val("");  //파일 초기화
				        return false;
				      }
				      return true;
				    }
				    
				    
				    function readImage(input){
				    	
				    	 var file = input.files[0];
				    	 
				    	
				    	 var img = document.createElement("img");
				    	 img.style.width="100%";
				    	 img.style.height="100%";
				    	
				    	 img.src = URL.createObjectURL(file);
				    	 
				    	 var inputWrap = document.getElementById("input_wrap");
				    	 inputWrap.html();
				    	 console.log(inputWrap);
				    	 inputWrap.appendChild(img);
				    	 
				    	
				    	  
				    	
				    }
				    
				    
				    function preview(arr){
				    	
				    	
				    	
				    	
				    	
				      arr.forEach(function(f){
				        
				        //파일명이 길면 파일명...으로 처리
				        var fileName = f.name;
				        if(fileName.length > 10){
				          fileName = fileName.substring(0,7)+"...";
				        }
				        
				        //div에 이미지 추가
				        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
				        
				        //이미지 파일 미리보기
				        if(f.type.match('image.*')){
				          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
				            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
				            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
				            str += '</li></div>';
				            $(str).appendTo('#preview');
				         	
				          
				            
				            
				          } 
				          reader.readAsDataURL(f);
				        }else{
				          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
				          $(str).appendTo('#preview');
				        }
				        
				    
				      });//arr.forEach
				    }
				  });
			 

	</script>
	
	<!-- Channel Plugin Scripts -->

<!-- End Channel Plugin -->
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>

</body>
</html>-