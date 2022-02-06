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
<link rel="stylesheet" href="/resources/css/insertStyle.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/resources/js/postInsert.js"></script>
</head>
<body>
	
	<div id="wrap" style="height:auto;overflow:auto">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div id="content">
	
		<div id="title">
			<p style="font-size: 25px; color:#707070">잇템작성</p>
		</div>
				
		<div id="info-wrapper">
                <input type="checkbox" id="info-check">
                <label for="info-check">
                    <span style="color:#707070;">
                        <span style="padding:5px"><img src="/resources/images/icon/pen.png" style="width:15px; height:15px"></span><b>필수 입력 정보</b>
                    </span>
                    <span style="color:#C8C8C8">
                        		 잇템을 추천하기 위한 정보이니 최대한 꼼꼼하게 작성해주세요<img src="/resources/images/icon/down.png" style="width:15px; height:15px; opacity:0.5; float:right">
                    </span>
                </label>
				<div class="info-detail">
                       
                    <div class="togglebox" style="border-top:solid 1px #D9D9D9;height:140px">
                           <div class="subject">
                               <p>성별</p>
                           </div>
	                       <a>
	                          <div class="gender">여자</div>
	                       </a>
	                        <a>
	                           <div class="gender">남자</div>
	                        </a>
	                        <a>
	                           <div class="gender">공용</div>
	                       </a>
                     </div>

						<div id="coordi-info1" style="height:230px">
                            <div class="subject">
                                   <span>
                                       	의상 정보 추가
                                   </span>
                                   <span style="font-size: 14px;color:#C8C8C8">  
                                       	한 가지만 추가가 가능합니다.
                                   </span>
                            </div>

                            <div class="select-category">
                               <div class="togglebox">
	                        	   <a>
	                                 	<div id="top-btn" class="clothes-btn">상의</div>
	 
	                               </a>
	                               <a>
	                                   <div id="bottom-btn"  class="clothes-btn">하의</div>
	
	                               </a>
	                               <a>
	                                   <div id="outer-btn"  class="clothes-btn">아우터</div>
	                               </a>
	                               <a>
	                                   <div id="shoes-btn"  class="clothes-btn">신발</div>
	                               </a>
	                               <a>
	                                   <div id="acc-btn"  class="clothes-btn">악세사리</div>
	                               </a>
                                </div>
                            </div>					

                            <div id="select-category2">
                                <div class="top" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>상의 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2" placeholder="브랜드를 입력하세요" style="margin-bottom:27px"></textarea>
                                    </span>
                                    <span>
                                        <input type="button" class="top-cancel-btn" value="x"></input>
                                    </span>
                                </div>
                                <div class="bottom" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>하의 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2" placeholder="브랜드를 입력하세요" style="margin-bottom:27px"></textarea>
                                    </span>
                                    <span>
                                        <input type="button" class="bottom-cancel-btn" value="x"></input>
                                    </span>
                                </div>
                                <div class="outer" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>아우터 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2" placeholder="브랜드를 입력하세요" style="margin-bottom:27px"></textarea>
                                    </span>
                                    <span>
                                        <input type="button" class="outer-cancel-btn" value="x"></input>
                                    </span>
                                </div>
                                <div class="shoes" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>신발 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2" placeholder="브랜드를 입력하세요" style="margin-bottom:27px"></textarea>
                                    </span>
                                    <span>
                                        <input type="button" class="shoes-cancel-btn" value="x"></input>
                                    </span>
                                </div>
                                <div class="acc" style="display:none">
                                   <span>
                                        <select class="select">
                                            <option>악세사리 카테고리 선택</option>
                                        </select>
                                    </span>
                                    <span>
                                        <textarea class="textarea2" placeholder="브랜드를 입력하세요" style="margin-bottom:27px"></textarea>
                                    </span>
                                    <span>
                                        <input type="button" class="acc-cancel-btn" value="x"></input>
                                    </span>
                                </div>
                            </div>
                        </div>
 
                           
                           
                            <div class="togglebox" style="height:300px">
	                           <div class="subject">
	                               <p>아이템 상세정보</p>
	                           </div>
	                           <div style="height:80%;padding-top:10px">
		                           	<div class="item-info2">
		                           		<div>
		                           			상품명
		                           		</div>
		                           		<div>
		                           			<input type="text" class="textarea2" placeholder="상품명 또는 상품 코드를 입력하세요" style="margin-bottom:27px"></input>
		                           		</div>
		                           	</div>
		                           	<div class="item-info2">
		                           		<div>
		                           			색상
		                           		</div>
		                           		<div>
		                           			<input type="text" class="textarea2" placeholder="구매한 색상을 입력하세요" style="margin-bottom:27px"></input>
		                           		</div>
		                           	</div>
		                           	<div class="item-info2">
		                           		<div>
		                           			구매사이즈
		                           		</div>
		                           		<div>
		                           			<input type="text" class="textarea2" placeholder="구매한 사이즈를 입력하세요" style="margin-bottom:27px"></input>
		                           		</div>
		                           	</div>
        
	                           </div>
                                    
                     		</div>
                            
                            <div class="togglebox" style="height:180px">
	                           <div class="subject">
	                               <p>사용자 정보</p>
	                           </div>
		                      <div style="padding-top:10px">
		                           	<div class="item-info2">
		                           		<div>
		                           			키
		                           		</div>
		                           		<div>
		                           			<input type="text" class="textarea2" placeholder="키를 입력하세요" style="margin-bottom:27px">
		                           				<a style="position:relative;bottom: 5px;x">cm</a>
		                           			
		                           			
		                           		</div>
		                           	</div>
		                           	<div class="item-info2">
		                           		<div>
		                           			정사이즈
		                           		</div>
		                           		<div>
		                           			<input type="text" class="textarea2" placeholder="평소에 착용하는 사이즈를 입력하세요" style="margin-bottom:27px"></input>
		                           		</div>
		                           	</div>
	                           </div>
                     		</div>	

				    </div> 
           </div>
			
				
				
			<div id="picture-wrapper">
	            <div id="insert-picture">
                    
                        <div class="input_wrap" onclick="onclick=document.all.file.click()">
		                    <div style="vertical-align:middle;padding:180px 0px 180px 0px">
			                    <span style="color:#707070;">
			                        <span style="padding:5px"><img src="/resources/images/icon/camera.png" style="width:15px; height:15px">
			                    </span>
			                    <span>
		                        	사진을 등록해주세요<pre>
		                        	</pre>(*최대 10장까지)
	                        	</span>
	                        </div>
                        </div>
                       	<div class="imgs_wrap">	
                       		<div id="multipleContainer">
                       		
                       		</div>
	                    </div>
	                   
						<input style="display: block;display:none" type="file" name="file" id="file" id="inputMultipleImage" multiple>
							
                    	
                    
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
			
			<div id="coordi-post">
				<button class="btn-style-mint">등록</button>
			</div>
		
   	</div>
   	
	<script>
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
	
			$('#top-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.top').show(200);
					$('.bottom').hide(200);
					$('.outer').hide(200);
					$('.shoes').hide(200);
					$('.acc').hide(200);
					$(this).css('color','#FFFFFF');
					$('#bottom-btn').css('background-color','#FFFFFF');
					$('#bottom-btn').css('color','#707070');
					$('#outer-btn').css('background-color','#FFFFFF');
					$('#outer-btn').css('color','#707070');
					$('#shoes-btn').css('background-color','#FFFFFF');
					$('#shoes-btn').css('color','#707070');
					$('#acc-btn').css('background-color','#FFFFFF');
					$('#acc-btn').css('color','#707070');

				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.top').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('#bottom-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.bottom').show(200);
					$('.top').hide(200);
					$('.outer').hide(200);
					$('.shoes').hide(200);
					$('.acc').hide(200);
					$(this).css('color','#FFFFFF');
					$('#top-btn').css('background-color','#FFFFFF');
					$('#top-btn').css('color','#707070');
					$('#outer-btn').css('background-color','#FFFFFF');
					$('#outer-btn').css('color','#707070');
					$('#shoes-btn').css('background-color','#FFFFFF');
					$('#shoes-btn').css('color','#707070');
					$('#acc-btn').css('background-color','#FFFFFF');
					$('#acc-btn').css('color','#707070');

					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.bottom').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('#outer-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.outer').show(200);
					$('.top').hide(200);
					$('.bottom').hide(200);
					$('.shoes').hide(200);
					$('.acc').hide(200);
					$(this).css('color','#FFFFFF');
					$('#bottom-btn').css('background-color','#FFFFFF');
					$('#bottom-btn').css('color','#707070');
					$('#top-btn').css('background-color','#FFFFFF');
					$('#top-btn').css('color','#707070');
					$('#shoes-btn').css('background-color','#FFFFFF');
					$('#shoes-btn').css('color','#707070');
					$('#acc-btn').css('background-color','#FFFFFF');
					$('#acc-btn').css('color','#707070');

					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.outer').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('#shoes-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.shoes').show(200);
					$('.top').hide(200);
					$('.bottom').hide(200);
					$('.outer').hide(200);
					$('.acc').hide(200);
					$(this).css('color','#FFFFFF');
					$('#bottom-btn').css('background-color','#FFFFFF');
					$('#bottom-btn').css('color','#707070');
					$('#outer-btn').css('background-color','#FFFFFF');
					$('#outer-btn').css('color','#707070');
					$('#top-btn').css('background-color','#FFFFFF');
					$('#top-btn').css('color','#707070');
					$('#acc-btn').css('background-color','#FFFFFF');
					$('#acc-btn').css('color','#707070');

					
				}else{
					$(this).css('background-color','rgba(0, 0, 0, 0)')
					$('.shoes').hide(200);
					$(this).css('color','#707070')
				}
			})
			
			$('#acc-btn').click(function(){
				var color = $(this).css('background-color');
				
				if(color==='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#A9D4D9');
					$('.acc').show(200);
					$('.top').hide(200);
					$('.outer').hide(200);
					$('.shoes').hide(200);
					$('.bottom').hide(200);
					$(this).css('color','#FFFFFF');
					$('#bottom-btn').css('background-color','#FFFFFF');
					$('#bottom-btn').css('color','#707070');
					$('#outer-btn').css('background-color','#FFFFFF');
					$('#outer-btn').css('color','#707070');
					$('#shoes-btn').css('background-color','#FFFFFF');
					$('#shoes-btn').css('color','#707070');
					$('#top-btn').css('background-color','#FFFFFF');
					$('#top-btn').css('color','#707070');

					
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
			

			function readMultipleImage(input) {
			    const multipleContainer = document.getElementById('multipleContainer');
			    
			    if(input.files) {
			        console.log(input.files);
			        const fileArr = Array.from(input.files);
			        const $colDiv1 = document.createElement('div');
			        const $colDiv2 = document.createElement('div');
			        $colDiv1.classList.add('column');
			        $colDiv2.classList.add('column');
			        fileArr.forEach((file, index) => {
			            const reader = new FileReader();
			            const $imgDiv = document.createElement('div'); 
			            const $img = document.createElement('img');
			            $img.classList.add('image');
			            
			            const $label = document.createElement('label');
			            $label.classList.add('image-label');
			            $label.textContent = file.name;
			            $imgDiv.appendChild($img);
			            $imgDiv.appendChild($label);
			            reader.onload = e => {
			                $img.src = e.target.result;
			                
			            }
			            
			            console.log(file.name)
			            if(index % 2 == 0) {
			                $colDiv1.appendChild($imgDiv);
			            } else {
			                $colDiv2.appendChild($imgDiv);
			            }
			            
			            reader.readAsDataURL(file);
			        });
			        multipleContainer.appendChild($colDiv1);
			        multipleContainer.appendChild($colDiv2);
			    }
			};
			// 이벤트 리스너
			document.getElementById('inputMultipleImage').addEventListener('change', (e) => {
			    readMultipleImage(e.target);
			})
			
	</script>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>

</body>
</html>