<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/common/common.css">
<link rel="stylesheet" href="/resources/common/header.css">
</head>
<style>


#btn
{
width: 120px;
height:50px;
background-color:#A9D4D9;
color:white;
border-radius: 5px 5px 5px 5px;
font-size:18px;
border-color:#A9D4D9;
margin: 37px 0px 0px 612px;
}
</style>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content" style="border:1px solid white;">
	
	<table style=
	"line-height: 90px; width:100%;
	margin:40px 0px 0px 0px;
	color:#707070;
	border-bottom: 1px solid #C8C8C8;">
		<tr style="font-size:20px;" >
			<td colspan="4" style="font-weight:bold;">택배파업으로 인한 배송지연</td>
		</tr>
		<tr style="border-top: 1px solid #C8C8C8; border-bottom: 1px solid #C8C8C8;">
			<td style="background-color:#F5F5F5; text-align:center; width:200px; ">작성자</td>
			<td style="width:472px; border-top: 1px solid #C8C8C8; border-bottom: 1px solid #C8C8C8; ">운영자</td>
			<td style="background-color:#F5F5F5;  text-align:center; width:200px;">작성일</td>
			<td style="width:472px; border-top: 1px solid #C8C8C8; border-bottom: 1px solid #C8C8C8;">2022/12/12</td>
		</tr>
		<tr >
			<td colspan="4">내용입니다. 내용이에요. 내용이지요.
무슨 내용을 적어야 하지
내용을 채워야 해
채워야해~~~~~~~~~~~~~~
화이팅~~~~~~!!
이 정도면 됐겠지 ㅎ.ㅎ
내용입니다. 내용이에요. 내용이지요.
무슨 내용을 적어야 하지
내용을 채워야 해
채워야해~~~~~~~~~~~~~~
화이팅~~~~~~!!
이 정도면 됐겠지 ㅎ.ㅎ</td>
		</tr>
	</table>
	
	
	
	<button id="btn">목록</button>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>