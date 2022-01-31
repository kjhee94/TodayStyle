<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%-- jQuery 라이브러리 --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>  
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
<link rel="stylesheet" href="/resources/css/board/board.css">
</head>
<body>
<style>
#set
{
font-size:16px;
}
.a
{
color:#707070;
}
.sets
{
width:120px;
height:40px;
border:1px solid #C8C8C8;
line-height:40px;
float:right;
margin: 0px 0px 20px 19px;
text-align:center;
border-radius: 10px 10px 10px 10px;
}
.current
{

}

</style>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
	
	<div style="width: 100%;height:110px;">
	<div style="width: 50%; height:100%;  float:left;">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">공지사항</li><li class="tab-link" data-tab="tab-2">자주 묻는 질문</li>
	</ul>
	</div>
	<div id="div" style="width: 50%; height:100%;  float:right;">
	
	</div>

	<div id="tab-1" class="tab-content current">
		
		<div class="notice">
		<div class="box-search d-flex justify-content-center h-100">
					<div class="searchbar" style="float:right;">
						<input style="position:relative; width:300px; height:40px; margin: 0px 0px 20px 0px;" class="search_input" type="text" name="" placeholder="검색어를 입력하세요">
						<a href="" class="search_icon" style="position:absolute; right:325px; top:225px; color:#707070;"><i class="fas fa-search"></i></a>
					</div>
				</div>
	</div>
		
			<table style="text-align: center;
	line-height: 90px;
	border-top: 1px solid #707070;
	border-spacing: 0px;
	width: 100%;">
			<thead style="font-size:18px;
	color:#707070; font-weight:bold;">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			</thead>
			
			<tbody>
			
			
			<tr style="border-bottom: 1px solid #C8C8C8;
	font-size:16px;
	color:#707070;
	border-top: 1px solid #C8C8C8;">
				<td>1</td>
				<td style="text-align:left;"><a href="/board/detailPage.do" style="color:#707070; text-decoration:none;">택배 파업으로 배송 지연</a></td>
				<td>운영자</td>
				<td>2022.02.11</td>
			</tr>
			
			
			<tr>
				<td>2</td>
				<td style="text-align:left;" >택배 파업으로 배송 지연</td>
				<td>운영자</td>
				<td>2022.02.11</td>
			</tr>
			
			<tr>
				<td>3</td>
				<td style="text-align:left;">택배 파업으로 배송 지연</td>
				<td>운영자</td>
				<td>2022.02.11</td>
			</tr>
			</tbody>
			</table>
		</div>
	</div>



	<div id="tab-2" class="tab-content">
		<div class="faq">
		
		<div id="set">
		<a href="" class="a"><div class="sets">게시글</div></a>
		<a href="" class="a"><div class="sets">회원/정보</div></a>
		<a href="" class="a"><div class="sets">전체</div></a>
		</div>
		
		<table style="text-align: center;
	line-height: 90px;
	border-top: 1px solid #707070;
	border-spacing: 0px;
	width: 100%;">
		<tr style="border-bottom: 1px solid #C8C8C8;
	font-size:16px;
	color:#707070;
	border-top: 1px solid #707070;">
			<td style="font-weight:bold;">회원/변경</td>
			<td style="text-align:left;"><span style="font-size:18px; color:#A9D4D9; font-weight:bold;">Q</span><span style="margin: 0px 0px 0px 19px;">정보 변경 어떻게 해?</span></td>
			<td><span class="glyphicon glyphicon-chevron-down Icon"></span>
			<span class="glyphicon glyphicon-chevron-up Icon" style="display:none"></span></td>
		</tr>
		
		<tr style="display:none;  background-color:#A9D4D9"">
   			 <td></td>
   			 <td style="text-align:left;"><span style="color:#71A4AA; font-weight:bold; font-size:18px;">A</span><span style="margin: 0px 0px 0px 19px;">얼마든지 변경 가능합니다.</span></td>
   			 <td></td>
  		</tr>
  		
  		
  		
  		
  		<tr>
			<td>회원/변경</td>
			<td style="text-align:left;"><span style="font-size:18px; color:#A9D4D9; font-weight:bold;">Q</span><span style="margin: 0px 0px 0px 19px;">정보 변경 어떻게 해?</span></td>
			<td><span class="glyphicon glyphicon-chevron-down Icon"></span>
			<span class="glyphicon glyphicon-chevron-up Icon" style="display:none"></span></td>
		</tr>
		
		<tr style="display:none;  background-color:#A9D4D9"">
   			 <td></td>
   			 <td style="text-align:left;"><span style="color:#71A4AA; font-weight:bold; font-size:18px;">A</span><span style="margin: 0px 0px 0px 19px;">얼마든지 변경 가능합니다.</span></td>
   			 <td></td>
  		</tr>
  		
  		
  		<tr>
			<td>회원/변경</td>
			<td style="text-align:left;"><span style="font-size:18px; color:#A9D4D9; font-weight:bold;">Q</span><span style="margin: 0px 0px 0px 19px;">정보 변경 어떻게 해?</span></td>
			<td><span class="glyphicon glyphicon-chevron-down Icon"></span>
			<span class="glyphicon glyphicon-chevron-up Icon" style="display:none"></span></td>
		</tr>
		
		<tr style="display:none;  background-color:#A9D4D9"">
   			 <td></td>
   			 <td style="text-align:left;"><span style="color:#71A4AA; font-weight:bold; font-size:18px;">A</span><span style="margin: 0px 0px 0px 19px;">얼마든지 변경 가능합니다.</span></td>
   			 <td></td>
  		</tr>
  		
		

  
</table>

		</div>
	</div>


	<script>
	$(document).ready(function(){
			$("ul.tabs li").click(function() {
				var tabId = $(this).attr("data-tab");

				$("ul.tabs li").removeClass("current");
				$(".tab-content").removeClass("current");
				
				$(this).addClass("current");
				$("#" + tabId).addClass("current");
				
			})

		
			});
	</script>
	
	<script>
	$(".Icon").on("click",function(){
		  var obj = $(this);
		  if( obj.hasClass("glyphicon-chevron-down") ){
		    obj.hide();
		    obj.next().show();            
		    obj.parent().parent().next().show();
		  }else{
		     obj.hide();
		     obj.prev().show();
		     obj.parent().parent().next().hide();
		  }
		});
	</script>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>