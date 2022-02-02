<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('로그인 실패 (실패 사유: ID 또는 PW를 재확인 해주세요)');
		location.replace('/member/loginPage.do');
		
	</script>
</body>
</html>