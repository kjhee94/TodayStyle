<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
</head>
<body>

	<script>
		alert('${requestScope.msg}');
		location.replace('${requestScope.location}');
	</script>

</body>
</html>