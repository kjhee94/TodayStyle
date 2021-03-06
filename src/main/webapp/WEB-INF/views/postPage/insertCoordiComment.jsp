<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel=" shortcut icon" href="/resources/images/favicon.ico">
<link rel="icon" href="/resources/images/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/css/postPage/postPage.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="/resources/common/common.js"></script>
</head>
<body>
	<div id="cmt-count">
              	댓글<span>${requestScope.map.cmtList.size() }</span>
           </div>
           <form id="commentForm" name="commentForm">
              <div class="cmt-input">
             		<div class="profile">
             			<c:choose>
	                        <c:when test="${sessionScope.member.filePath != null}">
	                        	<img src="${sessionScope.member.filePath}">
	                        </c:when>
                           	<c:otherwise>
                           		<img src="/resources/images/default/profile.jpg">
                           	</c:otherwise>
                       	</c:choose>
             		</div>
             		<div class="input-comment">
             			<input class="input-style" type="text" name="comment" value="" placeholder="댓글을 입력해주세요">
                  	<input id="commentInsertBtn" type="button" name="name" value="등록">
             		</div>
              </div>
              </form>
              
           <div id="cmt-list">
		<c:choose>
			<c:when test="${!requestScope.map.cmtlist.isEmpty}">
             	<c:forEach items="${requestScope.map.cmtList }" var="cl">
              	<div class="cmt-one" id="${cl.cmtNo }">
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
                  		<span class="cmt-nick"><a href="/myPage/userPage.do?userId=${cl.cmtWriter}">${cl.nickName}</a></span>
                  		<span class="cmt-content">${cl.cmtContent}</span>
                  		<div class="cmt-info">
                  			<span>${cl.cmtTime}</span>
                  			<c:if test="${ cl.cmtWriter==sessionScope.member.userId}">
                  				<span class="cmt-delete">삭제</span>
                  			</c:if>
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
           <script>
              	$('#commentInsertBtn').click(function(){
              		var comment = $('.input-style').val();
              		var coordiNo=$('#like-scrap').attr('class');
              		$.ajax({
					url:"/coordi/insertComment.do",
                	data:{comment:comment,coordiNo:coordiNo},
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
              	                    <script>
                 $('.cmt-delete').click(function(){
                 	if(confirm("댓글을 삭제하시겠습니까?")){
                 		var cmtNo=$('.cmt-one').attr('id');
                  	var coordiNo=$('#like-scrap').attr('class');
                  	$.ajax({
   					url:"/coordi/deleteComment.do",
                   	data:{cmtNo:cmtNo,coordiNo:coordiNo},
                   	type:"get",
                   	success:function (result){
                   		$('#left-bottom-wrapper').html(result);
                   	},
                   	error:function(){
                   		console.log("통신실패");
                   		location.replace('/member/loginPage.do');
                   	}
   					
   				});
                 	}
                 	
                 });
       	 	</script>
		                
</body>
</html>