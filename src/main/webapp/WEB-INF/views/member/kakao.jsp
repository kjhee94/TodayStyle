<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <a href="https://kauth.kakao.com/oauth/authorize
    ?client_id=eaf07ec827c4faddcd0e74b74e5030a1
    &redirect_uri=http://127.0.0.1/member/kakaologin.do
    &response_type=code">로그인</a>
</body>
</html>